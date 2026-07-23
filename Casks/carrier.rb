cask "carrier" do
  version "1.6.0"

  on_macos do
    on_arm do
      sha256 "ff46d33f0d71f1cb8b6fbd5d6d16cccf4d22fac53edc674e16125fa8fcee9c97"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "8d7c08fcdb4d6cbda5f1ca292dc117c3b9ac81bc019e7bccd0b7335811970724"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_intel.dmg",
verified: "github.com/kristofferR/Carrier/"
    end
  end

  on_linux do
    on_arm do
      sha256 "7fb7b5875e23a55deaef0bc4bd781dcd55a6059a63ad17f831d1a68cdd9e56eb"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "2ea28f73716161b39d07a5a81c526e4a3891b2b212eb0f6b522991830b9c7665"

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
