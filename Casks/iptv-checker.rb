cask "iptv-checker" do
  arch arm: "arm", intel: "x64"

  version "1.0.0"
  sha256 arm:   "f4a03acfeeb743787677338d774c324e7325411acea7b64f48df2cb83552490d",
         intel: "4c93dcd2e6f454576c91119085d34343095f8f6c412f61973e130bce38486184"

  url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_#{arch}.app.tar.gz",
      verified: "github.com/kristofferR/IPTVChecker/"
  name "IPTV Checker"
  desc "Validate IPTV playlists and inspect stream health"
  homepage "https://github.com/kristofferR/IPTVChecker"

  preflight do
    old_app = Pathname.new("/Applications/IPTV Checker.app")
    next unless old_app.symlink?

    target = old_app.readlink.to_s
    old_app.delete if target.include?("/opt/homebrew/opt/iptv-checker/") || target.include?("/usr/local/opt/iptv-checker/")
  end

  app "IPTV Checker.app"
end
