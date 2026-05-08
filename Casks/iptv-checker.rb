cask "iptv-checker" do
  version "1.5.0"

  on_macos do
    on_arm do
      sha256 "9380497d3a93e6f03b0ffc186742cc692803a0ae123cb3b11a4fb9dc42379a63"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "9a1364146aabc80f4758d5e803305f5225db422ea0b7b3fd9f2b6ee386b0618c"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg",
verified: "github.com/kristofferR/IPTVChecker/"
    end
  end

  on_linux do
    on_arm do
      sha256 "f5849eacd67348aff10337c1b586bb69fa0731b08ca3f146e6334ea2cfc7b73c"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "3bb112b3afc1fa820e14fd59fb5e79710fa9a431f29ce7e9d96714ab57b84658"

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
