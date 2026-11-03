# ShiftStage — Homebrew tap

The Mac agent for [ShiftStage](https://shiftstage.app/r/github-tap): your Mac's terminal, files,
git repositories, processes and AI coding sessions, served to native screens on your
iPhone, iPad and Apple Watch. Not a remote desktop. The agent hands the app structured
services, and the work itself stays on your Mac.

```sh
brew install --cask shiftstage/shiftstage/shiftstage-agent
```

> The first release is not out yet. The command above starts working when it is published.

## What you get

- **Signed and notarised.** The agent is signed with a Developer ID and notarised by Apple;
  Gatekeeper checks both on first launch.
- **Checked before it unpacks.** Homebrew compares the archive's SHA-256 with the one in
  [`Casks/shiftstage-agent.rb`](Casks/shiftstage-agent.rb) before installing anything.
- **Updates itself.** The agent updates on its own; `brew upgrade` is not needed.
- **End-to-end encrypted.** The phone and the Mac authenticate each other with keys only
  they hold. Files, commands and conversations never reach our servers. See the
  [privacy policy](https://shiftstage.app/privacy/).

## Requirements

- macOS 15 or later
- The ShiftStage app on your iPhone (App Store)

## Without Homebrew

Download the archive from [Releases](../../releases), unpack it, move
**ShiftStage Agent.app** to Applications, and check it:

```sh
codesign --verify --deep --strict "/Applications/ShiftStage Agent.app"
spctl --assess --type execute "/Applications/ShiftStage Agent.app"
```

## Uninstall

```sh
brew uninstall --cask shiftstage-agent        # the app
brew uninstall --zap --cask shiftstage-agent  # the app and its data
```

## Support

This repository only distributes the agent. Write to
[support@shiftstage.app](mailto:support@shiftstage.app) for questions and bug reports.
