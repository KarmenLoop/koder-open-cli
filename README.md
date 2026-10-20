# Koder Open CLI

Koder Open CLI is a customizable AI work tool from the KARMENLOOP Team in Shanghai, China. Define a role's purpose, scope, working method and voice, feed it approved text material, and check its answers against your output rules. Use the CLI, interactive TUI, or local browser settings interface with the same saved role and skill library.

[Company website](https://karmenloop.com) · [Contact](mailto:info@karmenloop.com) · [Complete Chinese handbook](https://karmenloop.github.io/koder-open-cli/handbook/) · [Published releases](https://github.com/KarmenLoop/koder-open-cli/releases)

## Current availability

The public installation command below still downloads **0.1.0-preview.1 for macOS Apple Silicon**, a local-configuration preview. It does not contain the newer learning cycle or TUI.

**0.2.0-dev.4** adds the TUI, skill intake and output checks, local review practice, scoped study preparation, a bundled 31-chapter handbook, Windows installation tooling, and three text API protocols. Its native packages are being collected in a release draft while publisher activation remains unconfigured. They are not a production release or the public latest download. See [current validation and remaining work](docs/VALIDATION.md).

The DeepSeek adapter has returned a real synthetic response using `deepseek-flash`, with passing required-text checks and a rejected negative sample. This is provider-adapter evidence. Customer model operations still require the company's GitHub OAuth App, HTTPS authorization service and signed license. Those services are not live yet.

## Published macOS preview

Supports macOS 11 or later on Apple Silicon. The package includes Node.js and installs for the current user. It is ad-hoc signed and is not Apple-notarized.

```sh
curl -fsSL https://raw.githubusercontent.com/KarmenLoop/koder-open-cli/main/install/koder-open.sh | sh
"$HOME/.local/bin/koder-open" studio
```

Follow the [published preview installation guide](docs/INSTALLATION.md). Download only the package matching your platform and verify its SHA-256 digest. The draft Windows candidate does not replace this preview command.

## Make it fit your work

1. Define what your role should deliver, which topics it may cover, what sources it must use, and where it should hand work back to you.
2. Prepare small, approved UTF-8 Markdown or text documents with your methods, examples and terminology. Import, review, and explicitly enable each skill.
3. Add required phrases, forbidden phrases, length limits or JSON checks. Try both a good answer and a bad answer before relying on the filter.
4. Choose the allowed learning topics, active sources, retention period and daily request limit. Record only the work and problems you explicitly submit.
5. Practice local review questions and grade the result. After publisher activation becomes available, explicitly request pre-study, remediation or rehearsal; review every draft before permitting reuse.
6. Evaluate representative work from your own field. Revise the role and materials when the evidence calls for it.

Instructions guide a model; deterministic checks enforce only their configured conditions. The tool does not guarantee subject-matter correctness. It does not train foundation-model weights, monitor arbitrary applications, run an unattended learning scheduler, execute external tools, or send channel messages in this candidate.

## Documentation

- [Complete handbook and editable examples](docs/handbook/index.html)
- [Download the complete offline handbook](https://karmenloop.github.io/koder-open-cli/handbook/koder-cli-handbook-0.2.0-dev.4-zh-CN.zip)
- [TUI controls](docs/TUI.md)
- [Learning boundaries and review cycle](docs/LEARNING.md)
- [Model compatibility](docs/MODEL_COMPATIBILITY.md)
- [Authorization and private receipts](docs/AUTHORIZATION.md)
- [Publisher setup](docs/PUBLISHER_SETUP.md)
- [Development candidate installation](docs/CANDIDATE_INSTALLATION.md)
- [Terms, privacy, disclaimer and licensing](docs/legal/terms.md)

## License and privacy

Product source is maintained in a private repository. This public repository contains product information, documentation, selected installer scripts, and explicitly published runtime artifacts. Koder Open CLI uses a restrictive personal, noncommercial license. Product-code changes, derivative development and commercial use require separate written authorization. User-authored role settings and skills remain editable. Third-party components retain their own license grants. This is not an OSI-approved open-source license.

The planned authorization service records minimal disclosed acceptance receipts in a dedicated private GitHub repository. It must not collect API keys, skill content or task inputs through that receipt path. See the [privacy notice](docs/legal/privacy.md), [disclaimer](docs/legal/disclaimer.md), and [licensing terms](docs/legal/licensing.md). A GitHub Star is welcome and optional; it is never a license condition.
