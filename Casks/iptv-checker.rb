cask "iptv-checker" do
  version "1.0.0"

  on_arm do
    url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_aarch64.dmg"
    sha256 "ea48a8f6b177bb07b7e6b25fb6a82b11e646b3e192d9ab3dfd644417da360d91"
  end

  on_intel do
    url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_x64.dmg"
    sha256 "2260fa9f593b74cd89806c9d14d03f6958ff1066ae50d888565296288b62ed33"
  end

  name "IPTV Checker"
  desc "Validate IPTV playlists and inspect stream health"
  homepage "https://github.com/kristofferR/IPTVChecker"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "IPTV Checker.app"

  zap trash: [
    "~/Library/Application Support/com.iptvchecker.gui",
    "~/Library/Caches/com.iptvchecker.gui",
    "~/Library/Saved Application State/com.iptvchecker.gui.savedState",
    "~/Library/WebKit/com.iptvchecker.gui",
  ]
end
