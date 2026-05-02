class Ghx < Formula
  desc "A thin wrapper around gh for multi-account GitHub usage"
  homepage "https://github.com/ichi0g0y/clix"
  license "MIT"
  version "0.3.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/ichi0g0y/clix/releases/download/v0.3.1/ghx-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "2a239d55f09bd2cd136dafecf13cc28d3aa31836489a2d8a9a0815cbde161585"
    end
    on_intel do
      url "https://github.com/ichi0g0y/clix/releases/download/v0.3.1/ghx-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "301ba2b219a55c0e2513864e93634a72360e4a9b68201f48df5f43cc47923efc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ichi0g0y/clix/releases/download/v0.3.1/ghx-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "755ff9c1f98956c6c781fafd8e32895afa048fa544b316eeecb3975cb117ecc6"
    end
    on_intel do
      url "https://github.com/ichi0g0y/clix/releases/download/v0.3.1/ghx-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eee4ba1b6bfc3d71314cc2d1d7b245d0dc42be705358e8dacb6cf49ae6b8fea0"
    end
  end

  def install
    bin.install "ghx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghx version 2>&1")
  end
end
