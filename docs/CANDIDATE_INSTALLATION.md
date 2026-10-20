# Candidate installation and platform checks

Version 0.2.0-dev.4 is a private development candidate. The existing published release and public download command are unchanged. Do not point a public latest manifest at this artifact before the outstanding release gates pass.

## macOS

The native builder uses the existing Node 22 runtime and locally installed TypeScript/postject. It bundles only `src` and the selected immutable resources into a Node SEA. The publisher issuer and private keys are excluded. The Mac executable is ad-hoc signed and is not Apple-notarized. A separate native Intel build is required for Intel Macs.

After extracting an accepted Apple Silicon candidate, run `sh install.sh`. The installer verifies all payload hashes, displays the four complete legal documents and asks for explicit acceptance. It refuses unattended installation unless the operator provides the exact current bundle digest through `KODER_OPEN_ACCEPT_TERMS` after review. No publisher license is issued by that variable; model operations still require GitHub authorization and signature verification.

Installation uses a per-user managed runtime directory and a separate launcher. Existing unrelated commands, foreign roots and changed payloads are rejected. Upgrade and rollback retain user data. Use the newer extracted package’s `sh install.sh --rollback` to return to its verified managed predecessor; an old installer does not understand the new runtime directory series. `koder-open setup` starts a local settings server; Ctrl+C stops it. Uninstall removes only managed runtime files and retains the user's separate data directory.

## Windows

Build with Node 22 on a native Windows x64 or arm64 host. Supply installed TypeScript/postject module paths and the Node license path if required. The builder creates a self-contained `.exe`, native PowerShell install/uninstall scripts, README, license, Node notices, BUILD metadata and SHA-256 index in a ZIP. Windows publisher signing is not established by this source.

Run `.\install.ps1` in the extracted directory under a policy that permits the reviewed installer. No command disables machine execution policies or requires administrator rights. The installer verifies checksums, refuses reparse-point roots and foreign launchers, requires current terms acceptance, stages versioned files and replaces the managed launcher while retaining its predecessor. It preserves role data. The uninstaller removes only the managed command and retains version directories and data for controlled cleanup.

Native Windows x64 CI ran `scripts/verify-windows.ps1 -Stage <native-stage>` and exercised a Chinese/space-containing path, install, version, saved configuration, skill import/activation, repeat installation and data retention. The separate download suite also checked missing consent, tamper rejection, exact ZIP entries, CMD launch, Chinese role/skill paths, output rejection, learning observations, review practice, repeated installation and retained data. A native ConPTY session completed the TUI form, saved a Chinese role, reopened it and exited. Exact final-revision evidence is recorded in VALIDATION.md. Publisher signing/SmartScreen reputation, locked-file update failures, concurrent installers, ARM64 and physical user-machine acceptance remain unverified.

## Release gates

A distribution must have a configured publisher OAuth App, private receipt service/repository and signing key, account renewal/revocation and data-retention procedures, current legal review, per-platform installer evidence, live provider tests under authorized accounts and a source/asset allowlist audit. Raw product sources and issuer credentials do not enter the public repository. No new public release is created by this candidate's build command.
