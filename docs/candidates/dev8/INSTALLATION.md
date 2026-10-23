# Install Koder Open CLI dev.8

This dev.8 candidate remains unpublished pending signing and further acceptance. Use the published dev.7 release for the current operational package. This development preview supports **macOS Apple Silicon** and **Windows x64**. Each native archive includes the runtime. No Node installation or administrator account is required for ordinary use. Intel Mac, Windows ARM64 and Linux have no accepted package in this release.

## Download and verify

The dev.8 candidate has no public download yet. Authorized reviewers should use the matching platform archive and `.sha256` file they received. For ordinary installation, use the [published dev.7 release](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7). The commands below apply only to a dev.8 review package.

On Mac, from the directory containing both files:

```sh
shasum -a 256 -c koder-open-0.2.0-dev.8-darwin-arm64.sha256
tar -xzf koder-open-0.2.0-dev.8-darwin-arm64.tar.gz
cd koder-open-0.2.0-dev.8-darwin-arm64
sh install.sh
```

On Windows, compare the returned hash to the downloaded checksum file, then extract the ZIP and run its installer from a normal PowerShell window:

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath "$HOME\Downloads\koder-open-0.2.0-dev.8-win32-x64.zip"
Get-Content -LiteralPath "$HOME\Downloads\koder-open-0.2.0-dev.8-win32-x64.sha256"
Set-Location -LiteralPath "C:\KoderOpen\koder-open-0.2.0-dev.8-win32-x64"
.\install.ps1
```

Use your actual extraction path. Review the four displayed legal documents. Enter `accept` only if you agree. Installation stops without consent. If local execution policy blocks the script, preserve the message and use a distribution approved by your administrator; do not disable machine-wide security controls. Mac binaries are ad-hoc signed and not Apple-notarized. Windows binaries are not publisher-signed.

The public `install/koder-open.sh` and `install/koder-open.ps1` downloaders currently target dev.7. For candidate review, use scripts supplied with the exact dev.8 package and verify its checksum and file list. Save the script, inspect it, then run it in an interactive terminal. Piping a downloader into a shell does not provide an interactive terms prompt. Unattended installation requires the exact legal digest supplied deliberately after review; it does not grant a signed model license.

## First use

Mac:

```sh
"$HOME/.local/bin/koder-open" version --json
"$HOME/.local/bin/koder-open" tui --home "$HOME/KoderLearningData"
```

Windows:

```powershell
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" version --json
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" tui --home "$HOME\KoderLearningData"
```

Use `setup --port 0` instead of `tui` for the local browser interface. Open the printed loopback URL. Ctrl+C stops that process and its owned backend; saved data remains. Keep the same `--home`, role and space across all three surfaces.

1. Save your role, allowed topics, working method and preferred wording.
2. Import a small Markdown/text skill, inspect it and explicitly enable it.
3. Check an acceptable and a rejected sample answer.
4. Review all four legal documents. Run `auth wake`, then `auth login --accept-terms <the-reviewed-digest>` and approve the current device code at GitHub. Inspect the App name **Koder Open CLI** and its requested permissions. Each installation requires its own approval.
5. Configure the complete model endpoint, exact model ID and environment-variable name. Set the actual key only in the local process environment. For a short DeepSeek task, explicitly configure `--thinking disabled`.
6. Make a small synthetic request in CLI or TUI. Confirm a complete answer and passing output checks before using real work material.

The [32-chapter Chinese handbook](https://karmenloop.github.io/koder-open-cli/handbook/) supplies copyable commands, editable examples, learning/review exercises and error recovery from beginner to advanced use.

## Data, updates and removal

| Item | macOS | Windows |
| --- | --- | --- |
| Runtime | `~/.local/share/koder-open/versions/<version>` | `%LOCALAPPDATA%\KarmenLoop\koder-open\versions\<version>` |
| Command | `~/.local/bin/koder-open` | `%LOCALAPPDATA%\KarmenLoop\koder-open\bin\koder-open.cmd` |
| User data | `~/.koder-open`, or your `--home` | Your home’s `.koder-open`, or your `--home` |

An update keeps separate user data. The installer rejects a foreign command, unsafe path, changed payload or different contents under an existing version. Do not force an overwrite. On Mac, run the newer extracted installer with `sh install.sh --rollback` to return to its verified managed predecessor. This restores the runtime, not past user configuration or authority. Configuration rollback creates a new revision.

Run the installed `uninstall.sh` on Mac or the version folder’s `uninstall.ps1` on Windows with the same custom install paths, if any. User data is retained. The Windows uninstaller also retains version folders. The Mac uninstaller refuses unexpected files before removing an owned runtime; preserve those files and resolve the conflict.

See [validation](VALIDATION.md) for exact archive hashes and current platform evidence. Windows real provider calls remain unverified by owner choice. External tools, channel execution, unattended learning and independent production acceptance are outside this release.
