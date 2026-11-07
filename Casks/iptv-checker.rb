cask "iptv-checker" do
  version "2.3.2"

  on_macos do
    on_arm do
      sha256 "127d0a909c19885715bc5c8480857063a504997c5585dee88b125c3a7d9b080b"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg"
    end

    on_intel do
      sha256 "d4ebab5f304fb8afe3809035649340e9075e04ed3ff412ada064e56c4612e919"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg"
    end
  end

  on_linux do
    on_arm do
      sha256 "4dce36a65aa74a3be862a468e4a06bbdeaa2457fc28e7e6b2ce8f6bcb6e6f547"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage"
    end

    on_intel do
      sha256 "73b769ff388fe0851db9334efeeb0458417ea0540624f05a952b12e9e3c61908"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_x64.AppImage"
    end

    container type: :naked
  end

  name "IPTV Checker"
  desc "Validate IPTV playlists and inspect stream health"
  homepage "https://github.com/kristofferR/IPTVChecker"

  # The app ships a signed in-app updater, so a cask-installed copy can
  # update itself between `brew upgrade` runs.
  auto_updates true

  preflight_steps do
    on_macos do
      remove "/Applications/IPTV Checker.app", symlink_target_contains: "/opt/homebrew/opt/iptv-checker/"
      remove "/Applications/IPTV Checker.app", symlink_target_contains: "/usr/local/opt/iptv-checker/"
    end
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
