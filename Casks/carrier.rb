cask "carrier" do
  version "1.2.4"

  on_macos do
    on_arm do
      sha256 "7fd2bd45bad6d6bbfe8f16f62b318217ee9d5215779e74d2c76e651a21aadd0a"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_arm.dmg",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "29ed93eac8fd09f1412b14bc333be08b8914fa8fe937ceb328b1ce643be58775"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_intel.dmg",
verified: "github.com/kristofferR/Carrier/"
    end
  end

  on_linux do
    on_arm do
      sha256 "8a71fae12167869dcf96e66246d7c5d79bfd6f283528a938a4584fed9e70c88c"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_lin_arm.AppImage",
verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "d62026902582489c0af9a12c1dbaaa6b7a9558b67ec4d9613b33719325cb47cb"

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
