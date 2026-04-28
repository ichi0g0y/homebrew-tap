cask "uplinc" do
  version "0.1.11"
  sha256 "10e7501f059fe18e6312f8e5cf81affc98ea1c1bb6b947b346689fd4176b7b76"

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
