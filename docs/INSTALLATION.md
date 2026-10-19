# Installing Koder Open CLI Preview

Version: **0.1.0-preview.1** · Product command: **koder-open**

## Supported platform

macOS 11 or later on Apple Silicon (arm64). Node.js is included in the executable. Windows, Intel Mac, and Linux packages are not available in this preview. The binary is ad-hoc signed for development and is not Apple notarized.

This is a local role-configuration preview. It does not include live model task execution, connected business channels, active behavior analysis, or integrated cross-device memory. No model credentials or subscription are needed for the included features.

## One-command installation

```sh
curl -fsSL https://raw.githubusercontent.com/KarmenLoop/koder-open-cli/main/install/koder-open.sh | sh
```

The downloader checks the platform, downloads this exact preview package, verifies its SHA-256 digest, validates archive paths/types, and invokes the bundled installer. The installer verifies the internal payload again. It uses your account and does not request administrator privileges or edit your shell profile.

Start Studio:

```sh
"$HOME/.local/bin/koder-open" version
"$HOME/.local/bin/koder-open" studio
```

Open the returned localhost URL. Press Ctrl+C to stop Studio. It listens only on 127.0.0.1.

## Manual installation

Download [the macOS Apple Silicon archive](https://github.com/KarmenLoop/koder-open-cli/releases/download/v0.1.0-preview.1/koder-open-0.1.0-preview.1-darwin-arm64.tar.gz) and [its checksum](https://github.com/KarmenLoop/koder-open-cli/releases/download/v0.1.0-preview.1/koder-open-0.1.0-preview.1-darwin-arm64.sha256). Verify both from the directory containing them:

```sh
shasum -a 256 -c koder-open-0.1.0-preview.1-darwin-arm64.sha256
tar -xzf koder-open-0.1.0-preview.1-darwin-arm64.tar.gz
cd koder-open-0.1.0-preview.1-darwin-arm64
sh install.sh
```

Then start Studio using the command above.

## Locations

| Item | Default location |
| --- | --- |
| Managed runtime | `~/.local/share/koder-open/versions/<version>` |
| Current runtime | `~/.local/share/koder-open/current` |
| Previous runtime | `~/.local/share/koder-open/previous` after an upgrade |
| Command | `~/.local/bin/koder-open` |
| User configuration | `~/.koder-open` |

Set `KODER_OPEN_INSTALL_ROOT` and `KODER_OPEN_BIN_DIR` for an isolated installation. Use `--home <directory>` or `KODER_OPEN_HOME` to select your configuration directory. Installation and configuration are independent. A foreign existing `koder-open` command is reported as a conflict rather than overwritten. The existing `koder` command is separate.

## Upgrade and rollback

Install a verified newer preview archive in the same installation root. The installer retains your configuration and previous runtime. To restore the previous runtime:

```sh
sh "$HOME/.local/share/koder-open/previous/install.sh"
```

Runtime rollback does not roll back user configuration. Use the CLI's configuration `rollback --target-revision <number>` with the intended role/home if needed. Configuration rollback creates a new revision and never restores past execution authority.

## Uninstall

```sh
sh "$HOME/.local/share/koder-open/current/uninstall.sh"
```

This removes the managed runtime and owned command link. Configuration directories are retained. The uninstaller refuses unexpected extra files in a runtime directory; move your files elsewhere before retrying. An isolated installation must use the same install-root and bin-directory environment variables used at installation.

## Verification and limits

The published candidate passed 47 source tests and 13 installation/runtime/distribution checks on macOS arm64. Acceptance included an actual native predecessor upgrade/rollback, real local HTTP download and checksum rejection, protected Studio save/reopen after clean shutdown, repeated installation, conflicts, symlink refusal, tamper detection, and uninstall without deleting configuration. Browser editing/save/reopen was observed from the installed binary.

These are local preview checks, not independent full-product QA or validation of other platforms, real business channels, models, or user behavior analysis. The package includes the proprietary preview license and full Node.js notices. Product source and source maps are not distributed as files.
