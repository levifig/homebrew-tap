# Levi's Homebrew Tap

Homebrew formulae for Levi Figueira's tools.

## Install Loaf

```bash
brew tap levifig/tap
brew install loaf
```

Upgrade after new releases:

```bash
brew update
brew upgrade loaf
```

## Formula Maintenance

`Formula/loaf.rb` is updated by Loaf's release workflow after release archives are uploaded to GitHub. The formula installs a platform-specific native `loaf` binary plus Loaf's packaged `config`, `content`, `dist`, and `plugins` assets under Homebrew's `libexec`.

Manual validation:

```bash
brew style levifig/tap/loaf
brew audit --strict --online levifig/tap/loaf
brew install --build-from-source levifig/tap/loaf
brew test levifig/tap/loaf
```
