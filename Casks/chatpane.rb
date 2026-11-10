cask "chatpane" do
  arch arm: "arm", intel: on_system_conditional(macos: "intel", linux: "x64")
  os macos: "mac", linux: "lin"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "3.2.0"
  sha256 arm:          "d09ebcbe40715b8e4bff6ad6d06b43888b88c87410d440aef8c4f3747a552b6d",
         intel:        "247203c4c13d9f5068a238c46fb8f9ad171c89e47d8a4a12354f6d113aa37bf9",
         arm64_linux:  "3efc9b01420e212c8857bdec5f0504bba97a77b64ba63cfb3b2e45790bc95a9b",
         x86_64_linux: "28bd513590155dbece1f02a8a860960c7a08583680fbb7c2fd15136db8d8c692"

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
