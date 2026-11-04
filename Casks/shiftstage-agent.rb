cask "shiftstage-agent" do
  version "1.0.1"
  sha256 "fcaa6cd38d340a53339979d1f3d45de27a60ecbe77a77cb50867b8931669593b"

  url "https://github.com/shiftstage/homebrew-shiftstage/releases/download/v#{version}/ShiftStage-Agent-#{version}.zip"
  name "ShiftStage Agent"
  desc "Agent that serves terminal, files and Git to the ShiftStage phone app"
  homepage "https://shiftstage.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The agent updates itself from a signed manifest; brew upgrade does not fight it.
  auto_updates true
  depends_on macos: :sequoia

  app "ShiftStage Agent.app"

  uninstall quit:       "com.sannikov.shiftstage.agent",
            login_item: "ShiftStage Agent"

  # The keychain is left alone: trusted devices and tokens belong to the user,
  # and the cask does not delete them.
  zap trash: [
    "~/Library/Application Support/ShiftStage Agent",
    "~/Library/Caches/com.sannikov.shiftstage.agent",
    "~/Library/HTTPStorages/com.sannikov.shiftstage.agent",
    "~/Library/Preferences/com.sannikov.shiftstage.agent.plist",
    "~/Library/Saved Application State/com.sannikov.shiftstage.agent.savedState",
  ]
end
