cask "iptv-checker" do
  version "2.0.2"

  on_macos do
    on_arm do
      sha256 "435b3846cd27d89dc83cc2b79bfcdd24610f2c26afb9c8acac7dd6d2ad02c017"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg"
    end

    on_intel do
      sha256 "a6fb2223db2e037e5ee61dad0b4273fbf65a6cc9030b998c0b8bc6e83b5cfa6e"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg"
    end
  end

  on_linux do
    on_arm do
      sha256 "267f8e763f19c11ff65cb6977483c6722d08069775226507b03ee3940fa608d3"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage"
    end

    on_intel do
      sha256 "5785bb979c5ae201d08ce6ef35e2bd258cbfbc4e027522d47ea4e2b004ca2eea"

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
