cask "buildmeter" do
  version "1.1.0"
  sha256 "577c253bc948d670830b2c848fba85eb4faf25827a3746e8cc1e9845cdef9284"

  url "https://github.com/birhos/BuildMeter/releases/download/v#{version}/BuildMeter-#{version}.dmg"
  name "BuildMeter"
  desc "Menu bar app and widget for Flutter, .NET, React and Next.js build times"
  homepage "https://github.com/birhos/BuildMeter"

  depends_on macos: ">= :sonoma"

  app "BuildMeter.app"

  zap trash: "~/.buildmeter"

  caveats <<~EOS
    BuildMeter is not notarized yet. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine #{appdir}/BuildMeter.app
  EOS
end
