# Development validation: 0.2.0-dev.5

On October 21, 2026, the configured Mac and Windows x64 development packages passed their native local checks. This is development evidence, not independent production acceptance.

| Area | Actual evidence | Limit |
| --- | --- | --- |
| Source | 118 tests passed, 0 failed on Mac Node 22.23.2 and native Windows CI | Self-checks |
| Mac Apple Silicon | 18 installer/runtime/distribution checks passed, including real local HTTP download, consent, protected settings, fed skills, learning, predecessor upgrade/rollback and uninstall guards | Ad-hoc signing, no Apple notarization |
| Installed Mac live use | Product GitHub device flow, real private receipt write/readback, strict signature validation, renewal, CLI and TUI DeepSeek synthetic answers with required source phrase | No professional correctness or external-action claim |
| Windows x64 | 8 installer checks, 12 download/local-use checks and installed-command native ConPTY TUI save/reopen/exit | Windows Server 2022 CI, not a physical customer workstation |
| Windows provider | No real model call | Owner declined sending a model key to hosted CI |
| Handbook | 32 chapters, 23 editable examples, bundled help and a documentation-only offline ZIP | Platform results are recorded here rather than inferred from tutorial text |

Windows native CI: https://github.com/KarmenLoop/koder-open-cli-source/actions/runs/39466561992 (private source repository). Build input: `a5ab305ebd8cde62c8250b01c3e8735d6a8c4e7a`. Mac SHA-256: `fd988a1f451440c0d8f5bb1d3cef1229f8404656611d84d09661e85a95c34f7b`. Windows SHA-256: `8bc5de96dab1c4582b0701ff22d77eeb9a39a94088a964fd4b123c37f96f8238`. Both match their checksum files. Public download and live Windows device activation are the next separate acceptance step. No model credential is uploaded and no Windows provider request is claimed. The final documentation repack preserves identical src modules; public-download checks are recorded separately after publication.

## Live authorization and free hosting

Koder Open CLI is registered under KarmenLoop with Device Flow enabled and public Client ID `Ov23li7TL02qaztlNEIc`. The free Singapore Render issuer is live at https://koder-open-issuer.onrender.com. Automatic deployment is off. Its public health identity matches the real App, current terms and Ed25519 public fingerprint. The deployed clock-fix revision is `9739a88e7256ccbc21daa351f5a806947e07c36a`. The receipt-only Contents credential expires November 20, 2026; the publisher must renew it. No credential or signed customer claim is recorded in this document.

The first real installed activation created its receipt but failed strict lease validation. An advancing-clock regression reproduced issue/expiry/deadline values taken at different milliseconds. Capturing one issuance timestamp fixed the server; strict client limits were retained. The corrected deployment passed real activation and renewal. Reauthorization reused the same installation receipt; renewal preserved its identity and fixed deadline.

The first Mac DeepSeek request used 128 output tokens and provider-default thinking. It returned `MODEL_OUTPUT_INCOMPLETE`; no partial answer was released and no automatic retry occurred. Explicit documented `thinking: disabled` with a 256-token cap then produced checked complete answers through both CLI and TUI using only synthetic material. Thinking is opt-in for compatible Chat Completions endpoints. No model key was written into role settings, source or receipt storage.

## Preserved failures and scope

Earlier source checks caught stale version and chapter-count expectations, a too-broad terms fixture matcher and an HTTP deadline response writing headers twice. Initial native Mac acceptance found a missing predecessor-fixture path and an outdated 31-chapter expectation; those inputs were corrected. A later concurrent build caused one 15-second installer envelope to expire; final acceptance ran serially after the build and passed without increasing that limit. A Windows verification script initially looked outside the installed version directory; it was corrected to exercise the actual installed binary. Original failure logs remain in private task evidence.

Real account revocation is covered by fixtures, not a destructive test against the publisher account. Windows provider use, physical Windows devices, OS publisher signing, Apple notarization, other architectures and independent QA remain unverified. Production retention/deletion, incident handling, legal review and uptime operations remain launch gates. External tools, connected business channels and unattended study are not implemented here. Free hosting may sleep or suspend under quota. See [publisher operation and recovery](PUBLISHER_RENDER.md).

## Historical dev.4 validation snapshot

The following records describe the earlier frozen candidate, not dev.5 or the current publisher infrastructure state.

### Development validation: 0.2.0-dev.4

This file distinguishes working local paths, provider-adapter evidence and unfinished publisher activation. It does not grant production release approval.

| Area | Evidence | Limit |
| --- | --- | --- |
| Source behavior | 104 Node tests on macOS; Windows source regressions run in native CI | Self-checks, not independent product QA |
| Windows x64 | Native Windows Server 2022 build, checksum/consent/install/persistence/uninstall checks | No physical customer machine, publisher signature or SmartScreen reputation claim |
| Windows download and local use | Owned loopback HTTP release fixture; real PowerShell download, checksum and ZIP validation; CMD launch; Chinese paths; fed skills and positive/negative output checks; learning records, practice and grading | Does not prove an anonymous public GitHub release download; release remains a draft |
| Windows TUI | Native ConPTY, Chinese form save and reopen, normal exit and Ctrl+C | A controlled native terminal session, not a physical-device visual acceptance |
| macOS Apple Silicon | Native build and installer/runtime/distribution checks | Ad-hoc signature; no Apple notarization or Intel Mac acceptance |
| DeepSeek | Actual official model list and synthetic `deepseek-flash` completion; required output present, negative local sample rejected | Three bounded completion requests during probe development; only the final probe saved successful usage/output. No customer task data sent |
| Authorization | Device-flow, signatures, private-receipt, renewal, revocation and failure fixtures; real private receipt repository created | Product OAuth App, HTTPS issuer and deployment key are absent. No real customer device-flow/license acceptance is claimed |
| Handbook | 31 chapters, 23 editable examples; bundled local help and public static files | Installation examples must use the actual platform package and current release state |

## Reproduce source and Windows checks

Use Node 22 or later. `node scripts/test-source.mjs` expands the test list in JavaScript so Windows does not depend on shell glob expansion.

The private repository's **Native Windows verification** workflow pins action revisions and build-tool versions. It builds on `windows-2022`, runs the install suite, drives the installed CMD launcher in an owned native ConPTY, and runs the downloaded local workflow. Artifacts include only the runtime ZIP, SHA-256 file, public build manifest and synthetic verification records. Private build receipts and source code are not public runtime assets.

Commands: `node scripts/build-preview.mjs`, `scripts/verify-windows.ps1 -Stage <native-stage>`, `scripts/verify-windows-tui.ps1 -Stage <native-stage>`, `node scripts/verify-windows-flow.mjs`, and `node scripts/test-source.mjs`. See the final GitHub workflow run and accompanying release validation JSON for the exact source revision and binary hashes.

## Preserved failures and remaining work

Earlier runs found a PowerShell read-only HOME variable collision, a mixed-PowerShell module-autoload dependency in checksum verification, path conversion errors in TUI tests, a hard-coded prior handbook version in a Mac assertion, and insufficient console-handle access in the ConPTY test harness. They were corrected without weakening product output or authorization gates. A learning reference that omitted an active required phrase was correctly rejected; the synthetic reference was fixed to satisfy the same rules.

The company has no issuer server or product OAuth App yet. Customer activation, renewal/revocation against the deployed service, GitHub receipt delivery in a real customer flow, and an activated CLI/TUI model request remain pending. The configured endpoint/key transport alone does not complete that acceptance. See PUBLISHER_SETUP.md. External tool execution, connected channels and unattended learning remain unavailable.

## Final native candidate

Build inputs: `b07321ab0973c5876dc793c9764bdf369ea95895` in the private source repository. [Windows native CI run](https://github.com/KarmenLoop/koder-open-cli-source/actions/runs/39453314235) completed successfully: 104 source tests, 8 installer checks, 12 download/local workflow checks, and installed-command ConPTY TUI form/save/reopen/exit checks. The later source commit updates only external documentation and validation receipts.

macOS Apple Silicon passed 18 installer/runtime/distribution checks. SHA-256: `fbf8a1de739c18790aa641c5c1ed887d02db0ed6fae09a64a2228e698b4330b8`. Windows x64 SHA-256: `7352e4c799bafc14c6ff731c8e720530127c525da48463d8312661294e7687ec`. Both match their accompanying archive checksum files. Sanitized results are in [release-validation.json](release-validation.json).
