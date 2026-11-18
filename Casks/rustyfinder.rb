cask "rustyfinder" do
  version "0.1.0"
  sha256 "1b4bae4ab90dc04022a95ddda73a154b40761c96a4b7df6e42d10f35135f625d"

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
