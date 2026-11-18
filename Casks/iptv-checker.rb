cask "iptv-checker" do
  version "2.3.3"

  on_macos do
    on_arm do
      sha256 "4ce6c15ce24af5e585d994f38a87dfb98ad4ecef0bd619232eb83ed7572ba3a6"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg"
    end

    on_intel do
      sha256 "aeb06f2c8a869ea221c66a6b0f588f48beeaf970a18c5f783d59a7a525a8f7f1"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg"
    end
  end

  on_linux do
    on_arm do
      sha256 "b425fec7474ddc991a03e74425c7d895d2c9a344f4cd012f770aaa2455b559fd"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage"
    end

    on_intel do
      sha256 "be04fdcdb12b3e94e531ff60efa258723318b09df1cf2c6fc8ef1627cb46a6fb"

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
