cask "iptv-checker" do
  version "1.1.0"

  on_macos do
    on_arm do
      sha256 "cfc3660be2ba533c557c77b033b84c293b03b43884740f0b2d66cd015a459a5d"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_aarch64.dmg",
          verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "90669ecd4bb8a40a31f15881822b8555d28fb4723f8aa0c09a4555e060066f1d"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_x64.dmg",
          verified: "github.com/kristofferR/IPTVChecker/"
    end
  end

  on_linux do
    on_arm do
      sha256 "eee5dd13a2d154d0afe511c4f10e1a0f150f210736d0b227a4663d7bf2f697ed"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_aarch64.AppImage",
          verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "c91f40937e4d2d9dc864a462df5c6331bbfe669598eb9d366e216af80739dc13"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_amd64.AppImage",
          verified: "github.com/kristofferR/IPTVChecker/"
    end

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
    on_arm do
      binary "IPTV.Checker_#{version}_aarch64.AppImage", target: "iptv-checker"
    end

    on_intel do
      binary "IPTV.Checker_#{version}_amd64.AppImage", target: "iptv-checker"
    end
  end
end
