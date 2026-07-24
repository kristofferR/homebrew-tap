cask "iptv-checker" do
  version "1.7.0"

  on_macos do
    on_arm do
      sha256 "c5f98293a868f3e3a0f4380f1d8f27565af56feac81e5b5ae97904908b6d89e9"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "91f1e5aac86f696cf7703271b4a162249c798b7c2e849df7950c6ac4810ed43d"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end
  end

  on_linux do
    on_arm do
      sha256 "fc0d4587df86f6373ad0be5ae0f6989a3b7be3d999613a45dd8a18a0b588c6a5"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "c4106ee42ea5681132f4cad3672aaaab2c8fbd07b1879ad4881c12bef33a6984"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_x64.AppImage",
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
      binary "IPTV.Checker_#{version}_lin_arm.AppImage", target: "iptv-checker"
    end

    on_intel do
      binary "IPTV.Checker_#{version}_lin_x64.AppImage", target: "iptv-checker"
    end
  end
end
