# 🌿 Midnight Moss

> A dark, organic color theme with mossy green-teal accents for developers who love the night

Midnight Moss is a carefully crafted dark theme that brings together the deep tranquility of midnight with the organic vitality of moss. Born from a terminal rice configuration, this theme offers a sophisticated palette that's easy on the eyes during those long coding sessions.

## 🎨 Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| **Deep Night** | `#1c1c1c` | Primary background |
| **Shadow** | `#262626` | Secondary background |
| **Charcoal** | `#2e2e2e` | Tertiary background |
| **Slate** | `#3a3a3a` | UI elements |
| **Stone** | `#464646` | Borders, dividers |
| **Ash** | `#525252` | Subtle highlights |
| **Moonlight** | `#b8b8b8` | Primary text |
| **Silver** | `#c8c8c8` | Bright text |
| **Mist** | `#7a7a7a` | Muted text |
| **Moss** | `#5e8d87` | Primary accent (links, selection) |
| **Forest** | `#6e8f7c` | Success, growth |
| **Ocean** | `#5d7e97` | Information, functions |
| **Wine** | `#9b6a6c` | Errors, warnings |
| **Sage** | `#826d94` | Keywords, special |
| **Amber** | `#a09262` | Strings, constants |
| **Copper** | `#9d7a5a` | Tags, metadata |

## 🚀 Available For

### ✅ Currently Available

#### **Code Editors & IDEs**
- [VS Code](#vs-code) - Comprehensive editor theme with syntax highlighting
- [Sublime Text](#sublime-text) - Modern JSON color scheme format
- [JetBrains IDEs](#jetbrains) - IntelliJ IDEA, PyCharm, WebStorm, etc.
- [Vim](#vim) - Classic text editor colorscheme
- [Neovim](#neovim) - Modern Lua-based colorscheme

#### **Terminal Emulators**
- [Alacritty](#alacritty) - Modern GPU-accelerated terminal (TOML + YAML)
- [iTerm2](#iterm2) - macOS terminal emulator
- [Kitty](#kitty) - Cross-platform GPU terminal

#### **Terminal Tools**
- [tmux](#tmux) - Terminal multiplexer with status bar theming
- [Zellij](#zellij) - Modern terminal multiplexer
- [Starship](#starship) - Cross-shell prompt configuration
- [Zsh](#zsh) - Shell theme with Oh-My-Zsh integration

#### **Applications**
- [Obsidian](#obsidian) - Note-taking and knowledge management
- [Firefox](#firefox) - Web browser interface theming

#### **Package Management**
- [Arch Linux](#arch-linux) - AUR package for easy installation

### 🔄 Coming Soon
- Hyper - Terminal emulator
- Emacs - Text editor
- Chrome - Web browser extension
- Rofi - Application launcher
- i3/Sway - Window managers
- Dunst - Notification daemon

## 📦 Installation

### Quick Start (Recommended)

The easiest way to install Midnight Moss themes across your entire system:

```bash
# Clone the repository
git clone https://github.com/babywizzies/midnight-moss-theme.git
cd midnight-moss-theme

# Run the automated installer
./install.sh

# Or use make for common installation patterns
make install              # Interactive installation
make install-all          # Install everything
make install-terminals    # Terminal emulators only
make install-editors      # Code editors only
make install-tools        # Terminal tools only
```

For targeted installation:
```bash
# Install specific applications
./install.sh -t alacritty,vim,tmux,neovim

# Or using make
make install TARGETS=vim,tmux,zsh

# Preview what would be installed (dry-run)
make test
```

See [INSTALL.md](INSTALL.md) for comprehensive installation guide, including platform-specific instructions, troubleshooting, and advanced options.

### Package Managers

#### Arch Linux (AUR)
```bash
# Using yay
yay -S midnight-moss-themes

# Using paru
paru -S midnight-moss-themes
```

#### Manual Download
Download individual themes from the [releases page](https://github.com/babywizzies/midnight-moss-theme/releases) or browse the source code.

### Quick Setup

#### **Code Editors**

**VS Code**
```bash
# Download and install manually, or search for "Midnight Moss" in extensions
# See vscode/README.md for detailed instructions
```

**Sublime Text**
```bash
# Copy to User packages directory
cp sublime-text/midnight-moss.sublime-color-scheme ~/.config/sublime-text/Packages/User/
# Select from Preferences → Color Scheme
```

**JetBrains IDEs**
```bash
# Import color scheme file
# Settings → Editor → Color Scheme → Import → midnight-moss.icls
```

**Vim/Neovim**
```bash
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/midnight-moss.vim https://raw.githubusercontent.com/babywizzies/midnight-moss-theme/main/vim/midnight-moss.vim
# Add to .vimrc: colorscheme midnight-moss
```

#### **Terminal Emulators**

**Alacritty**
```bash
mkdir -p ~/.config/alacritty/themes
curl -o ~/.config/alacritty/themes/midnight-moss.toml https://raw.githubusercontent.com/babywizzies/midnight-moss-theme/main/alacritty/midnight-moss.toml
# Add to alacritty.toml: import = ["~/.config/alacritty/themes/midnight-moss.toml"]
```

**iTerm2**
```bash
curl -o ~/Downloads/midnight-moss.itermcolors https://raw.githubusercontent.com/babywizzies/midnight-moss-theme/main/iterm2/midnight-moss.itermcolors
# Double-click to import, then select in Preferences → Profiles → Colors
```

**Kitty**
```bash
curl -o ~/.config/kitty/midnight-moss.conf https://raw.githubusercontent.com/babywizzies/midnight-moss-theme/main/kitty/midnight-moss.conf
echo "include midnight-moss.conf" >> ~/.config/kitty/kitty.conf
```

#### **Terminal Tools**

**tmux**
```bash
curl -o ~/.config/tmux/midnight-moss.conf https://raw.githubusercontent.com/babywizzies/midnight-moss-theme/main/tmux/midnight-moss.conf
echo "source-file ~/.config/tmux/midnight-moss.conf" >> ~/.tmux.conf
```

**Zsh (Oh-My-Zsh)**
```bash
curl -o ~/.oh-my-zsh/themes/midnight-moss.zsh-theme https://raw.githubusercontent.com/babywizzies/midnight-moss-theme/main/zsh/midnight-moss.zsh-theme
# Set ZSH_THEME="midnight-moss" in ~/.zshrc
```

**Starship**
```bash
curl -o ~/.config/starship-midnight-moss.toml https://raw.githubusercontent.com/babywizzies/midnight-moss-theme/main/starship/starship.toml
# Add configuration to your starship.toml
```

#### **Applications**

**Obsidian**
```bash
# Copy to your vault's themes directory
# .obsidian/themes/midnight-moss/
# Enable in Settings → Appearance → Themes
```

**Firefox**
```bash
# Enable custom stylesheets in about:config
# Copy userChrome.css and userContent.css to profile chrome folder
# See firefox/README.md for detailed instructions
```

## 🖼️ Previews

### Obsidian
*Screenshots coming soon*

### Terminal
*Screenshots coming soon*

### Code Editor
*Screenshots coming soon*

## 🎯 Philosophy

Midnight Moss is designed around three core principles:

1. **Organic Harmony** - Colors inspired by nature's night palette
2. **Developer Focus** - Optimized contrast ratios and syntax highlighting
3. **Visual Calm** - Reduced eye strain for extended use

The theme uses a sophisticated gradient of grays as the foundation, with carefully selected accent colors that provide excellent readability while maintaining visual interest. The primary accent, a muted teal (`#5e8d87`), evokes the gentle glow of moss in moonlight.

## 🛠️ Development

### Core Color Palette

Want to port Midnight Moss to a new application? Here's the core palette:

```css
:root {
  --mm-bg-primary: #1c1c1c;
  --mm-bg-secondary: #262626;
  --mm-bg-tertiary: #2e2e2e;
  --mm-text-primary: #b8b8b8;
  --mm-text-secondary: #7a7a7a;
  --mm-accent-primary: #5e8d87;
  --mm-accent-success: #6e8f7c;
  --mm-accent-info: #5d7e97;
  --mm-accent-warning: #a09262;
  --mm-accent-error: #9b6a6c;
}
```

### Repository Structure

- `/alacritty/` - Alacritty terminal themes (TOML & YAML)
- `/arch-package/` - AUR package files
- `/dotfiles/` - Automated installation and management scripts
- `/firefox/` - Firefox userChrome themes
- `/iterm2/` - iTerm2 color schemes
- `/jetbrains/` - JetBrains IDE themes
- `/kitty/` - Kitty terminal configuration
- `/neovim/` - Neovim Lua colorscheme
- `/obsidian/` - Obsidian theme
- `/starship/` - Starship prompt configuration
- `/sublime-text/` - Sublime Text color scheme
- `/tmux/` - tmux configuration theme
- `/vim/` - Vim colorscheme
- `/vscode/` - VS Code theme
- `/zellij/` - Zellij multiplexer theme
- `/zsh/` - Zsh/Oh-My-Zsh theme

### Automated Installation

The `dotfiles/` directory contains installation scripts:
- `install.sh` - Automated theme installer with backup support
- `uninstall.sh` - Theme removal and backup restoration
- See `dotfiles/README.md` for detailed documentation

## 🤝 Contributing

We welcome contributions! Whether you want to:
- Port the theme to a new application
- Improve existing implementations
- Report bugs or suggest improvements
- Add documentation or screenshots

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📜 License

This theme is released under the MIT License. See [LICENSE](LICENSE) for details.

## 🙏 Credits

Originally created as a terminal rice configuration, Midnight Moss represents the evolution of a personal color scheme into a comprehensive theme ecosystem.

---

**Enjoy coding in the dark with Midnight Moss! 🌙🌿**

*If you love this theme, please ⭐ star the repository and share it with fellow developers!*
