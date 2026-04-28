cask "uplinc" do
  version "0.1.9"
  sha256 "4c1c3b2bfbe591d734de2b7bc7b9542ea71c25e7786147ad5ab6f34a5cb75e03"

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
