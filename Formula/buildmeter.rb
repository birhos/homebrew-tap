class Buildmeter < Formula
  desc "Measure how long flutter run and flutter build take"
  homepage "https://github.com/birhos/BuildMeter"
  url "https://github.com/birhos/BuildMeter/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6879b486080ebace9fcb530f9de98291b2f4a01bc059cd69b0e9d9777f457943"
  license "MIT"
  head "https://github.com/birhos/BuildMeter.git", branch: "main"

  def install
    bin.install "cli/buildmeter-track"
    inreplace "cli/buildmeter.zsh", "$HOME/.buildmeter/bin/buildmeter-track", opt_bin/"buildmeter-track"
    pkgshare.install "cli/buildmeter.zsh"
  end

  def caveats
    <<~EOS
      To track flutter run/build automatically, add this to your ~/.zshrc:
        source #{opt_pkgshare}/buildmeter.zsh

      Records are written to ~/.buildmeter/events.jsonl.
      The macOS app is available as a cask: brew install --cask birhos/tap/buildmeter
    EOS
  end

  test do
    ENV["BUILDMETER_DATA_DIR"] = testpath/".buildmeter"
    assert_equal "hello", shell_output("#{bin}/buildmeter-track echo hello").strip
    assert_match "buildmeter-track", File.read(pkgshare/"buildmeter.zsh")
  end
end
