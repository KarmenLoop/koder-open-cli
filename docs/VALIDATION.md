# Development validation: 0.2.0-dev.4

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
