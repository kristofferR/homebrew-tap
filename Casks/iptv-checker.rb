cask "iptv-checker" do
  version "1.8.1"

  on_macos do
    on_arm do
      sha256 "99a3ea3c3360b9054dd72c42de78574836ff50b5c2aac2f21b17a72b2d14e5d4"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "55377e65ac0ca3e0290e1661ff178b84e1ca92359b0152fd82b3bef430e12825"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end
  end

  on_linux do
    on_arm do
      sha256 "ee544cec782a1c5a92d1c6af1cb145d442999f9510c47bb605e5ec57351253a0"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "0eabe65fcfcab3c9955fad84b3aa66b1448069f44b99bc90f1313d2d898d97ba"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_x64.AppImage",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    container type: :naked
  end

  name "IPTV Checker"
  desc "Validate IPTV playlists and inspect stream health"
  homepage "https://github.com/kristofferR/IPTVChecker"

  # The app ships a signed in-app updater, so a cask-installed copy can
  # update itself between `brew upgrade` runs.
  auto_updates true

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
      binary "IPTV.Checker_#{version}_lin_arm.AppImage", target: "iptv-checker"
    end

    on_intel do
      binary "IPTV.Checker_#{version}_lin_x64.AppImage", target: "iptv-checker"
    end
  end
end
