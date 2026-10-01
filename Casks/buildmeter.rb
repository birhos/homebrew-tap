cask "buildmeter" do
  version "1.0.0"
  sha256 "300483571b85df7459a27df52347bcec96abb967514b1489ef9549ec556ae9f5"

  url "https://github.com/birhos/BuildMeter/releases/download/v#{version}/BuildMeter-#{version}.dmg"
  name "BuildMeter"
  desc "Menu bar app and widget for Flutter build and run times"
  homepage "https://github.com/birhos/BuildMeter"

  depends_on macos: ">= :sonoma"

  app "BuildMeter.app"

  zap trash: "~/.buildmeter"

  caveats <<~EOS
    BuildMeter is not notarized yet. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine #{appdir}/BuildMeter.app
  EOS
end
