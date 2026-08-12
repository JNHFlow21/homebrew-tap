<p align="center">
  <strong>English</strong> · <a href="README.zh-CN.md">简体中文</a>
</p>

# JNHFlow21 Homebrew Tap

Official Homebrew Formulae and Casks for JNHFlow21 projects.

## Install Agent Switch

Paste one command:

```bash
brew tap JNHFlow21/tap && brew trust --tap JNHFlow21/tap && brew install --cask JNHFlow21/tap/agent-switch
```

This installs:

- `Agent Switch.app` in `/Applications`;
- the `agent-switch` CLI and its bundled MCP server commands;
- Homebrew-managed updates through the same Tap.

Expected result:

```bash
agent-switch --version
open -a "Agent Switch"
```

The CLI prints `agent-switch 0.3.0`, and the native app opens from
`/Applications/Agent Switch.app`.

## Security

> [!WARNING]
> Agent Switch is currently ad-hoc signed and not Apple-notarized. The primary
> Alpha Cask deliberately removes Gatekeeper quarantine after installation.
> Review the [public source][source] and the checksums on the [GitHub
> Release][release] before installing.

## Upgrade

```bash
brew upgrade --cask JNHFlow21/tap/agent-switch
```

## Uninstall

```bash
brew uninstall --cask agent-switch
brew uninstall agent-switch-cli
```

Uninstalling does not delete `~/.config/agent-switch`, which can contain local
MCP definitions and credentials.

## Packages

| Package | Type | Purpose |
| --- | --- | --- |
| `agent-switch` | Cask | Native macOS application |
| `agent-switch-cli` | Formula | CLI backend required by the application |

## Documentation

See the [Agent Switch README][source] for the first-run MCP and credential
workflow.

## Support

Report reproducible problems in the [Agent Switch issue tracker][issues].

## License

[MIT](LICENSE) © 2026 JNHFlow21

[source]: https://github.com/JNHFlow21/agent-switch
[release]: https://github.com/JNHFlow21/agent-switch/releases/tag/v0.3.0
[issues]: https://github.com/JNHFlow21/agent-switch/issues
