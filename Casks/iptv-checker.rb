cask "iptv-checker" do
  arch arm: "arm", intel: "x64"
  os macos: "mac", linux: "lin"

  version "1.0.0"
  on_macos do
    sha256 arm:   "ea48a8f6b177bb07b7e6b25fb6a82b11e646b3e192d9ab3dfd644417da360d91",
           intel: "2260fa9f593b74cd89806c9d14d03f6958ff1066ae50d888565296288b62ed33"

    url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_#{os}_#{arch}.dmg",
        verified: "github.com/kristofferR/IPTVChecker/"
  end

  on_linux do
    sha256 arm64_linux:  "304ff7be0f611e4ea801d99a4876ab8e9f7e6c00490b0a1ea52445700b942445",
           x86_64_linux: "ed6c145832d7d409ec4be34c7c37e58a70a29cedf08f737dd858db8cc0e4ca5d"

    url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_#{os}_#{arch}.AppImage",
        verified: "github.com/kristofferR/IPTVChecker/"

    container type: :naked
  end

  name "IPTV Checker"
  desc "Validate IPTV playlists and inspect stream health"
  homepage "https://github.com/kristofferR/IPTVChecker"

  preflight do
    old_app = Pathname.new("/Applications/IPTV Checker.app")
    next unless old_app.symlink?

    target = old_app.readlink.to_s
    old_app.delete if target.include?("/opt/homebrew/opt/iptv-checker/") || target.include?("/usr/local/opt/iptv-checker/")
  end

  on_macos do
    app "IPTV Checker.app"
  end

  on_linux do
    binary "IPTV.Checker_#{version}_#{os}_#{arch}.AppImage", target: "iptv-checker"
  end
end
