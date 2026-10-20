# Free HTTPS issuer setup and customer acceptance

This guide is for the KARMENLOOP publisher. Customers only install the signed-key client, review the documents and approve their own GitHub device login. They do not create the issuer, receipt repository or signing key.

## Hosting decision and cost boundary

Use one **Render Free Node Web Service in Singapore** for acceptance. The repository includes `render.yaml`. No database, persistent disk, paid workspace, custom domain or credit card is required by this design. Use the provider-assigned `https://…onrender.com` origin first; add a company subdomain only after the service passes. Do not add a payment method or upgrade a plan as part of this procedure.

Official documentation checked on October 21, 2026:

| Option | Current free allowance | Fit for this service |
| --- | --- | --- |
| [Render Free](https://render.com/docs/free) | 750 running instance-hours per workspace/month; services sleep after 15 minutes of inactivity; bandwidth and build quotas also apply | Directly runs the existing Node issuer. One instance can fit within a calendar month. Wake the service before device sign-in. |
| [Cloudflare Workers Free](https://developers.cloudflare.com/workers/platform/pricing/) | 100,000 requests/day and 10 ms CPU per invocation | Good low-traffic alternative; the current Node HTTP/filesystem entry point has not been ported or accepted on Workers. No claim of current compatibility. |
| [Railway Free](https://docs.railway.com/pricing/free-trial) | $1 recurring credit/month after the initial trial | Credit is not a guarantee of an always-on Node service within zero cost. |
| [Fly.io trial](https://fly.io/docs/about/free-trial/) | 2 machine-hours or 7 days | An expiring trial does not meet continuing free use. |

No vendor's current free tier guarantees perpetual availability or unchanged terms. Without a payment method, Render can suspend services when an applicable free quota is exhausted. Do not defeat inactivity limits with keepalive traffic. Free services have no durable local disk; keep receipts on GitHub and the signing key in the platform's secret store. Render Free Postgres expires and is not part of this design.

For a future paid fallback, compare the then-current final bill rather than one headline. [Fly.io](https://fly.io/pricing/) lists small shared machines at roughly a few US dollars/month before storage, egress and regional variation; [Cloudflare Workers Paid](https://developers.cloudflare.com/workers/platform/pricing/) has a US$5/month minimum with usage charges and needs an accepted runtime port; [Render](https://render.com/pricing) directly runs this implementation at US$7/month for 0.5 CPU/512 MB compute, with other usage separate. None is authorized for purchase now, and this comparison is not a claim of a global minimum.

## Stage 1: product OAuth App

The product App has been registered in the KarmenLoop account:

- Name: **Koder Open CLI**
- Public Client ID: **Ov23li7TL02qaztlNEIc**
- Management page: `https://github.com/settings/applications/3949353`
- Homepage: `https://karmenloop.com`
- Redirect URI: `https://karmenloop.com/`, with wildcard matching disabled
- Device Flow: enabled
- User access token expiry: retained

The device flow uses GitHub's own `https://github.com/login/device` page; it does not serve a browser callback at the homepage. Do not generate a Client Secret for the native client. Registering an App is not a customer authorization or signed license. [GitHub setup](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/creating-an-oauth-app), [device flow](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#device-flow).

For a different publisher, use GitHub Settings → Developer settings → OAuth Apps → New OAuth App. The current UI labels the callback as **Redirect URI**. Set your own controlled company URL, enable Device Flow, and copy the public Client ID. Never reuse GitHub CLI's App ID as the product's identity.

## Stage 2: receipt credential

1. Confirm `KarmenLoop/koder-open-cli-receipts` is **Private**, initialized and has a default branch. The source repo is a different private repo.
2. In GitHub Settings → Developer settings → Personal access tokens → Fine-grained tokens, create a dedicated service token named `Koder Open issuer receipts`.
3. Set the resource owner to KarmenLoop and **Only select repositories** to `koder-open-cli-receipts`.
4. Grant only **Contents: Read and write**. Metadata read access is implicit. Do not select the source repo, workflow permission or every repository. Choose an expiry of at most 90 days and record the renewal date privately.
5. Complete credential creation yourself. Paste its value directly into the Render service's secret variable `KODER_RECEIPT_TOKEN`. Do not send it to chat, a public issue, a build input, a wizard field or an evidence log.

A successful preflight is read-only and cannot prove the credential can write. The first real acceptance must create and read back the terms archive and receipt. A public repository, invalid token or failed write prevents a license.

## Stage 3: signing and Render

Create a key once from the private source checkout, using a new directory with an existing parent:

```sh
node scripts/create-signing-key.mjs /your/private/location/koder-signing
```

The directory is mode 0700 and each key file is mode 0600 on macOS/Linux. The script refuses an existing directory. It prints only public metadata. Keep `signing-private.pem` and `render-signing-key-base64.txt` private. `signing-public.pem` is the only client build input. Back up the private key securely; reusing it across restarts is required. Do not rotate it as a fix for a deployment failure. A new key requires a coordinated client update.

In Render:

1. Log in, verify the company mailbox and review any account terms. These are account-owner actions. No subscription purchase is needed.
2. Connect GitHub using **Only select repositories → koder-open-cli-source**. Do not grant Render access to the receipts repo. The running service gets the separate fine-grained receipt token instead.
3. Choose **New → Blueprint** and the source repo's reviewed revision with `render.yaml`. Verify **Node**, **Singapore**, **Free**, and automatic deployment **off**. If Blueprint requires a paid feature for this account, create **New → Web Service** with the same settings instead; do not upgrade the workspace.
4. Use build command `node --check service/server.mjs`, start command `node service/server.mjs`, and health path `/healthz`. Node is pinned to `22.23.2`; `SKIP_INSTALL_DEPS=true` avoids unnecessary package installation. The runtime has no third-party dependencies.
5. Fill these service environment values:

| Variable | Value/source | Secret? |
| --- | --- | --- |
| `NODE_VERSION` | `22.23.2` | No |
| `SKIP_INSTALL_DEPS` | `true` | No |
| `KODER_ISSUER_HOST` | `0.0.0.0` | No |
| `PORT` | Render supplies this automatically | No |
| `KODER_RECEIPT_REPOSITORY` | `KarmenLoop/koder-open-cli-receipts` | No |
| `KODER_GITHUB_CLIENT_ID` | `Ov23li7TL02qaztlNEIc` | No |
| `KODER_RECEIPT_TOKEN` | Dedicated fine-grained credential | Yes |
| `KODER_SIGNING_KEY_BASE64` | Contents of `render-signing-key-base64.txt` | Yes |

Use **only one** signing input. A self-hosted service may instead use `KODER_SIGNING_KEY_FILE` pointing to a protected regular file. Managed secret-file permissions vary; the base64 secret avoids putting a private file in the repository or image. Do not set both forms.

6. Review secrets in the platform UI yourself and deploy the reviewed source revision. Startup performs a read-only repository check and refuses to listen if settings, key or repository privacy fail. A successful startup logs a generic listening state without secrets.
7. Open the actual provider-assigned HTTPS origin plus `/healthz`. It should return `ready: true`, a version matching `koder-open version`, the public Client ID, current terms digest and SHA-256 signing fingerprint. Startup readiness is not proof of a permanent GitHub connection. Accept/renew independently check it again.

[Render web services](https://render.com/docs/web-services), [environment variables](https://render.com/docs/configure-environment-variables), [Blueprint specification](https://render.com/docs/blueprint-spec).

## Stage 4: pin the service and accept the installed workflow

Create `.publisher-setup/public-settings.json` with exactly `clientId`, the real HTTPS `serviceUrl` origin, and the contents of the publisher's trusted `signing-public.pem` as `publicKey`. Do not copy a public key from an unknown server and call it trusted. The wizard writes this file from the local public key.

```sh
node scripts/publisher-health.mjs .publisher-setup/public-settings.json
node scripts/configure-activation.mjs .publisher-setup/public-settings.json
```

The first command sends no credential, receipt or material. It compares the server's public key fingerprint, App ID, binary version and terms against local trusted values. The second command changes the public resource and requires native rebuilds. Private PEM files are rejected, even though Node's generic `createPublicKey` can otherwise derive a public key from them.

Build and validate Mac ARM and Windows x64 separately, using the existing pinned toolchain and native workflow. Record the exact source commit and archive hashes. Installation still displays the four bundled documents and requires the user's acceptance. Do not replace an unsigned/unnotarized distribution warning with instructions to disable operating-system security.

Use one fresh synthetic data directory for each platform's acceptance. From the installed command:

```sh
koder-open version --json
koder-open auth wake --home /your/test/data --json
koder-open legal list
koder-open auth login --home /your/test/data --accept-terms DISPLAYED_BUNDLE_DIGEST
koder-open auth status --home /your/test/data --json
```

Use your actual data path and current displayed digest. Review the terms before using the acceptance flag. A free instance wake can take up to 60 seconds. A failed wake sends no GitHub token. If the issuer becomes unavailable after GitHub token exchange, Studio/TUI may explicitly retry the pending attempt; its token remains only in memory until that original device attempt expires. Logout cancels it. A closed CLI process cannot recover that memory and requires a fresh sign-in. Wait for the service to be healthy and run the wake command again explicitly; no automatic retry, endpoint switch or paid upgrade occurs. A mismatch requires coordinating the deployed version, terms, App or key, not bypassing verification. Perform device approval on GitHub as the intended account.

Before accepting activation, inspect the **private** GitHub file and commit. Confirm the exact document archive and minimal receipt match product/version, installation, terms digest and the GitHub numeric ID. Keep the private receipt reference out of public release notes. Verify renewal and sign-out. Run changed-terms, tampered-signature and revoked-account cases with a dedicated test installation/account or clearly labeled local fixtures; revoking the publisher's account can block all that account's installations.

For material ingestion and the model call:

1. Set a Chinese role name and a narrow synthetic work scope. Import `docs/handbook/examples/my-standard.md`, inspect it, enable it, and install the example output checks. Verify the good example passes and the bad one is blocked locally.
2. Configure Chat Completions, endpoint `https://api.deepseek.com/chat/completions`, account-approved model `deepseek-flash`, and credential variable name `KODER_DEEPSEEK_API_KEY`. Confirm the model ID from the account's current model list if it differs.
3. Supply a fresh key through a hidden local environment entry, never a command-line literal, a tracked file, a skill or chat. Remove the temporary environment value when done. A previously disclosed key should be rotated before use.
4. Run one small synthetic CLI task from that environment. Verify a real provider response passes the role's mechanical checks; a local canned answer is insufficient.
5. Launch `koder-open tui` with the **same** `--home`, role and space. Choose **Model and GitHub license → Wake and verify the authorization service** if needed; inspect authorized state. Choose **Run an authorized text task** and run a second small synthetic request. Return to **Feed skills and check outputs** to prove saved material is reused.
6. Close and reopen the client, confirm persistence, then sign out and confirm another operational request is rejected before the provider is called. Reinstall/uninstall acceptance must preserve user data. The Windows native CI local flow and ConPTY evidence remain distinct from an activated account/provider acceptance on Windows.

Public release publication follows these actual results. A successful build, local mock issuer, health response, saved model setting or OAuth App registration alone does not establish the complete customer journey.

## Recovery

| Symptom | Action |
| --- | --- |
| Email verification page | Verify the message sent to the company mailbox; do not share the link or code. |
| `ISSUER_STARTUP_FAILED` | Run the read-only preflight in the platform environment. Check secret names, base64/private-file exclusivity, key type and receipt-repo privacy. Do not log token values. |
| `ISSUER_IDENTITY_MISMATCH` | Match frozen server/client version, terms, Client ID and the trusted local public key. Redeploy or rebuild the correct revision. |
| `REQUEST_TIMEOUT` on a cold free service | Visit health, wait for wake, then retry `auth wake` explicitly before starting a fresh login. |
| HTTP 403 on activation | Check GitHub identity, current accepted documents, receipt token expiry, private repo and write/readback. Do not hand-create a license. |
| HTTP 429 / 503 | Honor the displayed delay; inspect GitHub/Render quotas and current capacity. Do not replay a tight polling loop. |
| Service redeployed and signatures fail | Restore the same private key. Key rotation requires deliberately rebuilding clients with the new trusted public key. |
| Render quota exhausted | Keep billing disabled. Wait for quota reset or assess a different free provider with its own accepted port. |

This candidate has a 16 KiB HTTP body cap, 45-second handler deadline, four active activation handlers and a 60/minute process-wide activation/renewal budget. Health checks do not call GitHub on every poll. These limits bound one acceptance instance; they are not a distributed production abuse-prevention system.

For a short DeepSeek task, add `--thinking disabled` when configuring Chat Completions, or choose the matching option in Studio or TUI. DeepSeek currently enables thinking by default. A small output limit may be exhausted before a complete answer; the client rejects that result as `MODEL_OUTPUT_INCOMPLETE`. Other endpoints retain their default unless the user explicitly selects this documented provider option. See [DeepSeek thinking mode](https://api-docs.deepseek.com/guides/thinking_mode/).

## Operate this acceptance service

The current dedicated receipt token expires on **November 20, 2026**. Before that date, the publisher must replace it with the same receipt-only Contents permissions, update `KODER_RECEIPT_TOKEN` in Render and restart the service. Run the public health comparison, then verify a signed renewal and receipt readback. Do not rotate the signing key during a repository-token renewal.

Keep manual deployment enabled. Review and pin the intended issuer revision before deploying; a binary version or terms change must coordinate issuer and client packages. The live clock fix uses one issuance timestamp for issue/expiry/deadline arithmetic. Its initial failed acceptance receipt is retained and subsequent matching acceptance reuses it.

No model credential is required by the issuer or this deployment. The owner declined uploading a model key to hosted CI. The Windows authorization workflow therefore downloads the public archive, feeds synthetic material, waits for a real company device approval and checks signed renewal **without a model call**. Local Windows users can configure their own key and perform the handbook’s CLI/TUI tests on their own machines.

This acceptance deployment does not establish production staffing, a retention/deletion schedule for Git history and backups, incident handling, legal review or an uptime commitment. Keep those as explicit launch gates. Free hosting can sleep or suspend under quota; use an intentional client wake and do not add keepalive traffic to defeat the free tier.
