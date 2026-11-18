cask "rustyfinder" do
  version "1.0.2"
  sha256 "13ecdda2c4b0a0ff24714e8bbef7ccdfc8b4abe6c64e048083b32e62f6b9120e"

  url "https://github.com/daniel3606/rustyfinder/releases/download/v#{version}/RustyFinder-#{version}-macOS-arm64.zip"
  name "RustyFinder"
  desc "Dual-pane file manager powered by Rust"
  homepage "https://github.com/daniel3606/rustyfinder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "RustyFinder.app"

  uninstall quit: "dev.rustyfinder.RustyFinder"

  zap trash: [
    "~/Library/Application Support/RustyFinder",
    "~/Library/Caches/dev.rustyfinder.RustyFinder",
    "~/Library/HTTPStorages/dev.rustyfinder.RustyFinder",
    "~/Library/Preferences/dev.rustyfinder.RustyFinder.plist",
    "~/Library/Saved Application State/dev.rustyfinder.RustyFinder.savedState",
  ]

  caveats <<~EOS
    RustyFinder is not notarized by Apple yet, so macOS blocks its first launch
    (and the first launch after each upgrade). To allow it, open RustyFinder,
    then choose "Open Anyway" in System Settings > Privacy & Security.
  EOS
end
