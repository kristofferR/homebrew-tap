cask "carrier" do
  version "1.12.0"

  on_macos do
    on_arm do
      sha256 "75afad527ba7636bfd8233dd34a3a6606da5d2349f7ec2cc9b169aadd5de7048"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "86d6c371803421ee38cd790d415de7b64ef5b1569b940bde6c1639b1f3d78c80"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_intel.dmg",
verified: "github.com/kristofferR/Carrier/"
    end
  end

  on_linux do
    on_arm do
      sha256 "b08a65d9826e609461028ee7a43e5b9d9322a37e251bd2e040ba811c01c07d64"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "10d54406bfbca5914bf19b4dcc7350435a50a26d22262500baf32fb02a6609ed"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_lin_x64.AppImage",
verified: "github.com/kristofferR/Carrier/"
    end

    container type: :naked
  end

  name "Carrier"
  desc "Distraction-free desktop client for Facebook Messenger"
  homepage "https://github.com/kristofferR/Carrier"

  on_macos do
    app "Carrier.app"
  end

  on_linux do
    on_arm do
      binary "Carrier_#{version}_lin_arm.AppImage", target: "carrier"
    end

    on_intel do
      binary "Carrier_#{version}_lin_x64.AppImage", target: "carrier"
    end
  end
end
