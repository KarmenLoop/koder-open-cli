# Koder Open CLI

[English](README.md) | 简体中文

为日常文字工作配置一个 AI 角色：明确它负责什么、可以参考哪些材料、采用什么方法与语气，再用输出规则检查答案。命令行、交互式 TUI 和本地浏览器设置共用已保存的角色与技能库。项目由中国上海的 KARMENLOOP 团队发布。

[官网](https://karmenloop.com) · [联系](mailto:info@karmenloop.com) · [完整中文手册](https://karmenloop.github.io/koder-open-cli/handbook/) · [下载 dev.7](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7)

## 当前下载与候选版本

可用下载仍是 **0.2.0-dev.7**，支持 macOS Apple Silicon 和 Windows x64。每个包附运行时、32 章手册与 23 个可编辑示例。Intel Mac、Windows ARM64 和 Linux 不属于本版已验收平台。

dev.8 候选新增结合当前任务的学习、本地预习、诊断命令，以及为 Windows 本机验收和签名准备的工具。运行资产仍为草稿，需完成证书与本次发布验收；目前没有 Windows 实体机，也没有向 GitHub 上传模型密钥。查看[候选验收](docs/candidates/dev8/VALIDATION.md)与[候选中文手册](https://karmenloop.github.io/koder-open-cli/candidates/dev8/handbook/)，不要把候选文档当作 dev.7 已交付功能。

## 安装开发预览版

从指定版本发行页下载平台归档及对应 `.sha256`，核对哈希后解压，阅读展示的条款再决定是否安装。

Mac 在解压目录运行 `sh install.sh`，然后启动：

```sh
"$HOME/.local/bin/koder-open" tui --home "$HOME/KoderLearningData"
```

Windows 用 `Get-FileHash` 核对 ZIP，在解压目录的 PowerShell 中运行 `.\install.ps1`，然后启动：

```powershell
& "$env:LOCALAPPDATA\KarmenLoop\koder-open\bin\koder-open.cmd" tui --home "$HOME\KoderLearningData"
```

用 `setup` 替换 `tui` 可打开本地浏览器设置。[安装参考](docs/INSTALLATION.md)列出命令、数据位置和恢复方法。Mac 二进制为临时签名，未经 Apple 公证；Windows 未做发布方签名，也不声称具备 SmartScreen 信誉。

## 激活与连接模型

产品 GitHub OAuth App 和免费 HTTPS 授权服务已上线。先阅读并明确同意四份指定版本的文档，再在 GitHub 批准自己的 **Koder Open CLI** 设备登录。模型调用需要核实发布方签名；Star 和本地勾选不能签发许可。服务休眠时可用 `auth wake` 唤醒。

配置完整文字 API 地址、账号实际可用的模型 ID，以及存放凭据的环境变量名。密钥放在角色和模型配置文件之外。DeepSeek 短任务可明确选择 `--thinking disabled`；其他提供方仅在支持时采用该参数。请求会把所选任务、角色和已启用材料发送给所选提供方。

dev.7 公开包已在 Mac 与 Windows x64 完成真实安装激活和签名续期；已安装的 Mac CLI/TUI 返回过经检查的合成任务 DeepSeek 响应。Windows 真实模型调用仍未验收。详见[当前验证记录](docs/VALIDATION.md)，这些开发检查不等于独立生产验收。

## 用自己的工作试一遍

1. 写清交付物、允许主题、可信来源，以及遇到什么情况需要补问。
2. 导入少量 UTF-8 Markdown 或文本材料，逐项审阅并明确启用技能。
3. 设置必含词、禁用词、长度或 JSON 条件，分别测试应通过和应拒绝的答案。
4. 选择学习主题、可用来源、保留范围与每日请求上限，只提交你授权的任务和问题。
5. 练习复习题、预习、补课或演练；逐份审阅模型草稿，再接受为复用笔记。
6. 用自己领域的代表性例子检查结果，根据具体缺口调整角色和材料。

指令用于引导模型；机械检查只保证已配置的条件。此预览版不训练模型权重，不观察其他应用，不安排无人值守学习，不执行外部工具，也不发送渠道消息。

## 文档

- [完整手册与可编辑例子](docs/handbook/index.html) · [离线中文手册](https://karmenloop.github.io/koder-open-cli/handbook/koder-cli-handbook-0.2.0-dev.7-zh-CN.zip)
- [终端界面](docs/TUI.md) · [学习边界与复习周期](docs/LEARNING.md)
- [模型兼容](docs/MODEL_COMPATIBILITY.md) · [授权与私有记录](docs/AUTHORIZATION.md)
- [发布方部署](docs/PUBLISHER_RENDER.md)

以上参考保留各自原始语言；[英文首页](README.md)提供对应产品、安装、配置与限制说明。

## 许可与隐私

产品源码位于私有仓库；本仓库提供文档、指定安装脚本与明确发布的运行资产。产品采用受限的个人非商业许可，产品代码修改、衍生开发及商业用途需单独书面授权；用户编写的角色和技能仍可编辑。第三方组件保留原授权，这不是 OSI 认可的开源许可。

授权服务将披露的最小同意记录写入专用私有 GitHub 仓库，不包含模型密钥、任务正文或技能内容。阅读原始[使用条款](docs/legal/terms.md)、[隐私声明](docs/legal/privacy.md)、[免责声明](docs/legal/disclaimer.md)与[许可说明](docs/legal/licensing.md)。免费托管有配额且可能休眠，不承诺永久可用。Star 完全自愿。
