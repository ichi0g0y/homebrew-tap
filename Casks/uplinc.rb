cask "uplinc" do
  version "0.1.8"
  sha256 "f9811f2606a8eb9197999d0f65498e00d7aea4513a9e30b2eb06cca53eb0413a"

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
