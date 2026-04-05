cask "iptv-checker" do
  arch arm: "arm", intel: "x64"
  os macos: "mac", linux: "lin"

  version "1.0.0"
  on_macos do
    sha256 arm:   "f4a03acfeeb743787677338d774c324e7325411acea7b64f48df2cb83552490d",
           intel: "4c93dcd2e6f454576c91119085d34343095f8f6c412f61973e130bce38486184"

    url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_#{os}_#{arch}.app.tar.gz",
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
