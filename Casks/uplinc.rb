cask "uplinc" do
  version "0.1.12"
  sha256 "8156e13d9dcdf296864e94534ee76c7e08bcbd546554d029e46e42aaea11965f"

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
