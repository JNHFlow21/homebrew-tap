<p align="center">
  <a href="README.md">English</a> · <strong>简体中文</strong>
</p>

# JNHFlow21 Homebrew Tap

用于发布 JNHFlow21 项目的官方 Homebrew Formula 与 Cask。

## 安装 Agent Switch

复制执行一条命令：

```bash
brew tap JNHFlow21/tap && brew trust --tap JNHFlow21/tap && brew install --cask JNHFlow21/tap/agent-switch
```

它会同时安装：

- 位于 `/Applications` 的 `Agent Switch.app`；
- App 所需的 `agent-switch` CLI 和配套 MCP Server 命令；
- 由同一个 Tap 管理的后续升级。

预期结果：

```bash
agent-switch --version
open -a "Agent Switch"
```

CLI 会输出 `agent-switch 0.2.0`，原生 App 会从
`/Applications/Agent Switch.app` 打开。

## 安全说明

> [!WARNING]
> Agent Switch 当前使用 ad-hoc 签名，尚未经过 Apple 公证。主要的 Alpha
> Cask 会在安装完成后移除 Gatekeeper quarantine。安装前请先检查
> [公开源码][source]和 [GitHub Release][release] 中的校验和。

## 升级

```bash
brew upgrade --cask JNHFlow21/tap/agent-switch
```

## 卸载

```bash
brew uninstall --cask agent-switch
brew uninstall agent-switch-cli
```

卸载不会删除 `~/.config/agent-switch`，因为其中可能保存了本地 MCP 定义和凭据。

## 软件包

| 软件包 | 类型 | 用途 |
| --- | --- | --- |
| `agent-switch` | Cask | 原生 macOS App |
| `agent-switch-cli` | Formula | App 运行所需的 CLI 后端 |

## 文档

首次运行、MCP 和凭据工作流见 [Agent Switch README][source]。

## 支持

可复现的问题请提交到 [Agent Switch Issues][issues]。

## 许可证

[MIT](LICENSE) © 2026 JNHFlow21

[source]: https://github.com/JNHFlow21/agent-switch
[release]: https://github.com/JNHFlow21/agent-switch/releases/tag/v0.2.0
[issues]: https://github.com/JNHFlow21/agent-switch/issues
