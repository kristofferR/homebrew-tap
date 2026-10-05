cask "iptv-checker" do
  version "2.2.1"

  on_macos do
    on_arm do
      sha256 "a27b9874fdd6532dab307d85cd43d796ac994a4f26497438fbf0ff5a6bd8bf87"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg"
    end

    on_intel do
      sha256 "73c3e953d1bc041207a06689b092d950ef166008bd49e195453b64a5c24a6325"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg"
    end
  end

  on_linux do
    on_arm do
      sha256 "bfda511a1297181103dd5915ce23510e50041b7bdd88ee0bcf2d554e7b8e2b3f"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage"
    end

    on_intel do
      sha256 "b07b68dc6613a707ca30bc460a03a83e83a13e18f5797db15cc85f33329135a6"

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
