cask "chatpane" do
  arch arm: "arm", intel: on_system_conditional(macos: "intel", linux: "x64")
  os macos: "mac", linux: "lin"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "3.3.1"
  sha256 arm:          "86b2bb2dd4649fab382cbec5ab7e99c87720360bd2f3095d325c742fd015a99d",
         intel:        "ba1439dd60c627cc1e412ed9b40630dc1b63e7a4c87c7df81b8afe6c88f6cf5b",
         arm64_linux:  "0af6c1f3abd4e839cd8f41a1d4d435cd82b98bff4dc4ffda9a2fc3f3f10b7487",
         x86_64_linux: "1648468cb197e27698900bbc1e02d370f18959102adaff2638d3a5cdd72c76bb"

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
