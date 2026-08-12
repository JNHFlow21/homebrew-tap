class AgentSwitchCli < Formula
  desc "Local control plane for AI agents, MCP servers, and secrets"
  homepage "https://github.com/JNHFlow21/agent-switch"
  url "https://github.com/JNHFlow21/agent-switch/releases/download/v0.3.0/agent_switch-0.3.0.tar.gz"
  sha256 "5dab37f3291644ffa4d3e685ced4287337b985ef153817115039d1b8605ebcb6"
  license "MIT"

  depends_on :macos
  depends_on "python@3.14"

  def install
    libexec.install "src/agent_switch"

    python = formula_opt_bin("python@3.14")/"python3.14"
    commands = {
      "agent-switch"          => "agent_switch",
      "agent-switch-mcp-bird" => "agent_switch.mcp.bird_server",
      "agent-switch-mcp-xcli" => "agent_switch.mcp.xcli_server",
    }

    commands.each do |command, module_name|
      script = bin/command
      script.write <<~SH
        #!/bin/bash
        PYTHONPATH="#{libexec}" exec "#{python}" -P -m "#{module_name}" "$@"
      SH
      script.chmod 0755
    end
  end

  test do
    assert_match "agent-switch 0.3.0", shell_output("#{bin}/agent-switch --version")
    ENV["HOME"] = testpath.to_s
    system bin/"agent-switch", "write-default-config"
    assert_path_exists testpath/".config/agent-switch/config.json"
  end
end
