# Midnight Moss Homebrew Formula

This directory contains the Homebrew formula for installing Midnight Moss themes on macOS.

## Installation

### Option 1: Install from Tap (Recommended)

Once we have a Homebrew tap set up:

```bash
# Add the tap
brew tap homunculuslabs/themes

# Install
brew install midnight-moss-themes
```

### Option 2: Install Directly from Formula

```bash
brew install --formula https://raw.githubusercontent.com/HomunculusLabs/midnight-moss-theme/main/homebrew/midnight-moss-themes.rb
```

### Option 3: Local Installation

```bash
# Clone the repository
git clone https://github.com/HomunculusLabs/midnight-moss-theme.git
cd midnight-moss-theme

# Install from local formula
brew install --formula ./homebrew/midnight-moss-themes.rb
```

## What Gets Installed

The formula installs theme files to `$(brew --prefix)/share/`:

| Location | Contents |
|----------|----------|
| `share/midnight-moss/` | Full theme repository |
| `share/alacritty/themes/` | Alacritty terminal theme |
| `share/kitty/themes/` | Kitty terminal theme |
| `share/iterm2/` | iTerm2 color scheme |
| `share/vim/colors/` | Vim colorscheme |
| `share/nvim/colors/` | Neovim colorscheme |
| `share/zsh/themes/` | Zsh theme |
| `share/tmux/` | tmux configuration |
| `share/starship/` | Starship prompt config |
| `share/zellij/themes/` | Zellij theme |
| `share/obsidian/themes/` | Obsidian theme |
| `share/vscode/` | VS Code theme |
| `share/sublime-text/` | Sublime Text color scheme |
| `share/jetbrains/` | JetBrains IDE scheme |
| `share/firefox/` | Firefox userChrome files |

## Post-Installation

After installation, run `brew info midnight-moss-themes` to see setup instructions for each application.

## Creating a Homebrew Tap

To distribute via your own tap:

1. Create a new repository named `homebrew-themes` (or any name with `homebrew-` prefix)
2. Copy `midnight-moss-themes.rb` to the repository root or `Formula/` directory
3. Update the SHA256 hash in the formula after creating a release:
   ```bash
   curl -sL https://github.com/HomunculusLabs/midnight-moss-theme/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
   ```
4. Users can then install with:
   ```bash
   brew tap homunculuslabs/themes
   brew install midnight-moss-themes
   ```

## Updating the Formula

When releasing a new version:

1. Update the `version` in the formula
2. Update the `url` to point to the new release tag
3. Update the `sha256` hash:
   ```bash
   curl -sL https://github.com/HomunculusLabs/midnight-moss-theme/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```

## Uninstallation

```bash
brew uninstall midnight-moss-themes
```

Note: This removes the formula-installed files but not any copies you made to your config directories.
