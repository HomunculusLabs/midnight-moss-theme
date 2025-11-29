# Midnight Moss

[![License: MIT](https://img.shields.io/badge/License-MIT-5e8d87.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-5e8d87.svg)](CHANGELOG.md)
[![Platforms](https://img.shields.io/badge/platforms-15%2B%20apps-5e8d87.svg)](#supported-applications)

> A dark, organic color theme with mossy green-teal accents for developers who love the night

Midnight Moss brings together the deep tranquility of midnight with organic moss-inspired accents. Born from a terminal rice configuration, this theme offers a sophisticated palette that's easy on the eyes during long coding sessions.

## Color Palette

| | Color | Hex | Usage |
|---|-------|-----|-------|
| ![#1c1c1c](https://via.placeholder.com/16/1c1c1c/1c1c1c.png) | Deep Night | `#1c1c1c` | Primary background |
| ![#262626](https://via.placeholder.com/16/262626/262626.png) | Shadow | `#262626` | Secondary background |
| ![#5e8d87](https://via.placeholder.com/16/5e8d87/5e8d87.png) | **Moss** | `#5e8d87` | Primary accent |
| ![#6e8f7c](https://via.placeholder.com/16/6e8f7c/6e8f7c.png) | Forest | `#6e8f7c` | Success, classes |
| ![#5d7e97](https://via.placeholder.com/16/5d7e97/5d7e97.png) | Ocean | `#5d7e97` | Functions, info |
| ![#826d94](https://via.placeholder.com/16/826d94/826d94.png) | Sage | `#826d94` | Keywords |
| ![#a09262](https://via.placeholder.com/16/a09262/a09262.png) | Amber | `#a09262` | Strings |
| ![#9b6a6c](https://via.placeholder.com/16/9b6a6c/9b6a6c.png) | Wine | `#9b6a6c` | Errors |
| ![#b8b8b8](https://via.placeholder.com/16/b8b8b8/b8b8b8.png) | Moonlight | `#b8b8b8` | Primary text |

<details>
<summary>Full palette (16 colors)</summary>

| Color | Hex | Usage |
|-------|-----|-------|
| Deep Night | `#1c1c1c` | Primary background |
| Shadow | `#262626` | Secondary background |
| Charcoal | `#2e2e2e` | Tertiary background |
| Slate | `#3a3a3a` | UI elements |
| Stone | `#464646` | Borders, dividers |
| Ash | `#525252` | Subtle highlights |
| Mist | `#7a7a7a` | Muted text, comments |
| Moonlight | `#b8b8b8` | Primary text |
| Silver | `#c8c8c8` | Bright text |
| Moss | `#5e8d87` | Primary accent |
| Forest | `#6e8f7c` | Success, classes |
| Ocean | `#5d7e97` | Functions, info |
| Wine | `#9b6a6c` | Errors |
| Sage | `#826d94` | Keywords |
| Amber | `#a09262` | Strings |
| Copper | `#9d7a5a` | Constants, tags |

</details>

## Installation

### Package Managers

| Platform | Command |
|----------|---------|
| **Homebrew** | `brew tap homunculuslabs/themes && brew install midnight-moss-themes` |
| **Arch Linux** | `yay -S midnight-moss-themes` |
| **VS Code** | Search "Midnight Moss" in Extensions |
| **JetBrains** | Search "Midnight Moss" in Plugins Marketplace |

### Quick Start

```bash
git clone https://github.com/HomunculusLabs/midnight-moss-theme.git
cd midnight-moss-theme
./install.sh          # Interactive installer
```

Or use make targets:
```bash
make install-all      # Install everything
make install-terminals # Alacritty, Kitty, iTerm2
make install-editors   # VS Code, Vim, Neovim, Sublime, JetBrains
make install-tools     # tmux, Zellij, Zsh, Starship
```

See [INSTALL.md](INSTALL.md) for detailed platform-specific instructions.

## Supported Applications

### Code Editors & IDEs
| App | Install |
|-----|---------|
| **VS Code** | [Marketplace](https://marketplace.visualstudio.com/) or `./install.sh -t vscode` |
| **JetBrains** | [Marketplace](https://plugins.jetbrains.com/) or import `jetbrains/midnight-moss.icls` |
| **Vim** | `./install.sh -t vim` or copy to `~/.vim/colors/` |
| **Neovim** | `./install.sh -t neovim` or copy to `~/.config/nvim/colors/` |
| **Sublime Text** | Copy to `~/.config/sublime-text/Packages/User/` |

### Terminal Emulators
| App | Install |
|-----|---------|
| **Alacritty** | `./install.sh -t alacritty` - TOML & YAML formats |
| **Kitty** | `./install.sh -t kitty` |
| **iTerm2** | Import `iterm2/midnight-moss.itermcolors` |

### Terminal Tools
| App | Install |
|-----|---------|
| **tmux** | `./install.sh -t tmux` |
| **Zellij** | `./install.sh -t zellij` |
| **Starship** | `./install.sh -t starship` |
| **Zsh** | `./install.sh -t zsh` (Oh-My-Zsh compatible) |

### Applications
| App | Install |
|-----|---------|
| **Obsidian** | Copy `obsidian/` to `.obsidian/themes/midnight-moss/` |
| **Firefox** | Copy `firefox/` to profile `chrome/` folder ([details](firefox/README.md)) |

## Philosophy

Midnight Moss is designed around three principles:

1. **Organic Harmony** - Colors inspired by nature's night palette
2. **Developer Focus** - Optimized contrast for syntax highlighting
3. **Visual Calm** - Reduced eye strain for extended sessions

## Development

### Porting to New Applications

```css
:root {
  --mm-bg-primary: #1c1c1c;
  --mm-bg-secondary: #262626;
  --mm-bg-tertiary: #2e2e2e;
  --mm-text-primary: #b8b8b8;
  --mm-text-muted: #7a7a7a;
  --mm-accent: #5e8d87;
  --mm-success: #6e8f7c;
  --mm-info: #5d7e97;
  --mm-warning: #a09262;
  --mm-error: #9b6a6c;
  --mm-keyword: #826d94;
}
```

### Repository Structure

```
midnight-moss-theme/
├── alacritty/      # Terminal (TOML & YAML)
├── arch-package/   # AUR PKGBUILD
├── dotfiles/       # Install/uninstall scripts
├── firefox/        # userChrome.css
├── homebrew/       # Homebrew formula
├── iterm2/         # macOS terminal
├── jetbrains/      # IntelliJ, PyCharm, etc.
├── kitty/          # Terminal
├── neovim/         # Lua colorscheme
├── obsidian/       # Note-taking app
├── starship/       # Cross-shell prompt
├── sublime-text/   # Editor
├── tmux/           # Multiplexer
├── vim/            # Classic colorscheme
├── vscode/         # Editor extension
├── zellij/         # Multiplexer
└── zsh/            # Shell theme
```

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

- Port the theme to new applications
- Improve existing implementations
- Report bugs or suggest improvements
- Add screenshots

## License

MIT License - See [LICENSE](LICENSE) for details.

---

**Enjoy coding in the dark with Midnight Moss!**

[Star this repo](https://github.com/HomunculusLabs/midnight-moss-theme) if you find it useful!
