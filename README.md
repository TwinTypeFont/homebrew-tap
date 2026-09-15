# TwinType Homebrew Tap

```
brew tap TwinTypeFont/tap
brew install --cask twintype-cloud
```

## How casks get updated

`Casks/twintype-cloud.rb` is bumped automatically by the `publish-release`
job in [`TwinTypeFont/fontPieClientPrototype`](https://github.com/TwinTypeFont/fontPieClientPrototype)'s
`.github/workflows/release.yml`, via `mislav/bump-homebrew-formula-action`,
every time a `v*` tag is released there. No manual steps needed for normal
releases.

The cask's `url` points at `cloud-api.twintype.co`, not GitHub directly —
`fontPieClientPrototype` is a private repo, so its release assets 404 for
an anonymous `brew install`. The Server route proxies the real, CI-signed
installer for one fixed version straight from the GitHub release.
