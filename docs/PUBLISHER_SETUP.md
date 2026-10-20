# Put the authorization service into operation

Use the four-stage publisher wizard for the current free acceptance deployment:

```sh
bash scripts/publisher-setup.sh
```

It stores public setup values in the ignored `.publisher-setup/config.env` and creates a public client-settings JSON. It does not capture a GitHub token, sign in for a customer, accept hosting terms, deploy a paid resource, or claim live activation. See [the detailed Render guide](PUBLISHER_RENDER.md) for each screen and recovery step.

The publisher OAuth App is **Koder Open CLI**, owned by **KarmenLoop**, public Client ID **Ov23li7TL02qaztlNEIc**. Device Flow is enabled. The homepage and unused redirect URI are `https://karmenloop.com/`. The device client needs no client secret and asks for no customer repository scope. The publisher's existing GitHub CLI login cannot substitute for a customer's approval.

The source repository `KarmenLoop/koder-open-cli-source` and dedicated receipt repository `KarmenLoop/koder-open-cli-receipts` are private. The Node issuer supports managed HTTPS hosting with `PORT` and explicit `KODER_ISSUER_HOST=0.0.0.0`. The standalone default remains `127.0.0.1:8381` behind your own TLS reverse proxy. Keep the systemd example for that alternative.

A GitHub Contents API acknowledgement alone is insufficient: acceptance now reads back both the exact company terms archive and matching minimal receipt before signing. Conflicting records, public repositories, wrong terms, missing identity or failed writes remain closed. Ed25519 signatures bind product, binary version, installation and current terms. The server owns the private key; clients carry only its public verification key. Renewals keep the original 30-day window, with leases of at most 24 hours.

The free acceptance service is live at `https://koder-open-issuer.onrender.com`. Its public health identity matches the local Ed25519 public key, App, version and terms. Native clients now contain that public configuration and must be rebuilt and accepted as installed clients. Keep auto-deployment disabled: changing the issuer version or terms without coordinating clients invalidates activation. Before customer launch, publish and implement the actual hosting, retention, staff-access, deletion and incident procedures. Do not claim production readiness from local tests.

For a read-only deployment preflight, run `node service/preflight.mjs` in the service's secret environment. Successful output includes only public key metadata and repository privacy; it performs no receipt write. `GET /healthz` returns public product/version, Client ID, terms digest and signing fingerprint. It never returns the signing key or repository token. Health readiness reflects the startup check, not a continuous GitHub outage guarantee; accept and renew recheck repository privacy on every request.

After the real service is up, create public settings with only `clientId`, `serviceUrl` and `publicKey`. Verify them with `node scripts/publisher-health.mjs .publisher-setup/public-settings.json`, then apply them with `node scripts/configure-activation.mjs .publisher-setup/public-settings.json`. Rebuild and test both native clients. A local flag or test key must never replace the signature gate.

Record the deployment revision, HTTPS origin, app owner, public Client ID, signing fingerprint, private receipt commit and native archive digests in a private acceptance receipt. Exclude tokens, signed claims, task text and customer skill contents. The installed Mac device flow has now passed signed activation with an idempotent private receipt. See VALIDATION.md for the current installed CLI/TUI and Windows results.
