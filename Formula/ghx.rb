class Ghx < Formula
  desc "A thin wrapper around gh for multi-account GitHub usage"
  homepage "https://github.com/ichi0g0y/ghx"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.2.0/ghx-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "738eab06428ca3df1097715d09906df8b7d44cdeb5eb67c6e5bf24e5780b1f2a"
    end
    on_intel do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.2.0/ghx-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "b8fb1be8e5f715f72136f587b3ffae7c625850e095fda601c31995814f9be91e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.2.0/ghx-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8768413ea7ad0f02ae2485ca833bd3e22546a556c396451e3496f259ee316734"
    end
    on_intel do
      url "https://github.com/ichi0g0y/ghx/releases/download/v0.2.0/ghx-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03aa68f1bb3022deb916397677d55f5a7c64eff3b4fe7c6f8522f0da31878f7e"
    end
  end

  def install
    bin.install "ghx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghx version 2>&1", 1)
  end
end
