cask "chatpane" do
  arch arm: "arm", intel: on_system_conditional(macos: "intel", linux: "x64")
  os macos: "mac", linux: "lin"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "3.1.0"
  sha256 arm:          "2e9ca32319aa0eb5a4e59f4d28bbab5058893f0a87e8f60e188c5308513dc3f8",
         intel:        "d0d0d0931a3ffe210fb28799f6c3b83ba7e366e54abdae9af4b3dc1c01390932",
         arm64_linux:  "d21521e61ca72423d2ba92f8cb075b251b0919279be9075475d6cf082c227792",
         x86_64_linux: "4eb46cc935db521639c3b0ef89547e9ca19ea65473043786e3523542f56d760a"

  on_macos do
    app "Chatpane.app"

    zap trash: [
      "~/Library/Application Scripts/app.chatpane.Chatpane.share",
      "~/Library/Application Scripts/S5Q742QZEL.app.chatpane.Chatpane",
      "~/Library/Application Support/app.chatpane.Chatpane",
      "~/Library/Caches/app.chatpane.Chatpane",
      "~/Library/Containers/app.chatpane.Chatpane.share",
      "~/Library/Group Containers/S5Q742QZEL.app.chatpane.Chatpane",
      "~/Library/HTTPStorages/app.chatpane.Chatpane.binarycookies*",
      "~/Library/LaunchAgents/Chatpane.plist",
      "~/Library/Logs/app.chatpane.Chatpane",
      "~/Library/Preferences/app.chatpane.Chatpane.plist",
      "~/Library/WebKit/app.chatpane.Chatpane",
    ]
  end
  on_linux do
    app_image "Chatpane_#{version}_lin_#{arch}.AppImage", target: "Chatpane.AppImage"

    zap trash: [
      "~/.cache/app.chatpane.Chatpane",
      "~/.config/autostart/Chatpane.desktop",
      "~/.config/app.chatpane.Chatpane",
      "~/.local/share/app.chatpane.Chatpane",
    ]
  end

  url "https://github.com/kristofferR/Chatpane/releases/download/v#{version}/Chatpane_#{version}_#{os}_#{arch}.#{url_end}",
      verified: "github.com/kristofferR/Chatpane/"
  name "Chatpane"
  name "Chatpane for Messenger"
  desc "Facebook Messenger client"
  homepage "https://chatpane.app/"

  livecheck do
    url :url
    strategy :github_latest
  end
end
