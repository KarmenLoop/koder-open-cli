# Koder Open CLI

English | [简体中文](README.zh-CN.md) · **0.2.0-dev.7**

[![Release](https://img.shields.io/github/v/release/KarmenLoop/koder-open-cli?include_prereleases)](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7)
[![Platform](https://img.shields.io/badge/platform-macOS%20Apple%20Silicon%20%7C%20Windows%20x64-blue)](docs/INSTALLATION.md)
[![License: personal noncommercial](https://img.shields.io/badge/license-personal%20noncommercial-orange)](docs/legal/licensing.md)
[![Handbook](https://img.shields.io/badge/handbook-32%20chapters%20ZH-0ea5e9)](https://karmenloop.github.io/koder-open-cli/handbook/)

**Configure an AI text role with purpose, allowed topics, method, and voice—then check answers against your output rules, on your machine.**

Koder Open CLI is a customizable AI text tool from the [KARMENLOOP](https://karmenloop.com) team in Shanghai. The CLI, interactive TUI, and local browser settings share the same saved role and skill library. You bring a text API endpoint and credential; the preview does not bundle a paid model quota.

Current operational download: **[0.2.0-dev.7](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7)** · [Company website](https://karmenloop.com) · [Contact](mailto:info@karmenloop.com) · [Complete Chinese handbook](https://karmenloop.github.io/koder-open-cli/handbook/) · [Tutorial](docs/tutorial.en.md) · [中文教程](docs/tutorial.zh-CN.md)

> **“Open” is a product name**, not an OSI open-source claim. Product source stays in a private repository. This public tree holds documentation, selected installers, and explicitly published runtime artifacts under a restrictive personal, noncommercial license.

---

## Why this exists

Generic chat tools forget your deliverables, mix untrusted drafts into “policy,” and leave output quality to hope. Teams that already pay for text APIs need a **local control surface**: defined roles, approved materials, mechanical output checks, and an honest activation path—without claiming model-weight training or unattended channel automation.

---

## Snapshot

| | |
| --- | --- |
| **What you install** | Native archive for **macOS Apple Silicon** or **Windows x64** (runtime included) |
| **What you bring** | Full text API endpoint, exact model ID, credential environment-variable name |
| **Version** | **0.2.0-dev.7** (operational) · **dev.8** candidate docs exist separately |
| **Surfaces** | CLI · interactive TUI · local browser `setup` (shared role / skill library) |
| **Handbook** | 32-chapter Chinese handbook + 23 editable examples (in package and [online](https://karmenloop.github.io/koder-open-cli/handbook/)) |
| **Activation** | GitHub OAuth device login + verified publisher signature for model requests |
| **License** | Restrictive personal, noncommercial — not OSI open source ([licensing](docs/legal/licensing.md)) |
| **Not in this release** | Intel Mac, Windows ARM64, Linux packages; unattended learning; external tool execution; channel messaging |

---

## Is / Is not

| Is | Is not |
| --- | --- |
| Local CLI / TUI / browser settings for a configured text role | Hosted SaaS chat product or bundled paid model quota |
| Shared role + skill library across three surfaces | Guarantee of factual or professional correctness |
| Mechanical output checks (phrases, length, JSON) | Model-weight training or fine-tuning |
| GitHub device authorization with signed model requests | License issued by a Star or a local checkbox alone |
| Development preview with recorded Mac/Windows activation checks | Independent production acceptance or SmartScreen reputation |
| Personal noncommercial product under explicit terms | OSI-approved open-source redistribution of product code |

---

## Dev.8 candidate (not the default download)

The **dev.8** candidate adds task-aware learning, local study previews, a diagnostic command, and prepared local Windows acceptance/signing tools. Native results and remaining gates are in [candidate validation](docs/candidates/dev8/VALIDATION.md). Read the [updated candidate handbook](https://karmenloop.github.io/koder-open-cli/candidates/dev8/handbook/). Candidate runtime assets remain a draft pending certificate and release-specific acceptance; **dev.7 remains the operational download**. A Windows physical machine is not currently available for every gate, and no model key is uploaded to GitHub.

---

## Install the development preview

**0.2.0-dev.7** supports macOS Apple Silicon and Windows x64. Each package includes its runtime and the handbook with editable examples. Download your platform archive and matching `.sha256` from the versioned release. Read the displayed terms before accepting installation.

**Mac** — verify checksum, extract, run `sh install.sh`, then:

```sh
"$HOME/.local/bin/koder-open" tui --home "$HOME/KoderLearningData"
```

**Windows** — verify with `Get-FileHash`, extract, run `.\install.ps1`, then:

```powershell
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" tui --home "$HOME\KoderLearningData"
```

Use `setup` instead of `tui` for local browser settings. Exact commands, data locations, recovery, update, and removal: [installation](docs/INSTALLATION.md) · [tutorial](docs/tutorial.en.md).

Mac binaries are ad-hoc signed and not Apple-notarized. Windows binaries are not publisher-signed; no SmartScreen reputation is claimed.

---

## Activate and connect a model

1. Read and explicitly accept the four versioned legal documents.
2. Approve your own **Koder Open CLI** device login at GitHub. A verified publisher signature authorizes model requests; a Star or local checkbox does not issue a license. Use `auth wake` if the free service is sleeping.
3. Choose a full text API endpoint, exact model ID, and credential environment-variable name. Keep the key outside role and model configuration files.
4. DeepSeek short tasks can explicitly select `--thinking disabled`; other providers retain their default unless they support that option.

Requests send the selected task, role, and enabled material to the selected provider.

**dev.7 live checks (honest):** Public packages completed real installed activation and signed renewal on Mac and Windows x64. The installed Mac CLI and TUI returned checked synthetic DeepSeek responses. Windows real model calls remain unverified by owner choice. See [VALIDATION.md](docs/VALIDATION.md). These are development checks, not independent production acceptance.

---

## Make it fit your work

1. Define deliverables, allowed topics, trusted sources, and when the role should ask for clarification.
2. Import small UTF-8 Markdown or text files; review and explicitly enable each skill.
3. Configure required / forbidden phrases, length limits, or JSON checks; test both an acceptable and a rejected answer.
4. Select allowed learning topics, sources, retention, and a daily request limit; submit only work you authorize.
5. Practice review, pre-study, remediation, or rehearsal; review every model draft before accepting notes for reuse.
6. Evaluate examples from your own field and revise when results show a gap.

Instructions guide the model; mechanical checks enforce configured conditions. This preview does **not** train model weights, observe other applications, schedule unattended learning, execute external tools, or send channel messages.

---

## Documentation

| Guide | Use it for |
| --- | --- |
| [Tutorial (EN)](docs/tutorial.en.md) · [中文](docs/tutorial.zh-CN.md) | Install, first task, troubleshoot, update, remove |
| [Installation](docs/INSTALLATION.md) | Exact paths, recovery, rollback |
| [Complete handbook](docs/handbook/index.html) · [online ZH](https://karmenloop.github.io/koder-open-cli/handbook/) · [offline ZIP](https://karmenloop.github.io/koder-open-cli/handbook/koder-cli-handbook-0.2.0-dev.7-zh-CN.zip) | 32 chapters + editable examples |
| [TUI controls](docs/TUI.md) | Terminal interface |
| [Learning boundaries](docs/LEARNING.md) | Review cycle and limits |
| [Model compatibility](docs/MODEL_COMPATIBILITY.md) | Endpoints and options |
| [Authorization](docs/AUTHORIZATION.md) | Device login and private receipts |
| [Publisher setup](docs/PUBLISHER_RENDER.md) | Free hosting notes |

---

## FAQ

### What is Koder Open CLI in one sentence?

A local, configurable AI text tool (CLI / TUI / browser settings) that shares a role and skill library and checks answers against rules you define—using your own text API.

### Is the product open source?

No. “Open” is the product name. Product code is proprietary under a personal noncommercial license; commercial use and derivative development need separate written authorization. User-authored roles and skills remain editable.

### Which platforms are supported in 0.2.0-dev.7?

macOS Apple Silicon and Windows x64. Intel Mac, Windows ARM64, and Linux are not accepted platforms for this release.

### Does installing grant a model license?

No. You must accept the legal documents, complete GitHub device authorization, and present a verified publisher signature for model requests. A Star does not issue a license.

### Does it train on my tasks?

No. The preview does not train model weights. Optional learning features store owner-reviewed notes under configured limits; see [LEARNING.md](docs/LEARNING.md).

### Soft discoverability

Useful phrases that match this repository: **configurable AI text CLI**, **role and skill library with output checks**, **local TUI for text API work**, **GitHub device auth for model requests**, **Chinese handbook for AI role setup**. Avoid stuffing; substance is in the handbook, install docs, and validation record.

---

## License and privacy

Product source is maintained privately. This repository publishes documentation, selected installers, and explicitly released runtime artifacts. The product uses a restrictive personal, noncommercial license. Product-code changes, derivative development, and commercial use need separate written authorization. Third-party components retain their own grants. This is **not** an OSI-approved open-source license.

The authorization service records disclosed minimal acceptance receipts in a dedicated private GitHub repository. That path excludes model keys, task text, and skill content. See [terms](docs/legal/terms.md), [privacy](docs/legal/privacy.md), [disclaimer](docs/legal/disclaimer.md), and [licensing](docs/legal/licensing.md). Free hosting has quotas and may sleep; it carries no promise of permanent availability. A GitHub Star is welcome and optional.

Maintainer: [KarmenLoop](https://github.com/KarmenLoop) · Site: [karmenloop.com](https://karmenloop.com) · Email: info@karmenloop.com
