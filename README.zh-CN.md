# Koder Open CLI

[English](README.md) | 简体中文 · **0.2.0-dev.7**

[![Release](https://img.shields.io/github/v/release/KarmenLoop/koder-open-cli?include_prereleases)](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7)
[![Platform](https://img.shields.io/badge/platform-macOS%20Apple%20Silicon%20%7C%20Windows%20x64-blue)](docs/INSTALLATION.md)
[![License: personal noncommercial](https://img.shields.io/badge/license-personal%20noncommercial-orange)](docs/legal/licensing.md)
[![Handbook](https://img.shields.io/badge/handbook-32%20chapters%20ZH-0ea5e9)](https://karmenloop.github.io/koder-open-cli/handbook/)

**为日常文字工作配置一个 AI 角色：明确职责、可参考材料、方法与语气，再用输出规则检查答案——都在本机完成。**

Koder Open CLI 由中国上海的 [KARMENLOOP](https://karmenloop.com) 团队发布。命令行、交互式 TUI 和本地浏览器设置共用已保存的角色与技能库。你自备文字 API 地址与凭据；预览版不附带付费模型额度。

当前可用下载：**[0.2.0-dev.7](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7)** · [官网](https://karmenloop.com) · [联系](mailto:info@karmenloop.com) · [完整中文手册](https://karmenloop.github.io/koder-open-cli/handbook/) · [中文教程](docs/tutorial.zh-CN.md) · [English tutorial](docs/tutorial.en.md)

> **「Open」是产品名**，不是开源许可声明。产品源码在私有仓库；本公开仓提供文档、指定安装脚本与明确发布的运行资产，采用受限的个人非商业许可。

---

## 为什么做这个

通用对话工具容易忘掉交付物，把未审阅草稿当成「规则」，把质量交给碰运气。已经自备文字 API 的人需要一个**本地控制面**：角色定义、批准材料、机械输出检查，以及诚实的激活路径——同时不夸大模型权重训练或无人值守渠道自动化。

---

## 一览

| | |
| --- | --- |
| **安装内容** | **macOS Apple Silicon** 或 **Windows x64** 原生归档（含运行时） |
| **你需自备** | 完整文字 API 地址、实际可用模型 ID、存放凭据的环境变量名 |
| **版本** | **0.2.0-dev.7**（当前可用）· **dev.8** 候选文档另列 |
| **界面** | CLI · 交互式 TUI · 本地浏览器 `setup`（共享角色 / 技能库） |
| **手册** | 32 章中文手册 + 23 个可编辑示例（包内与[在线](https://karmenloop.github.io/koder-open-cli/handbook/)） |
| **激活** | GitHub OAuth 设备登录 + 核实发布方签名后才可发起模型请求 |
| **许可** | 受限个人非商业——非 OSI 开源（[许可说明](docs/legal/licensing.md)） |
| **本版不含** | Intel Mac / Windows ARM64 / Linux 包；无人值守学习；外部工具执行；渠道发信 |

---

## 是 / 不是

| 是 | 不是 |
| --- | --- |
| 本机 CLI / TUI / 浏览器设置，配置文字角色 | 托管聊天 SaaS 或捆绑付费模型额度 |
| 三套界面共享角色与技能库 | 事实或专业正确性的保证 |
| 机械输出检查（必含/禁用词、长度、JSON） | 模型权重训练或微调 |
| GitHub 设备授权 + 签名后的模型请求 | 仅靠 Star 或本地勾选签发许可 |
| 开发预览，含已记录的 Mac/Windows 激活检查 | 独立生产验收或 SmartScreen 信誉声明 |
| 明确条款下的个人非商业产品 | 产品代码的 OSI 开源再分发 |

---

## 当前下载与候选版本

可用下载仍是 **0.2.0-dev.7**。dev.8 候选新增结合当前任务的学习、本地预习、诊断命令，以及为 Windows 本机验收和签名准备的工具。运行资产仍为草稿，需完成证书与本次发布验收。查看[候选验收](docs/candidates/dev8/VALIDATION.md)与[候选中文手册](https://karmenloop.github.io/koder-open-cli/candidates/dev8/handbook/)，不要把候选文档当作 dev.7 已交付功能。目前没有 Windows 实体机覆盖全部门禁，也没有向 GitHub 上传模型密钥。

---

## 安装开发预览版

从指定版本发行页下载平台归档及对应 `.sha256`，核对哈希后解压，阅读展示的条款再决定是否安装。

**Mac** — 在解压目录运行 `sh install.sh`，然后：

```sh
"$HOME/.local/bin/koder-open" tui --home "$HOME/KoderLearningData"
```

**Windows** — 用 `Get-FileHash` 核对后运行 `.\install.ps1`，然后：

```powershell
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" tui --home "$HOME\KoderLearningData"
```

用 `setup` 替换 `tui` 可打开本地浏览器设置。路径、恢复、升级与卸载见[安装参考](docs/INSTALLATION.md)与[中文教程](docs/tutorial.zh-CN.md)。

Mac 为临时签名、未经 Apple 公证；Windows 未做发布方签名，也不声称具备 SmartScreen 信誉。Intel Mac、Windows ARM64 和 Linux 不属于本版已验收平台。

---

## 激活与连接模型

1. 阅读并明确同意四份指定版本的法律文档。
2. 在 GitHub 批准自己的 **Koder Open CLI** 设备登录。模型调用需要核实发布方签名；Star 和本地勾选不能签发许可。服务休眠时可用 `auth wake`。
3. 配置完整文字 API 地址、账号实际可用的模型 ID，以及存放凭据的环境变量名。密钥放在角色和模型配置文件之外。
4. DeepSeek 短任务可明确选择 `--thinking disabled`；其他提供方仅在支持时采用该参数。

请求会把所选任务、角色和已启用材料发送给所选提供方。

**dev.7 实机检查（如实）：** 公开包已在 Mac 与 Windows x64 完成真实安装激活和签名续期；已安装的 Mac CLI/TUI 返回过经检查的合成任务 DeepSeek 响应。Windows 真实模型调用仍未验收。详见[VALIDATION.md](docs/VALIDATION.md)。这些是开发检查，不等于独立生产验收。

---

## 用自己的工作试一遍

1. 写清交付物、允许主题、可信来源，以及遇到什么情况需要补问。
2. 导入少量 UTF-8 Markdown 或文本材料，逐项审阅并明确启用技能。
3. 设置必含词、禁用词、长度或 JSON 条件，分别测试应通过和应拒绝的答案。
4. 选择学习主题、可用来源、保留范围与每日请求上限，只提交你授权的任务和问题。
5. 练习复习题、预习、补课或演练；逐份审阅模型草稿，再接受为复用笔记。
6. 用自己领域的代表性例子检查结果，根据具体缺口调整角色和材料。

指令用于引导模型；机械检查只保证已配置的条件。此预览版不训练模型权重，不观察其他应用，不安排无人值守学习，不执行外部工具，也不发送渠道消息。

---

## 文档

| 文档 | 用途 |
| --- | --- |
| [中文教程](docs/tutorial.zh-CN.md) · [English](docs/tutorial.en.md) | 安装、第一次任务、排查、升级、卸载 |
| [安装参考](docs/INSTALLATION.md) | 精确路径、恢复、回退 |
| [完整手册](docs/handbook/index.html) · [在线中文](https://karmenloop.github.io/koder-open-cli/handbook/) · [离线 ZIP](https://karmenloop.github.io/koder-open-cli/handbook/koder-cli-handbook-0.2.0-dev.7-zh-CN.zip) | 32 章 + 可编辑例子 |
| [终端界面](docs/TUI.md) · [学习边界](docs/LEARNING.md) | TUI 与复习周期 |
| [模型兼容](docs/MODEL_COMPATIBILITY.md) · [授权](docs/AUTHORIZATION.md) | 端点与设备登录 |
| [发布方部署](docs/PUBLISHER_RENDER.md) | 免费托管说明 |

手册与部分技术参考保留原语言；产品、安装与限制的中文说明见本页与中文教程。

---

## 常见问题

### 一句话说明是什么？

本机可配置的 AI 文字工具（CLI / TUI / 浏览器设置），共享角色与技能库，并按你定义的规则检查答案——模型 API 自备。

### 是不是开源软件？

不是。「Open」是产品名。产品代码采用受限个人非商业许可；商业用途与衍生开发需单独书面授权。用户编写的角色和技能仍可编辑。

### 0.2.0-dev.7 支持哪些平台？

macOS Apple Silicon 与 Windows x64。Intel Mac、Windows ARM64、Linux 不属于本版已验收平台。

### 安装后就能调用模型吗？

不能。需同意法律文档、完成 GitHub 设备授权，并由核实的发布方签名授权模型请求。Star 不能签发许可。

### 会用我的任务训练模型吗？

不会。预览版不训练模型权重。可选学习功能在配置上限内保存经所有者审阅的笔记，见 [LEARNING.md](docs/LEARNING.md)。

### 软可发现性

与仓库实质相符的检索表述：**可配置 AI 文字 CLI**、**带输出检查的角色与技能库**、**本机 TUI 对接文字 API**、**GitHub 设备授权模型请求**、**中文手册配置 AI 角色**。避免堆砌关键词；内容以手册、安装说明与验证记录为准。

---

## 许可与隐私

产品源码位于私有仓库；本仓库提供文档、指定安装脚本与明确发布的运行资产。产品采用受限的个人非商业许可，产品代码修改、衍生开发及商业用途需单独书面授权；用户编写的角色和技能仍可编辑。第三方组件保留原授权，这不是 OSI 认可的开源许可。

授权服务将披露的最小同意记录写入专用私有 GitHub 仓库，不包含模型密钥、任务正文或技能内容。阅读[使用条款](docs/legal/terms.md)、[隐私声明](docs/legal/privacy.md)、[免责声明](docs/legal/disclaimer.md)与[许可说明](docs/legal/licensing.md)。免费托管有配额且可能休眠，不承诺永久可用。Star 完全自愿。

维护者：[KarmenLoop](https://github.com/KarmenLoop) · 官网：[karmenloop.com](https://karmenloop.com) · 邮箱：info@karmenloop.com
