# Authorization and private acceptance storage

KARMENLOOP Team, Shanghai, China; info@karmenloop.com; https://karmenloop.com. The product uses a dedicated private GitHub receipt repository plus a company authorization service. The Koder Open CLI OAuth App, Device Flow and Ed25519 issuer are configured. The free HTTPS service is live at https://koder-open-issuer.onrender.com. An installed Mac client has completed real GitHub activation, receipt readback, signature verification and signed renewal. Platform acceptance is recorded separately in VALIDATION.md.

## Implemented sequence

1. The client displays the four full required documents, each version and SHA-256 digest. Installation requires explicit acceptance before runtime files are copied; model use has a separate signed-license gate.
2. The owner accepts all current documents and the disclosed minimal receipt transmission. A changed bundle or missing document stops the flow.
3. A registered GitHub OAuth application's device flow requests a user code. It requests no repository scopes from the customer. GitHub may still show permissions previously granted to that application; the user should inspect them. Polling respects the supplied interval, expiry and `slow_down`. Device codes and access tokens remain in process memory.
4. The client sends the OAuth token and bounded acceptance payload over HTTPS to the configured publisher issuer. The service independently calls GitHub `/user`; it never trusts a submitted login or numeric ID.
5. The service verifies the configured repository is private on every attempt. It stores the exact publisher document archive under `terms/<bundle-digest>.json`, then an idempotent minimal receipt under `receipts/<receipt-id>.json`. It refuses extra customer fields. No public issue, gist, Star or customer repository write is used.
6. Only after a confirmed repository write or matching existing record does the service issue an Ed25519-signed, installation-, product-, binary-version- and terms-bound personal-use license. The client verifies the signature before persisting it. Local JSON changes cannot issue a valid license.
7. The current license lease lasts at most 24 hours. Operational requests renew it automatically when less than one hour remains or it has expired, within a fixed 30-day renewal window. Renewal sends only the signed license to `/v1/renew`; the issuer verifies it, rechecks repository privacy, checks account revocation and matches the stored receipt before signing another lease. Renewal never extends the original renewal deadline. A valid lease may continue through network loss until expiry; an explicit service rejection clears it locally. At the fixed deadline or after required document/binary changes, GitHub sign-in is required again. Local sign-out is not deletion of remote evidence.

The receipt contains product/version, numeric GitHub ID and login, random installation ID, required-document versions/digests, a server timestamp and receipt ID. It contains no key, skill text, task content, hardware identifier, IP profile or contact list. The full archived legal text is company-authored text, not a user's uploaded material.

## Prepare deployment

Create an OAuth App owned by the intended publisher and enable device flow. The Client ID is a public identifier; the device flow does not embed a client secret. Provision a dedicated private repository and restrict staff access. Give the service a repository-scoped Contents read/write credential through a deployment secret manager. Never include that publisher credential or the signing private key in a client, public repository, release, build log or support message.

Generate an Ed25519 signing key once in a protected location. Managed Render hosting binds `service/server.mjs` to `0.0.0.0:$PORT` behind the provider HTTPS edge; standalone hosting defaults to loopback behind your own TLS reverse proxy. Failure responses do not include credentials. See PUBLISHER_RENDER.md for the exact managed-host settings. Configure:

| Service setting | Purpose |
| --- | --- |
| `KODER_RECEIPT_REPOSITORY` | The actual `owner/private-repository` |
| `KODER_RECEIPT_TOKEN` | Server-only repository Contents credential |
| `KODER_SIGNING_KEY_FILE` | Restricted server-only signing-key file |
| `KODER_ISSUER_PORT` | Loopback port, default 8381 |

The current `resources/activation.json` contains the real public `clientId`, HTTPS `serviceUrl` and Ed25519 PEM `publicKey`. The repository credential and private signing key are not build inputs. The service implementation is outside `src` and is excluded from customer SEA bundles.

Real collection must also have a documented retention schedule, deletion/redaction process for Git history and backups, a staffed account/revocation process, rate limiting, incident response, privacy notices for actual hosting/transfers and required legal review. The server-only `service/revoke.mjs <verified-numeric-GitHub-ID>` writes a private account revocation record using publisher credentials. It is not a customer command or a public administration endpoint. A recorded revocation blocks new issuance and renewal; an offline client can retain its already valid lease until expiry, so revocation is not instantaneous. A private Git repository is not automatically a compliant data lifecycle. Native-platform credential handling and live-account testing remain separate.

## Failure and recovery

An unknown write result issues no license. The next authorized attempt queries the same stable receipt path before writing, preventing duplicate receipts. A public repository, changed archive, mismatched existing receipt, failed private write, invalid signature, changed terms, expired lease or sign-out blocks operations. Signing failure after a successful receipt write preserves the receipt for reconciliation. Browser close or local sign-out cannot undo a completed GitHub write.

Configuration, skills and legal inspection remain available while activation is pending. License acceptance never grants model fees, shell commands, file access, channel messages or automatic learning. The original host retains its own permission authority.

Reference: [GitHub device authorization](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#device-flow). Fixtures cover protocol, automatic renewal, revocation, offline expiry and failure behavior. Deployed Mac activation and renewal have separate live evidence; no real account revocation was performed.
