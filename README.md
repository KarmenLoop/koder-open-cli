# Koder Open CLI

> dev.5 Windows activation is on hold: the real public-download test found a CRLF terms-digest mismatch. The separately versioned dev.6 correction is being verified. Please wait for that release before a new Windows installation or activation. Mac dev.5 results remain historical evidence.

Koder Open CLI is a customizable AI text tool from the KARMENLOOP Team in Shanghai, China. Set a role’s purpose, allowed topics, working method and voice, feed it approved text, and check answers against your output rules. The CLI, interactive TUI and local browser settings share the same saved role and skill library.

[Company website](https://karmenloop.com) · [Contact](mailto:info@karmenloop.com) · [Complete Chinese handbook](https://karmenloop.github.io/koder-open-cli/handbook/) · [Download dev.5](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.5)

## Install the development preview

**0.2.0-dev.5** supports macOS Apple Silicon and Windows x64. Each package includes its runtime and a 32-chapter handbook with 23 editable examples. Download your platform archive and its matching `.sha256` file from the versioned release. Read the displayed terms before accepting installation. Intel Mac, Windows ARM64 and Linux are not accepted platforms for this release.

On Mac, verify the checksum, extract the archive, then run `sh install.sh` in its folder. Start the installed terminal interface:

```sh
"$HOME/.local/bin/koder-open" tui --home "$HOME/KoderLearningData"
```

On Windows, verify the ZIP with `Get-FileHash`, extract it, then run `.\install.ps1` from that folder in PowerShell. Start the installed terminal interface:

```powershell
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" tui --home "$HOME\KoderLearningData"
```

Use `setup` instead of `tui` for the local browser settings. See [installation](docs/INSTALLATION.md) for exact commands, data locations and recovery. Mac binaries are ad-hoc signed and not Apple-notarized. Windows binaries are not publisher-signed; no SmartScreen reputation is claimed.

## Activate and connect a model

The product GitHub OAuth App and free HTTPS authorization service are live. Read the four versioned documents, explicitly accept them, then approve your own **Koder Open CLI** device login at GitHub. A verified publisher signature authorizes model requests; a Star or local checkbox does not issue a license. Use `auth wake` if the free service is sleeping.

Choose a full text API endpoint, exact model ID and credential environment-variable name. The key stays outside role and model configuration files. DeepSeek short tasks can explicitly select `--thinking disabled`; other providers retain their default unless they support that option. Requests send the selected task, role and enabled material to the selected provider.

An installed Mac client has completed real activation, private receipt readback, signed renewal and DeepSeek requests through both CLI and TUI. Native Windows installation, download checks, Chinese paths, skill intake, local learning and ConPTY TUI have passed. **Windows real model calls remain unverified:** the owner chose not to upload a model key to hosted CI. See [current validation](docs/VALIDATION.md) for exact evidence and remaining limits. These are development checks, not independent production acceptance.

## Make it fit your work

1. Define deliverables, allowed topics, trusted sources and when the role should ask for clarification.
2. Import small UTF-8 Markdown or text files with your methods, examples and terminology. Review and explicitly enable each skill.
3. Configure required phrases, forbidden phrases, length limits or JSON checks. Test both an acceptable answer and a rejected answer.
4. Select allowed learning topics, active sources, retention and a daily request limit. Submit only the work and problems you authorize.
5. Practice review questions, request pre-study, remediation or rehearsal, and review every model draft before accepting notes for reuse.
6. Evaluate examples from your own field and revise the role and material when results show a gap.

Instructions guide the model; mechanical checks enforce their configured conditions. They do not guarantee factual or professional correctness. This preview does not train model weights, observe other applications, schedule unattended learning, execute external tools, or send channel messages.

## Documentation

- [Complete handbook and editable examples](docs/handbook/index.html)
- [Offline handbook](https://karmenloop.github.io/koder-open-cli/handbook/koder-cli-handbook-0.2.0-dev.5-zh-CN.zip)
- [TUI controls](docs/TUI.md)
- [Learning boundaries and review cycle](docs/LEARNING.md)
- [Model compatibility](docs/MODEL_COMPATIBILITY.md)
- [Authorization and private receipts](docs/AUTHORIZATION.md)
- [Publisher setup and free hosting](docs/PUBLISHER_RENDER.md)

## License and privacy

Product source is maintained in a private repository. This public repository contains documentation, selected installers and explicitly published runtime artifacts. The product has a restrictive personal, noncommercial license. Product-code changes, derivative development and commercial use need separate written authorization. User-authored role settings and skills remain editable. Third-party components retain their own grants. This is not an OSI-approved open-source license.

The authorization service records disclosed minimal acceptance receipts in a dedicated private GitHub repository. That receipt path excludes model keys, task text and skill content. See the [terms](docs/legal/terms.md), [privacy notice](docs/legal/privacy.md), [disclaimer](docs/legal/disclaimer.md) and [licensing terms](docs/legal/licensing.md). Free hosting has quotas and may sleep; it carries no promise of permanent availability. A GitHub Star is welcome and optional.
