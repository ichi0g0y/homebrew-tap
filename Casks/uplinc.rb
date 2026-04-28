cask "uplinc" do
  version "0.1.10"
  sha256 "21e290b2b1380c4713910b4abacaea3f395b636b339567f1a5bf5fcb1f144bd0"

  url "https://github.com/ichi0g0y/UplinC/releases/download/v#{version}/UplinC-#{version}.zip"
  name "UplinC"
  desc "Menu bar watchdog for Universal Control links"
  homepage "https://github.com/ichi0g0y/UplinC"

  depends_on macos: ">= :ventura"

  app "UplinC.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/UplinC.app"],
                   sudo: false
  end

  uninstall quit: "local.uplinc"

  caveats do
    <<~EOS
      To start UplinC automatically at login, open the menu and enable
      "Launch at Login".
    EOS
  end
end
