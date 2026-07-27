cask "carrier" do
  version "1.7.1"

  on_macos do
    on_arm do
      sha256 "1759723a1ce9a5a81ad6261b8bded613f400a7dd47ae57a904ee5eaa1cbeae50"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "1add60ce6b9cd8667ee38266dcf1740848407a4b13d8814372ddaa1bec14b6af"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_intel.dmg",
verified: "github.com/kristofferR/Carrier/"
    end
  end

  on_linux do
    on_arm do
      sha256 "66577def0a951aabba94663a6ce31a96089c3e1773698dae1a03f9f87e7f9de1"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "bd5c2efdb9e0621bb37fcc6b6d1e1de025c9fd991835d81d551582493268be93"

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
