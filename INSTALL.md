# Midnight Moss Theme - Installation Guide

This guide provides comprehensive installation instructions for the Midnight Moss theme collection.

## Table of Contents

- [Quick Installation](#quick-installation)
- [Installation Methods](#installation-methods)
- [Platform-Specific Instructions](#platform-specific-instructions)
- [Application-Specific Installation](#application-specific-installation)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)
- [Uninstallation](#uninstallation)

## Quick Installation

### Omarchy Base Installation

For a complete omarchy base installation, follow these steps:

```bash
# 1. Clone the repository
git clone https://github.com/babywizzies/midnight-moss-theme.git
cd midnight-moss-theme

# 2. Run the installer (interactive mode)
./install.sh

# OR for non-interactive installation of all supported apps
./install.sh --all --yes

# OR use make targets
make install-all
```

### Prerequisites

The installer will automatically detect which applications you have installed. Make sure you have the applications you want to theme before running the installer.

Supported applications:
- **Terminal Emulators**: Alacritty, Kitty, iTerm2 (macOS)
- **Editors**: Vim, Neovim, VS Code, Sublime Text, JetBrains IDEs
- **Terminal Tools**: tmux, Zellij, Zsh, Starship
- **Applications**: Obsidian, Firefox

## Installation Methods

### Method 1: Automated Script (Recommended)

The automated installer handles everything:

```bash
# Interactive - choose what to install
./install.sh

# Install everything without prompts
./install.sh --all --yes

# Install specific applications
./install.sh -t vim,tmux,zsh

# Dry run to preview changes
./install.sh --dry-run
```

### Method 2: Using Make

The Makefile provides convenient targets:

```bash
# Show all available targets
make help

# Install with common patterns
make install              # Interactive
make install-all          # Everything
make install-terminals    # Terminal emulators only
make install-editors      # Code editors only
make install-tools        # Terminal tools only

# Custom selection
make install TARGETS=vim,tmux,alacritty

# Test before installing
make test
```

### Method 3: Arch Linux Package

For Arch Linux users, install via AUR:

```bash
# Using yay
yay -S midnight-moss-themes

# Using paru
paru -S midnight-moss-themes

# Manual installation with makepkg
cd arch-package
makepkg -si
```

After package installation, themes are available in `/usr/share/themes/midnight-moss/`.

### Method 4: Manual Installation

For individual application setup, see [Application-Specific Installation](#application-specific-installation) below.

## Platform-Specific Instructions

### Linux

All features are fully supported on Linux:

```bash
./install.sh --all --yes
```

### macOS

iTerm2 support is included for macOS:

```bash
./install.sh --all --yes
```

Note: Kitty and Alacritty work on macOS too.

### Windows (WSL)

Works in WSL with supported terminal emulators:

```bash
./install.sh -t vim,tmux,zsh,starship
```

## Application-Specific Installation

### Terminal Emulators

#### Alacritty

```bash
# Automated
./install.sh -t alacritty

# Manual
mkdir -p ~/.config/alacritty/themes
cp alacritty/midnight-moss.toml ~/.config/alacritty/themes/

# Add to alacritty.toml
import = ["~/.config/alacritty/themes/midnight-moss.toml"]
```

#### Kitty

```bash
# Automated
./install.sh -t kitty

# Manual
cp kitty/midnight-moss.conf ~/.config/kitty/
echo "include midnight-moss.conf" >> ~/.config/kitty/kitty.conf
```

#### iTerm2 (macOS)

```bash
# Automated
./install.sh -t iterm2

# Manual
# 1. Open iTerm2
# 2. Go to Preferences → Profiles → Colors
# 3. Click "Color Presets" → "Import"
# 4. Select iterm2/midnight-moss.itermcolors
# 5. Select "Midnight Moss" from the preset list
```

### Code Editors

#### Vim

```bash
# Automated
./install.sh -t vim

# Manual
mkdir -p ~/.vim/colors
cp vim/midnight-moss.vim ~/.vim/colors/

# Add to .vimrc
colorscheme midnight-moss
```

#### Neovim

```bash
# Automated
./install.sh -t neovim

# Manual
mkdir -p ~/.config/nvim/colors
cp neovim/midnight-moss.lua ~/.config/nvim/colors/

# Add to init.lua
vim.cmd('colorscheme midnight-moss')
```

#### VS Code

```bash
# Manual installation recommended
# 1. Copy vscode/midnight-moss-theme.json to VS Code extensions folder
# 2. Or search for "Midnight Moss" in VS Code marketplace (when published)
```

#### Sublime Text

```bash
# Manual
cp sublime-text/midnight-moss.sublime-color-scheme \
   ~/.config/sublime-text/Packages/User/

# Then: Preferences → Color Scheme → Midnight Moss
```

#### JetBrains IDEs

```bash
# Manual
# 1. Open your JetBrains IDE
# 2. Go to Settings → Editor → Color Scheme
# 3. Click gear icon → Import Scheme
# 4. Select jetbrains/midnight-moss.icls
# 5. Apply the "Midnight Moss" theme
```

### Terminal Tools

#### tmux

```bash
# Automated
./install.sh -t tmux

# Manual
mkdir -p ~/.config/tmux
cp tmux/midnight-moss.conf ~/.config/tmux/
echo "source-file ~/.config/tmux/midnight-moss.conf" >> ~/.tmux.conf
```

#### Zellij

```bash
# Automated
./install.sh -t zellij

# Manual
# Merge configuration from zellij/config.kdl into ~/.config/zellij/config.kdl
```

#### Zsh

```bash
# Automated
./install.sh -t zsh

# Manual (Oh-My-Zsh)
cp zsh/midnight-moss.zsh-theme ~/.oh-my-zsh/themes/

# Add to .zshrc
ZSH_THEME="midnight-moss"

# Manual (standalone)
mkdir -p ~/.config/zsh/themes
cp zsh/midnight-moss.zsh-theme ~/.config/zsh/themes/
source ~/.config/zsh/themes/midnight-moss.zsh-theme
```

#### Starship

```bash
# Automated
./install.sh -t starship

# Manual
# Merge configuration from starship/starship.toml into ~/.config/starship.toml
```

### Applications

#### Obsidian

```bash
# Manual
# 1. Copy obsidian/ directory to: <vault>/.obsidian/themes/midnight-moss/
# 2. Open Obsidian Settings → Appearance → Themes
# 3. Select "Midnight Moss"
```

#### Firefox

```bash
# Manual
# 1. Navigate to about:config
# 2. Set toolkit.legacyUserProfileCustomizations.stylesheets = true
# 3. Find your profile folder: about:support → "Profile Folder"
# 4. Create chrome/ folder in profile
# 5. Copy firefox/userChrome.css and userContent.css to chrome/
# 6. Restart Firefox
```

## Verification

After installation, verify themes are working:

```bash
# Check installed files
ls -la ~/.vim/colors/midnight-moss.vim
ls -la ~/.config/alacritty/themes/midnight-moss.toml
ls -la ~/.config/tmux/midnight-moss.conf

# Test applications
vim +colorscheme
tmux source-file ~/.tmux.conf
```

## Troubleshooting

### Theme Not Appearing

1. **Check installation path**:
   ```bash
   ./install.sh --dry-run
   ```

2. **Verify application config**:
   - Vim: `:colorscheme midnight-moss` in command mode
   - Alacritty: Check import statement in alacritty.toml
   - tmux: Run `tmux source-file ~/.tmux.conf`

3. **Check backups**:
   ```bash
   ls -la ~/.midnight-moss-backups/
   ```

### Permission Issues

```bash
# Ensure install script is executable
chmod +x install.sh
chmod +x dotfiles/install.sh

# Check file permissions
ls -la ~/.[config/vim/tmux]*
```

### Conflicts with Existing Themes

The installer automatically backs up existing configurations to `~/.midnight-moss-backups/`.

To restore:
```bash
# List backups
ls -la ~/.midnight-moss-backups/

# Restore manually or use uninstaller
./dotfiles/uninstall.sh --restore
```

## Uninstallation

### Remove Themes

```bash
# Interactive uninstall
./dotfiles/uninstall.sh

# Or using make
make uninstall

# Remove backup files
make clean
```

### Manual Cleanup

Remove theme references from:
- `~/.vimrc` - Remove `colorscheme midnight-moss`
- `~/.config/alacritty/alacritty.toml` - Remove import statement
- `~/.tmux.conf` - Remove source-file line
- `~/.zshrc` - Change ZSH_THEME

## Advanced Configuration

### Custom Color Overrides

Each theme supports customization. See individual README files in each application directory:

- [alacritty/README.md](alacritty/README.md)
- [vim/README.md](vim/README.md)
- [tmux/README.md](tmux/README.md)
- etc.

### Backup Management

Backups are stored in `~/.midnight-moss-backups/` with timestamps:

```bash
# List backups
ls -la ~/.midnight-moss-backups/

# Restore specific backup
cp ~/.midnight-moss-backups/20231025_120000/.vimrc ~/.vimrc
```

## Getting Help

- 📖 Check application-specific READMEs in each directory
- 🐛 Report issues: https://github.com/babywizzies/midnight-moss-theme/issues
- 💬 See CONTRIBUTING.md for contribution guidelines
- 📋 Run `make help` or `./install.sh --help` for options

---

**Enjoy coding in the dark with Midnight Moss! 🌙🌿**
