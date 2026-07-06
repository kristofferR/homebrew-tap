cask "carrier" do
  version "1.2.2"

  on_macos do
    on_arm do
      sha256 "d4c976a03ef6e7c2b99812a837828822a83dcf15ec5ae5b233857b15e1e89842"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "7abe688f8d7ef089441925cdf16d3a1ce7b4666542fe4ca3402f61d656462549"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_intel.dmg",
verified: "github.com/kristofferR/Carrier/"
    end
  end

  on_linux do
    on_arm do
      sha256 "d1ee043e310ddd78e6a8c3f7166b9c7b07a2c951bd9a45b104b36fc0a17ac439"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "663f568b325ff468aeeb4949f0efb8ad14ae746bab53bd0e9e723e42be91f98a"

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
