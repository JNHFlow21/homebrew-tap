cask "agent-switch" do
  version "0.2.0"
  sha256 "b1bc3f7f019e9f59acb54b5a51e042e8b8c2b4edba489844993e09396b0a8c9a"

  url "https://github.com/JNHFlow21/agent-switch/releases/download/v#{version}/Agent-Switch-#{version}-macos-universal.zip"
  name "Agent Switch"
  desc "Manage MCP servers and credentials across local AI agents"
  homepage "https://github.com/JNHFlow21/agent-switch"

  depends_on formula: "jnhflow21/tap/agent-switch-cli"
  depends_on macos: :sonoma

  app "Agent Switch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Agent Switch.app"]
  end

  caveats <<~EOS
    Agent Switch #{version} is ad-hoc signed and not Apple-notarized.
    This Cask removes Gatekeeper quarantine after installation. Review the
    public source and release checksums before installing.
  EOS
end
