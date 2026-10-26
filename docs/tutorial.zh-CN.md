# Koder Open CLI：从下载到第一次通过检查的回答

[English](tutorial.en.md) | 简体中文 · [项目首页](../README.zh-CN.md)

本教程对应当前可用预览版 **0.2.0-dev.7**（macOS Apple Silicon 与 Windows x64）。完整 32 章中文手册与 23 个可编辑示例见[在线手册](https://karmenloop.github.io/koder-open-cli/handbook/)或发行包内副本。

## 1. 下载与核对

打开 [v0.2.0-dev.7 发行页](https://github.com/KarmenLoop/koder-open-cli/releases/tag/v0.2.0-dev.7)，下载**本机平台归档**及对应 `.sha256`。若该版本尚无附件，等待发布——不要用旧包顶替。

**macOS Apple Silicon**

```sh
shasum -a 256 -c koder-open-0.2.0-dev.7-darwin-arm64.sha256
tar -xzf koder-open-0.2.0-dev.7-darwin-arm64.tar.gz
cd koder-open-0.2.0-dev.7-darwin-arm64
sh install.sh
```

**Windows x64**（PowerShell；路径按实际修改）

```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath "$HOME\Downloads\koder-open-0.2.0-dev.7-win32-x64.zip"
Get-Content -LiteralPath "$HOME\Downloads\koder-open-0.2.0-dev.7-win32-x64.sha256"
# 解压后：
Set-Location -LiteralPath "C:\KoderOpen\koder-open-0.2.0-dev.7-win32-x64"
.\install.ps1
```

阅读展示的四份法律文档，同意后再输入 `accept`；不同意则安装停止。Mac 为临时签名、未经 Apple 公证；Windows 未做发布方签名，也不声称 SmartScreen 信誉。

`install/` 下的公共下载脚本使用同一明确归档并核对校验与文件列表。请先保存并审阅再运行。把下载器直接管道进 shell **不会**出现交互式条款提示。

Intel Mac、Windows ARM64、Linux **不在**本版已验收平台内。

## 2. 第一次启动

CLI、TUI、浏览器设置请使用相同的 `--home`、角色与空间。

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

用 `setup --port 0` 替换 `tui` 可打开本地浏览器界面，访问打印的回环地址。Ctrl+C 结束进程，已保存数据仍保留。

## 3. 第一次任务（角色 → 技能 → 检查 → 授权 → 模型）

1. 保存角色：职责、允许主题、工作方法与偏好措辞。
2. 导入少量 UTF-8 Markdown/文本技能，审阅后**明确启用**。
3. 配置输出检查，分别测试应通过与应拒绝的样例。
4. 审阅全部四份法律文档。必要时 `auth wake`，再执行 `auth login --accept-terms <已审阅摘要>`，并在 GitHub 批准 **Koder Open CLI** 设备码。每次安装需单独批准。
5. 配置完整模型端点、精确模型 ID 与环境变量名；密钥只放在本机进程环境。DeepSeek 短任务可设 `--thinking disabled`。
6. 在 CLI 或 TUI 发一次**小型合成**请求。确认完整回答且检查通过后，再使用真实工作材料。

Star 或本地勾选**不能**签发模型许可。请求会把所选任务、角色与已启用材料发给提供方。

## 4. 排查问题

- **平台不对：** 本版仅接受 macOS Apple Silicon 与 Windows x64。
- **校验不符：** 从指定版本重新下载归档与 `.sha256`，勿混用版本。
- **安装脚本被拦（Windows）：** 保留提示信息，使用管理员批准的分发方式——不要关闭整机安全策略。
- **授权 / 服务休眠：** 先 `auth wake` 再登录。免费托管可能休眠，不承诺永久可用。
- **模型调用失败：** 核对端点、模型 ID、环境变量名，并确认密钥不在角色文件内。见 [MODEL_COMPATIBILITY.md](MODEL_COMPATIBILITY.md)。
- **TUI 与 setup 混淆：** 两者共享同一 `--home` 库，请固定一个路径。
- **需要更深恢复：** 见 [INSTALLATION.md](INSTALLATION.md) 与[中文手册](https://karmenloop.github.io/koder-open-cli/handbook/)。

## 5. 升级、回退与卸载

| 项目 | macOS | Windows |
| --- | --- | --- |
| 运行时 | `~/.local/share/koder-open/versions/<version>` | `%LOCALAPPDATA%\KarmenLoop\koder-open\versions\<version>` |
| 命令 | `~/.local/bin/koder-open` | `%LOCALAPPDATA%\KarmenLoop\koder-open\bin\koder-open.cmd` |
| 用户数据 | `~/.koder-open` 或你的 `--home` | 用户目录下 `.koder-open` 或你的 `--home` |

升级时用户数据单独保留。安装器会拒绝外来命令、不安全路径、被改动的负载，或同一版本目录下内容不一致——不要强行覆盖。

**回退（Mac）：** 在较新解压目录执行 `sh install.sh --rollback`，回到已验证的受管前一版本。这恢复的是运行时，不是过去的用户配置或授权。

**卸载：** 运行已安装的 `uninstall.sh`（Mac）或版本目录中的 `uninstall.ps1`（Windows），自定义安装路径需保持一致。用户数据默认保留。Mac 卸载器在移除受管运行时前，若发现意外文件会拒绝继续。

## 6. 候选文档与可用下载

**dev.8** 候选材料（学习预习、诊断、Windows 签名准备）记在 [docs/candidates/dev8/](candidates/dev8/VALIDATION.md) 与[候选手册](https://karmenloop.github.io/koder-open-cli/candidates/dev8/handbook/)。不要把候选文档当成 **0.2.0-dev.7** 已交付功能。

激活与 Mac 合成 DeepSeek 检查证据见 [VALIDATION.md](VALIDATION.md)。Windows 真实提供方调用仍未验收。外部工具、渠道执行、无人值守学习与独立生产验收均不在本版范围。

[项目首页](../README.zh-CN.md) · [English tutorial](tutorial.en.md) · [法律文档](legal/terms.md)
