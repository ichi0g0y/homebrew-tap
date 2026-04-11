class Ghx < Formula
  desc "A thin wrapper around gh for multi-account GitHub usage"
  homepage "https://github.com/ichi0g0y/ghx"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.1.0/ghx-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bd9a40560bd653015497a87f5328951ac2aa4d1bff1c87ffb16f145eebb93983"
    end
    on_intel do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.1.0/ghx-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "553e20e2d31ed170b660ee061d024a1c4c0c0d1dcc312c4249846252266ec566"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.1.0/ghx-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc8bc719221d4fe6f6fb7e832ccb21141ba68da2877afbb59300890f9ed1f9b3"
    end
    on_intel do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.1.0/ghx-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19fabb0216a0ac6a6d1685f46892072716062f0b5bb505e7451ee9e7e613854e"
    end
  end

  def install
    bin.install "ghx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghx version 2>&1", 1)
  end
end
