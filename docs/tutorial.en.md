# Koder Open CLI: from download to first checked answer

English | [简体中文](tutorial.zh-CN.md) · [Project](../README.md)

This guide matches the operational preview **0.2.0-dev.7** (macOS Apple Silicon and Windows x64). For the full Chinese handbook and 23 editable examples, use the [online handbook](https://karmenloop.github.io/koder-open-cli/handbook/) or the copy inside the release archive.

## 1. Download and verify

Open the [v0.2.0-dev.7 release](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7). Download **your platform archive** and its matching `.sha256` file. If that release has no attachments, wait for publication—do not substitute an older package.

**macOS Apple Silicon**

```sh
shasum -a 256 -c koder-open-0.2.0-dev.7-darwin-arm64.sha256
tar -xzf koder-open-0.2.0-dev.7-darwin-arm64.tar.gz
cd koder-open-0.2.0-dev.7-darwin-arm64
sh install.sh
```

**Windows x64** (PowerShell; use your actual paths)

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath "$HOME\Downloads\koder-open-0.2.0-dev.7-win32-x64.zip"
Get-Content -LiteralPath "$HOME\Downloads\koder-open-0.2.0-dev.7-win32-x64.sha256"
# Extract the ZIP, then:
Set-Location -LiteralPath "C:\KoderOpen\koder-open-0.2.0-dev.7-win32-x64"
.\install.ps1
```

Review the four displayed legal documents. Enter `accept` only if you agree. Installation stops without consent. Mac binaries are ad-hoc signed (not Apple-notarized). Windows binaries are not publisher-signed; no SmartScreen reputation is claimed.

Public downloaders under `install/` use the same explicit archive and verify checksum and file list. Save and inspect a script before running it. Piping a downloader into a shell does **not** provide an interactive terms prompt.

Intel Mac, Windows ARM64, and Linux have **no** accepted package in this release.

## 2. First launch

Keep the same `--home`, role, and space across CLI, TUI, and browser setup.

**Mac**

```sh
"$HOME/.local/bin/koder-open" version --json
"$HOME/.local/bin/koder-open" tui --home "$HOME/KoderLearningData"
```

**Windows**

```powershell
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" version --json
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" tui --home "$HOME\KoderLearningData"
```

Use `setup --port 0` instead of `tui` for the local browser interface. Open the printed loopback URL. Ctrl+C stops that process; saved data remains.

## 3. First task (role → skill → check → auth → model)

1. Save your role: purpose, allowed topics, working method, and preferred wording.
2. Import a small UTF-8 Markdown/text skill; inspect it and **explicitly enable** it.
3. Configure an output check; test both an acceptable sample and a rejected sample.
4. Review all four legal documents. Run `auth wake` if needed, then `auth login --accept-terms <the-reviewed-digest>` and approve the **Koder Open CLI** device code at GitHub. Each installation needs its own approval.
5. Configure the complete model endpoint, exact model ID, and environment-variable name. Set the key only in the local process environment. For a short DeepSeek task, you may set `--thinking disabled`.
6. Make a **small synthetic** request in CLI or TUI. Confirm a complete answer and passing checks before using real work material.

A Star or local checkbox does **not** issue a model license. Requests send the selected task, role, and enabled material to your provider.

## 4. Troubleshoot

- **Wrong platform:** This release accepts only macOS Apple Silicon and Windows x64.
- **Checksum mismatch:** Re-download archive and `.sha256` from the versioned release; do not mix versions.
- **Installer blocked (Windows):** Preserve the message; use a distribution approved by your administrator—do not disable machine-wide security controls.
- **Auth / sleeping issuer:** Run `auth wake`, then retry login. Free hosting may sleep and is not promised permanently.
- **Model call fails:** Confirm endpoint, model ID, env-var name, and that the key is outside role files. Check [MODEL_COMPATIBILITY.md](MODEL_COMPATIBILITY.md).
- **TUI vs setup confusion:** Both share the same `--home` library; use one home path consistently.
- **Need deeper recovery:** See [INSTALLATION.md](INSTALLATION.md) and the [Chinese handbook](https://karmenloop.github.io/koder-open-cli/handbook/).

## 5. Update, roll back, or remove

| Item | macOS | Windows |
| --- | --- | --- |
| Runtime | `~/.local/share/koder-open/versions/<version>` | `%LOCALAPPDATA%\KarmenLoop\koder-open\versions\<version>` |
| Command | `~/.local/bin/koder-open` | `%LOCALAPPDATA%\KarmenLoop\koder-open\bin\koder-open.cmd` |
| User data | `~/.koder-open`, or your `--home` | Home `.koder-open`, or your `--home` |

An update keeps user data separate. The installer rejects a foreign command, unsafe path, changed payload, or different contents under an existing version—do not force an overwrite.

**Rollback (Mac):** run the newer extracted installer with `sh install.sh --rollback` to return to its verified managed predecessor. This restores the runtime, not past user configuration or authority.

**Remove:** run the installed `uninstall.sh` (Mac) or the version folder’s `uninstall.ps1` (Windows) with the same custom install paths, if any. User data is retained. The Mac uninstaller refuses unexpected files before removing an owned runtime.

## 6. Candidate docs vs operational download

**dev.8** candidate materials (learning previews, diagnostics, Windows signing prep) are recorded under [docs/candidates/dev8/](candidates/dev8/VALIDATION.md) and the [candidate handbook](https://karmenloop.github.io/koder-open-cli/candidates/dev8/handbook/). Do not treat candidate docs as delivered features of **0.2.0-dev.7**.

Evidence for activation and synthetic Mac DeepSeek checks: [VALIDATION.md](VALIDATION.md). Windows real provider calls remain unverified by owner choice. External tools, channel execution, unattended learning, and independent production acceptance are outside this release.

[Project home](../README.md) · [简体中文教程](tutorial.zh-CN.md) · [Legal](legal/terms.md)
