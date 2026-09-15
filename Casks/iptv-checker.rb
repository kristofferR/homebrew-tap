cask "iptv-checker" do
  version "2.0.1"

  on_macos do
    on_arm do
      sha256 "f1aaf50325960df301554a5ca13db82346b8a596dbf0984178f41c5066ed7cb9"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "0d797edd9339157ff1f6c3296f632480734c54f6cc06a85f80f7cf024bbef773"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end
  end

  on_linux do
    on_arm do
      sha256 "7258bbaddf0f4eebf03044dd74c3b222d930098b3345866b1fa4c84fc8f438ff"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "3f4a63c53b49de9b3ab42b4d6f853a34eae3f3edb619a0549494129504775085"

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
