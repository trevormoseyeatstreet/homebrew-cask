cask "ableton-live-lite" do
  arch = (MacOS.version >= :mojave) ? "universal" : "intel"
  version "11.2"

  if MacOS.version >= :mojave
    sha256 "9f9ecdb2a1b7684fdd00d49acb742ded1de0c61f05fcf703e8522db9836f0df2"
  else
    sha256 "fefadad3f6cd5d727f897000374d16da9f709f56991f6fcc257bb8b14d76a65d"
  end

  url "https://cdn-downloads.ableton.com/channels/#{version}/ableton_live_lite_#{version}_#{arch}.dmg"
  name "Ableton Live Lite"
  desc "Sound and music editor"
  homepage "https://www.ableton.com/en/products/live-lite/"

  livecheck do
    cask "ableton-live-suite"
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Ableton Live #{version.major} Lite.app"

  uninstall quit: "com.ableton.live"

  zap trash: [
    "~/Library/Application Support/Ableton",
    "~/Library/Application Support/CrashReporter/Ableton *_*.plist",
    "~/Library/Application Support/CrashReporter/Live_*.plist",
    "~/Library/Caches/Ableton",
    "~/Library/Preferences/Ableton",
    "~/Library/Preferences/com.ableton.live.plist*",
    "~/Music/Ableton",
  ]
end
