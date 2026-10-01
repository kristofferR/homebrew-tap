cask "iptv-checker" do
  version "2.1.0"

  on_macos do
    on_arm do
      sha256 "5d2789aca8b11add4a6bbef118b752def508657fdc9c6c3eaad1e85a464533e6"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg"
    end

    on_intel do
      sha256 "b17cd6e2daaa976ea66e00caff6d1c519a995d773110bb8832e7c3d36a3b27e6"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg"
    end
  end

  on_linux do
    on_arm do
      sha256 "cfe747e0195ee79de1b357a3df3750f3c15f7f6b8d4ebd3d36e0ff531649c443"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage"
    end

    on_intel do
      sha256 "b91d260a94090273c1096d48f5a75b0c86dafc54ba42dc0efe53c39e5542391c"

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
