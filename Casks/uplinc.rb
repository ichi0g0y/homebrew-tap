cask "uplinc" do
  version "0.1.3"
  sha256 "b23aac2bea71811f30f86fb56b9a973ab09db366870357e4b5010a9317c94744"

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
