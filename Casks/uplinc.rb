cask "uplinc" do
  version "0.1.6"
  sha256 "ab8f1de23e0d7451350fcdf38779a5b263cdfdd342ee9a023fd96b9cf1b1140e"

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
      UplinC is installed as an app only.

      To start it at login, use the source checkout:
        make install
    EOS
  end
end
