cask "agent-switch" do
  version "0.3.0"
  sha256 "ff401ebbdb8e72a3320a0531f72a87c9d126847de55dbe29925c0f05bfe4d030"

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
