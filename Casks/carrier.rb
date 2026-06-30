cask "carrier" do
  version "1.1.0"

  on_macos do
    on_arm do
      sha256 "f562b0ae67fc026ced097686c3ff7946892df92e1623a80df0bac9509bd5eb7a"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_arm.dmg",
          verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "933adad13e53c2dee94a124dc0f013e9bd7c1dcd464d53288debd2d1b299cbc0"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_mac_x64.dmg",
          verified: "github.com/kristofferR/Carrier/"
    end
  end

  on_linux do
    on_arm do
      sha256 "65308797714e2745db52c6f571888297b32d2b54c158c73bad15f2c55895d3ba"

      url "https://github.com/kristofferR/Carrier/releases/download/v#{version}/Carrier_#{version}_lin_arm.AppImage",
          verified: "github.com/kristofferR/Carrier/"
    end

    on_intel do
      sha256 "e030a2d252218e99a9e4326c93392343809bb7c425c0b1453f32617c3e13b32e"

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
