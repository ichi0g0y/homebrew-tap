cask "uplinc" do
  version "0.1.5"
  sha256 "39436a94fc9d439afe3c1c5b360fe7c9a25fc20f2d20d9fa20a46fc33b63277a"

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
