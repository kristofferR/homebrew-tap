class IptvCheckerLinux < Formula
  desc "Validate IPTV playlists and inspect stream health"
  homepage "https://github.com/kristofferR/IPTVChecker"
  version "1.0.0"
  license "MIT"

  on_linux do
    on_arm do
      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_arm.AppImage"
      sha256 "304ff7be0f611e4ea801d99a4876ab8e9f7e6c00490b0a1ea52445700b942445"
    end
    on_intel do
      url "https://github.com/kristofferR/IPTVChecker/releases/download/v#{version}/IPTV.Checker_#{version}_lin_x64.AppImage"
      sha256 "ed6c145832d7d409ec4be34c7c37e58a70a29cedf08f737dd858db8cc0e4ca5d"
    end
  end

  depends_on :linux

  def install
    bin.install Dir["*"].first => "iptv-checker"
  end

  test do
    assert_predicate bin/"iptv-checker", :exist?
  end
end
