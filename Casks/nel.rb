cask "nel" do
  version "0.1.1"
  sha256 "cb4c1055e2218db9de4a10c188d3b166840d52c305e3a1e8264a210cd03b2d6b"

  url "https://github.com/ichi0g0y/Nel/releases/download/v#{version}/Nel-#{version}.dmg"
  name "Nel"
  desc "SwiftUI viewer for 5ch BBS"
  homepage "https://github.com/ichi0g0y/Nel"

  depends_on macos: ">= :ventura"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Nel.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Nel.app"],
                   sudo: false
  end

  uninstall quit: "com.ichi0g0y.Nel"

  zap trash: [
    "~/Library/Preferences/com.ichi0g0y.Nel.plist",
    "~/Library/Application Support/Nel",
    "~/Library/Caches/com.ichi0g0y.Nel",
    "~/Library/Saved Application State/com.ichi0g0y.Nel.savedState",
  ]
end

