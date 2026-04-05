class IptvChecker < Formula
  desc "Validate IPTV playlists and inspect stream health"
  homepage "https://github.com/kristofferR/IPTVChecker"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_aarch64.app.tar.gz"
      sha256 "f4a03acfeeb743787677338d774c324e7325411acea7b64f48df2cb83552490d"
    end
    on_intel do
      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_x64.app.tar.gz"
      sha256 "4c93dcd2e6f454576c91119085d34343095f8f6c412f61973e130bce38486184"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_aarch64.AppImage"
      sha256 "304ff7be0f611e4ea801d99a4876ab8e9f7e6c00490b0a1ea52445700b942445"
    end
    on_intel do
      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_amd64.AppImage"
      sha256 "ed6c145832d7d409ec4be34c7c37e58a70a29cedf08f737dd858db8cc0e4ca5d"
    end
  end

  def install
    if OS.mac?
      prefix.install "IPTV Checker.app"
    else
      bin.install Dir["*"].first => "iptv-checker"
    end
  end

  def caveats
    on_macos do
      <<~EOS
        IPTV Checker.app has been installed to:
          #{prefix}/IPTV Checker.app

        To add it to your Applications folder:
          ln -sf "#{prefix}/IPTV Checker.app" "/Applications/IPTV Checker.app"
      EOS
    end
  end

  test do
    if OS.mac?
      assert_predicate prefix/"IPTV Checker.app/Contents/MacOS/iptv-checker", :exist?
    else
      assert_predicate bin/"iptv-checker", :exist?
    end
  end
end
