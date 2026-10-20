# Development validation: 0.2.0-dev.6

Dev.6 corrects a failure discovered by the real Windows dev.5 public-download acceptance. Windows had embedded CRLF legal resources while the issuer hashed LF. The signature and terms gate correctly stayed closed. Dev.6 canonicalizes only CRLF line endings before displaying and hashing legal text, fixes checkout attributes, and adds an LF/CRLF regression which also proves changed wording still changes the digest. Both native manifests contain the same canonical terms digest.

| Area | Actual evidence | Limit |
| --- | --- | --- |
| Source | 119 passed, 0 failed on Mac Node 22.23.2 and native Windows CI | Self-checks |
| Mac Apple Silicon | 18 installer/runtime/distribution checks passed | Ad-hoc signing, no Apple notarization |
| Windows x64 | 8 installer checks, 12 download/local-use checks, installed-command ConPTY Chinese save/reopen and exit | Windows Server 2022 CI, not a physical customer machine |
| Deployed issuer | Free Render HTTPS, version dev.6, trusted App/key/terms health match | Startup readiness, no uptime guarantee |
| Mac live use | The dev.5 Mac live path passed. Dev.6 public-download activation and provider acceptance are pending and are not inferred from that older result. | Synthetic material only |
| Windows live use | Real dev.6 public-download device activation and renewal are pending; local CI is not substituted for that proof. | No real model request by owner choice |
| Handbook | 32 chapters, 23 editable examples; bundled and offline help | Exact platform results remain separate |

Build input: `81dba329d8197480115018812196ad17f784984a`. [Windows native run](https://github.com/KarmenLoop/koder-open-cli-source/actions/runs/39469148175) is in the private source repository. Mac SHA-256: `c60f02c5e699cc423a2b37b438506547bf16c45d915aea33f2f29fa1ae360be6`. Windows SHA-256: `e49e177551a593c744c01ed96d313be3c7a548fac9bfb7200766fd5425ca42e9`. Both match their checksum files. Canonical terms digest: `0f337cc023bd0c6ecfe8a416ae5791367001eca84086be7c466a98256781e081`.

## Activation and provider boundaries

The product GitHub App is **Koder Open CLI**, public Client ID `Ov23li7TL02qaztlNEIc`, with Device Flow enabled. The same free Singapore service and Ed25519 key are retained at https://koder-open-issuer.onrender.com. The deployed source is `81dba329d8197480115018812196ad17f784984a`. No Client Secret is placed in a client. No model credential is uploaded to GitHub Actions. The receipt-only service credential expires November 20, 2026 and needs publisher renewal.

The server writes and reads back the exact company terms archive and minimal private receipt before signing. A signed lease is bounded to 24 hours and renewal preserves its original fixed 30-day deadline. A changed binary version requires fresh device sign-in. Dev.5 is superseded; its signature and policy gates are not weakened for the old broken Windows asset.

DeepSeek uses `deepseek-flash` at the official Chat Completions endpoint. Explicit `thinking: disabled` avoids exhausting a short task budget on provider-default thinking. Requests remain capped at 256 output tokens for acceptance and contain only synthetic work text. Mechanical checks do not establish professional correctness. Incomplete responses are withheld without automatic retry.

## Preserved history and remaining gates

The first dev.5 installed Mac lease failed strict clock bounds; a single issuance timestamp fixed it, and the same receipt was reused. Its first 128-token provider request was withheld as incomplete. Earlier source fixtures, stale version/count expectations, a missing predecessor path, one installer envelope expiring during a concurrent build, and an installed Windows path error remain in private evidence. Final native tests ran after the build without relaxing their bounds. The real dev.5 Windows digest failure is preserved separately and is the reason for this new version. [Earlier dev.5 validation](validation-history/dev5.md).

Real account revocation is fixture-tested, not performed against the publisher account. Windows real model use, physical customer Windows machines, Intel Mac, Windows ARM64, Linux, publisher OS signing, Apple notarization and independent QA remain unverified. Production retention/deletion, staff access, incident handling, legal review and uptime operations are launch gates. External tools, connected business channels and unattended learning are not implemented. See [publisher setup and operation](PUBLISHER_RENDER.md).
