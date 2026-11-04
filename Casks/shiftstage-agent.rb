cask "shiftstage-agent" do
  version "1.0"
  sha256 "1e125d95952e6d74d203febe03100fddd1f28e8ff291a91aaecde816be89045b"

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
