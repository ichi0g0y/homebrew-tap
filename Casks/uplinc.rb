cask "uplinc" do
  version "0.1.0"
  sha256 "716ef06224511cf7b9efcc6049aa33c6798c9494211f63c27550d478d853e95a"

  url "https://github.com/ichi0g0y/UplinC/releases/download/v#{version}/UplinC-#{version}.zip"
  name "UplinC"
  desc "Menu bar watchdog for Universal Control links"
  homepage "https://github.com/ichi0g0y/UplinC"

  depends_on macos: ">= :ventura"

  app "UplinC.app"

  uninstall quit: "local.uplinc"

  caveats do
    <<~EOS
      UplinC is installed as an app only.

      To start it at login, use the source checkout:
        make install
    EOS
  end
end
