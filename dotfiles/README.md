# Midnight Moss Dotfiles

Automated installation and management scripts for Midnight Moss themes across your entire development environment.

## Overview

This directory contains scripts to help you quickly install, manage, and uninstall Midnight Moss themes across all supported applications.

## Quick Start

### Install Everything (Recommended)

```bash
# Clone the repository
git clone https://github.com/yourusername/midnight-moss-theme.git
cd midnight-moss-theme/dotfiles

# Run the installer
./install.sh
```

### Selective Installation

```bash
# Install only specific applications
./install.sh -t alacritty,vim,tmux

# Preview what would be installed (dry run)
./install.sh --dry-run

# Non-interactive installation
./install.sh -y
```

## Installation Script

### Features

- **Automatic Detection**: Detects installed applications
- **Safe Backups**: Backs up existing configurations before installing
- **Flexible Options**: Install all or select specific applications
- **Dry Run Mode**: Preview changes without modifying files
- **Interactive/Non-interactive**: Choose your preferred installation method

### Usage

```bash
./install.sh [OPTIONS]

OPTIONS:
    -h, --help          Show help message
    -d, --dry-run       Preview changes without installing
    -f, --force         Force installation without prompts
    -y, --yes           Non-interactive mode (assume yes)
    -t, --targets       Install specific targets (comma-separated)
    -a, --all           Install all supported applications
    --list-targets      List all available installation targets
```

### Examples

```bash
# Interactive installation (default)
./install.sh

# Install specific applications
./install.sh -t alacritty,kitty,vim,neovim

# Preview what would be installed
./install.sh --dry-run

# Install everything automatically
./install.sh --all -y

# List available installation targets
./install.sh --list-targets
```

## Supported Applications

### Terminal Emulators
- **Alacritty** - Auto-detects TOML/YAML format
- **Kitty** - Includes color scheme
- **iTerm2** - macOS only, requires manual import

### Editors
- **Vim** - Installs colorscheme to ~/.vim/colors/
- **Neovim** - Installs Lua colorscheme to ~/.config/nvim/colors/

### Terminal Tools
- **tmux** - Installs configuration to ~/.config/tmux/
- **Zellij** - Installs theme and config
- **Zsh** - Installs Oh-My-Zsh theme (or standalone)
- **Starship** - Installs prompt configuration

### Manual Installation
Some applications require manual installation:
- **VS Code** - Install from marketplace or use manual method
- **Sublime Text** - Copy color scheme to User packages
- **JetBrains IDEs** - Import .icls file through settings
- **Obsidian** - Copy theme to vault .obsidian/themes/
- **Firefox** - Requires manual userChrome.css setup

## Uninstall Script

### Features

- Removes all Midnight Moss theme files
- Lists available backups
- Can restore from previous backups
- Dry run mode for safety

### Usage

```bash
./uninstall.sh [OPTIONS]

OPTIONS:
    -h, --help          Show help message
    -d, --dry-run       Preview what would be removed
    -r, --restore       Restore files from backup
    -l, --list-backups  List available backups
    -b, --backup-date   Specify backup date to restore
```

### Examples

```bash
# Uninstall all themes
./uninstall.sh

# Preview what would be removed
./uninstall.sh --dry-run

# List available backups
./uninstall.sh --list-backups

# Restore from specific backup
./uninstall.sh --restore --backup-date 20241022_143022
```

## Backup Management

### Automatic Backups

The installer automatically backs up existing configuration files before making changes:

- **Location**: `~/.midnight-moss-backups/<timestamp>/`
- **Format**: `YYYYMMDD_HHMMSS`
- **Contents**: Original configuration files

### Restore from Backup

```bash
# List available backups
./uninstall.sh --list-backups

# Restore from specific backup
./uninstall.sh --restore --backup-date 20241022_143022
```

### Manual Backup Management

```bash
# View all backups
ls -lh ~/.midnight-moss-backups/

# Remove old backups (manual)
rm -rf ~/.midnight-moss-backups/20241001_*

# Archive backups
tar -czf midnight-moss-backups.tar.gz ~/.midnight-moss-backups/
```

## Installation Targets

### Default Enabled

These applications are installed by default when detected:
- alacritty
- kitty
- vim
- neovim
- tmux
- zellij
- zsh
- starship

### Disabled by Default

These require manual steps or are better installed manually:
- iterm2 (macOS only, requires import)
- vscode (marketplace preferred)
- sublime (manual package installation)
- jetbrains (IDE import required)
- obsidian (vault-specific)
- firefox (requires enabling userChrome.css)

Enable with: `./install.sh -t <target>`

## Post-Installation Steps

### Alacritty

Add to your `alacritty.toml`:
```toml
import = ["~/.config/alacritty/themes/midnight-moss.toml"]
```

### Kitty

Add to your `kitty.conf`:
```
include midnight-moss.conf
```

### Vim

Add to your `.vimrc`:
```vim
colorscheme midnight-moss
```

### Neovim

Add to your `init.lua`:
```lua
vim.cmd('colorscheme midnight-moss')
```

### tmux

Add to your `.tmux.conf`:
```bash
source-file ~/.config/tmux/midnight-moss.conf
```

### Zsh (Oh-My-Zsh)

Set in your `.zshrc`:
```bash
ZSH_THEME="midnight-moss"
```

### Starship

Configuration is automatically used if no `starship.toml` exists.
Otherwise, merge from `~/.config/starship-midnight-moss.toml`

### Zellij

Theme is automatically applied if no config exists.
Otherwise, merge the theme section manually.

## Troubleshooting

### Script Won't Run

```bash
# Make executable
chmod +x install.sh uninstall.sh

# Run with bash explicitly
bash install.sh
```

### Application Not Detected

```bash
# Check if application is in PATH
which alacritty
which kitty

# Install missing application first
brew install alacritty  # macOS
pacman -S alacritty     # Arch Linux
```

### Theme Not Loading

1. **Check installation**:
   ```bash
   # Verify files were installed
   ls -la ~/.config/alacritty/themes/
   ls -la ~/.config/kitty/
   ```

2. **Check configuration**:
   ```bash
   # Ensure config references theme
   grep midnight-moss ~/.config/alacritty/alacritty.toml
   grep midnight-moss ~/.config/kitty/kitty.conf
   ```

3. **Restart application**:
   - Most terminals need to be restarted
   - Some support hot reload (Ctrl+Shift+R in Kitty)

### Backup Issues

```bash
# Check backups exist
ls -la ~/.midnight-moss-backups/

# Manually restore a file
cp ~/.midnight-moss-backups/20241022_143022/alacritty.toml \
   ~/.config/alacritty/alacritty.toml
```

## Advanced Usage

### Custom Installation Targets

Edit `install.sh` to customize default targets:

```bash
# In install.sh, modify the INSTALL_TARGETS array
declare -A INSTALL_TARGETS=(
    [alacritty]=true
    [kitty]=false  # Disable kitty by default
    # ...
)
```

### Integration with Dotfiles Repository

Include Midnight Moss in your dotfiles:

```bash
# In your dotfiles repository
git submodule add https://github.com/yourusername/midnight-moss-theme.git themes/midnight-moss

# In your install script
cd themes/midnight-moss/dotfiles
./install.sh -y -t alacritty,vim,tmux
```

### Automation

```bash
# Add to your dotfiles setup script
curl -sL https://github.com/yourusername/midnight-moss-theme/archive/main.tar.gz | tar xz
cd midnight-moss-theme-main/dotfiles
./install.sh -y --all
```

## Safety Features

### Non-Destructive

- **Backups**: Automatic backup before any changes
- **Dry Run**: Test installation without modifying files
- **Interactive**: Prompts for confirmation by default

### Recovery

- **Restore**: Restore from any backup
- **Uninstall**: Clean removal of all theme files
- **Manual**: Backups can be manually copied back

## Development

### Testing

```bash
# Test installation without making changes
./install.sh --dry-run

# Test specific targets
./install.sh --dry-run -t vim,tmux

# Test uninstallation
./uninstall.sh --dry-run
```

### Contributing

Contributions welcome! Please:
1. Test scripts thoroughly
2. Update documentation
3. Follow existing code style
4. Add new application support carefully

## Files

- `install.sh` - Main installation script
- `uninstall.sh` - Uninstallation and restore script
- `README.md` - This file

## Requirements

- **Bash** 4.0 or higher
- **curl** for downloading (if using remote install)
- **git** for repository cloning

## License

MIT License - See LICENSE file in repository root

---

**Perfect for**: Developers who want a quick, automated way to apply the Midnight Moss theme across their entire development environment.

🌿 Enjoy your cohesive Midnight Moss setup! 🌙
