cask "chatpane" do
  arch arm: "arm", intel: on_system_conditional(macos: "intel", linux: "x64")
  os macos: "mac", linux: "lin"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "3.3.0"
  sha256 arm:          "897cf874625ac79e82c1829c634a80b4939c7313215f62c8e8f718c229eaca66",
         intel:        "1694d91490f33ac3ab4091100d5f110704af14b2ede59c2542238f1ec630ad6d",
         arm64_linux:  "40c368fafcfbc269e8b6261bab76da5530b0c04a61ca89e8484e28b025ecec7c",
         x86_64_linux: "36e7069c84bed0165a194ff9721005c24a6327e3f6a71ecf05761c12c36a172c"

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
