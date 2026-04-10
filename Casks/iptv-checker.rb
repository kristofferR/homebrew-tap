cask "iptv-checker" do
  version "1.2.0"

  on_macos do
    on_arm do
      sha256 "2e30b4175d9ba2851372a110278bbe5c1af258ee7b86c4a20d68926e342de677"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_arm.dmg",
          verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "1861bb7a751bfbc7bc0d1994942b73b3496ca6c3379d70630a445623c099c1f7"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_mac_x64.dmg",
          verified: "github.com/kristofferR/IPTVChecker/"
    end
  end

  on_linux do
    on_arm do
      sha256 "e56e8a5a1925cdf1a87fb1f7fd8fe07402851044d3f0206bd0f026471bbf6ae0"

      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage",
          verified: "github.com/kristofferR/IPTVChecker/"
    end

    on_intel do
      sha256 "1e4330dd8348759f3f3cc9a638a9aec6b2942a4aea401a98305e588c7e6ffdf1"

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
