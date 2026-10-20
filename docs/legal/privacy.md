# Privacy notice for Koder Open CLI

Version: 2026-10-20.1 — this Open CLI candidate has an account and authorization design distinct from the existing account-free Koder desktop product.

KARMENLOOP Team, Shanghai, China publishes this product. Contact info@karmenloop.com and https://karmenloop.com. No street address or incorporated entity is asserted.

## Information kept locally

Your role settings, imported skill text, explicit output rules, suggestions, evidence you enter and configuration versions are stored in the local data directory. Imported text is copied, not trained into a foundation model. Imports do not run scripts, install packages or follow linked files. Skills stay disabled until you explicitly enable them. Removing a skill removes the stored library copy; separate exports, your original source file and backups you made remain under your control. Role and space scopes have separate library records.

Preference suggestions do not automatically change a role. Clicking Apply writes an explicit, versioned configuration edit. You can inspect the evidence, reject or delete a suggestion, change the resulting setting and use configuration rollback. Automatic activity surveillance, sensitive-profile inference and background training are not active in this candidate. Do not provide another person's private records without authority.

Model credentials are read only from the credential environment variable you select when you start a text request. This candidate does not save that key, display it, send it to the publisher, or write it into model configuration. A process environment is not an encrypted credential vault; use a restricted launch environment and do not share it. The software refuses credential forwarding through HTTP redirects.

## Required identity and acceptance processing

Operational authorization requires GitHub sign-in. GitHub receives your sign-in and device-authorization interaction under its own privacy policy. The product requests identity access rather than repository write access from you. Existing permissions previously granted to the OAuth application may differ; inspect GitHub's authorization screen. A short-lived access token is held in process memory for identity verification and sent over HTTPS to the displayed publisher authorization endpoint. It is not stored in the receipt, product configuration, logs or license. Do not send a personal access token in a support message.

The publisher's authorization service revalidates the GitHub account and records only: product/version, numeric GitHub account ID and login, random installation ID, required-document versions and SHA-256 digests, the server acceptance timestamp and a stable receipt ID. GitHub private-repository contents are held by the publisher and GitHub; the product does not create a public issue, public commit or public gist for your acceptance. No chats, skills, documents, API keys, hardware identifiers, IP-derived profile or contact list is included. Hosting and GitHub can still see ordinary network connection metadata; this application does not intentionally include it in the acceptance receipt.

Recording this minimal receipt is a disclosed condition of this product's requested license, separate from optional learning and marketing. If you decline, you can read the documents and inspect local settings, but no operational license is issued. A check mark does not prove receipt delivery; the service must confirm a private repository write and return a verifiable signed authorization. License expiry limits offline access. Near expiry, or on an explicit renewal request, the client sends the signed license to the displayed company service to check its private receipt and account-revocation record. It sends no new skill or task content. Automatic renewal preserves the original 30-day renewal deadline; it does not create an endless grant. Keep local signed-license files private because they authorize renewal within that window. Real account removal and revocation still need the actual deployed service and cannot be promised by local-only tests.

## Model services and optional links

When you explicitly request a model response, the selected endpoint receives your task text, relevant role settings and enabled skill contents. That request may incur the provider's fees. The endpoint, model ID and credential reference are visible in settings. No automatic fallback sends your content or key to another host. Local Ollama or other compatible gateways can be configured explicitly; cloud credentials are never silently reused there. Multimodal, tool, channel and live-account capabilities require their own verification.

Company, support and GitHub Star links open only when selected. There are no third-party advertising pixels, compulsory stars or automatic feedback messages. Opening an external page exposes normal connection information to that service. The publisher does not receive task content through those links.

## Access, retention and rights

You can inspect local settings, skill copies, suggestions and authorization state and remove local copies. Local authorization files contain signed claims and minimal identifiers, not the GitHub access token. GitHub may retain private-repository history and backups after file deletion. Before real collection, the publisher must document a bounded retention period, authorized staff access, deletion/redaction procedure for Git history/backups, security incident handling and any required cross-border disclosures. The development candidate does not claim this operational process is deployed.

For access, correction, deletion, withdrawal, security issues or privacy complaints, email info@karmenloop.com. The publisher must respond under applicable law; mandatory rights and regulatory complaint routes are preserved. An imported skill, model response or accepting this notice cannot grant blanket rights over other people’s information.
