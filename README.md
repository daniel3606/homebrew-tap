# daniel3606/tap

Homebrew tap for [RustyFinder](https://github.com/daniel3606/rustyfinder), a
fast, native, local-first file manager for macOS.

```sh
brew install --cask daniel3606/tap/rustyfinder
```

| Command | What it does |
| --- | --- |
| `brew upgrade --cask rustyfinder` | Install the latest release |
| `brew uninstall --cask rustyfinder` | Remove the app; your settings stay |
| `brew uninstall --cask --zap rustyfinder` | Also remove settings, favorites and the saved session |

Requirements: a Mac with Apple silicon and macOS 26 (Tahoe) or later.

RustyFinder is not notarized by Apple yet. macOS blocks its first launch
(and the first launch after each upgrade); allow it once with "Open Anyway"
in System Settings › Privacy & Security.

## How the cask is updated

`Casks/rustyfinder.rb` is updated by RustyFinder's release workflow: when a
`v*` tag is pushed there, the workflow builds and publishes the release, then
commits the new `version` and the zip's SHA-256 here. Homebrew downloads the
versioned zip from the GitHub release and refuses it if the checksum differs.
