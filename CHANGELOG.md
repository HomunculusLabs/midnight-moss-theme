# Changelog

All notable changes to the Midnight Moss Theme collection will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- VS Code Marketplace packaging (`vscode/package.json`) for publishing to VS Code extensions
- JetBrains Marketplace plugin packaging (`jetbrains/META-INF/plugin.xml`, Gradle build)
- Homebrew formula (`homebrew/midnight-moss-themes.rb`) for macOS installation
- Root-level `install.sh` script for simplified omarchy base installation
- Comprehensive `Makefile` with convenient installation targets:
  - `make install` - Interactive installation
  - `make install-all` - Install all themes
  - `make install-terminals`, `install-editors`, `install-tools` - Category-based installation
  - `make test` - Dry-run preview
  - `make check-files` - Validate repository structure
- Comprehensive `INSTALL.md` guide with:
  - Platform-specific instructions (Linux, macOS, WSL)
  - Application-specific installation steps
  - Troubleshooting section
  - Backup and uninstallation procedures
- Complete documentation (README.md) for kitty terminal emulator
- Complete documentation (README.md) for neovim colorscheme
- Complete documentation (README.md) for starship prompt theme
- Complete documentation (README.md) for zellij multiplexer theme
- Project-level .gitignore file
- This CHANGELOG.md file
- Dotfiles integration scripts for easy deployment

### Changed
- Updated `arch-package/PKGBUILD` to match actual theme filenames
- Enhanced `README.md` with improved installation section:
  - Added quick start guide
  - Added Makefile usage examples
  - Added reference to comprehensive INSTALL.md
- Standardized all theme filenames to use hyphen notation (midnight-moss.*)
  - `Midnight Moss.itermcolors` → `midnight-moss.itermcolors`
  - `Midnight_Moss.icls` → `midnight-moss.icls`
  - `Midnight Moss.sublime-color-scheme` → `midnight-moss.sublime-color-scheme`
- Updated all README files to reference new standardized filenames
- Cleaned up Obsidian directory by removing non-Midnight-Moss theme variants
  - Removed: Monokai, Obsidian Nord, Obsidian gruvbox, mono black, monochroYOU
- Improved repository organization and structure

### Fixed
- PKGBUILD file references to theme files (now matches actual filenames)
- Inconsistent filename conventions across theme files
- Broken documentation links in README files
- Obsidian directory containing unrelated themes

## [1.0.0] - 2024-10-22

### Added
- Initial release of Midnight Moss theme collection
- VS Code theme with comprehensive syntax highlighting
- Sublime Text color scheme (modern JSON format)
- JetBrains IDEs color scheme (.icls format)
- Vim colorscheme (VimL)
- Neovim colorscheme (Lua)
- Alacritty terminal theme (TOML and YAML formats)
- iTerm2 terminal theme
- Kitty terminal theme
- tmux configuration theme
- Zellij multiplexer theme and config
- Starship prompt configuration
- Zsh/Oh-My-Zsh theme
- Obsidian note-taking app theme
- Firefox browser UI theme
- Arch Linux AUR package for distribution

### Color Palette
- Deep Night background (#1c1c1c)
- Moss primary accent (#5e8d87)
- Forest green for success (#6e8f7c)
- Ocean blue for information (#5d7e97)
- Wine red for errors (#9b6a6c)
- Sage purple for keywords (#826d94)
- Amber yellow for strings (#a09262)
- Copper orange for constants (#9d7a5a)
- Moonlight gray for text (#b8b8b8)

---

## Version History

### [Unreleased] - TBD
Ongoing improvements and refinements.

### [1.0.0] - 2024-10-22
Initial public release with 15 application themes.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for information on how to contribute to this project.

## Links

- [Repository](https://github.com/yourusername/midnight-moss-theme)
- [Issues](https://github.com/yourusername/midnight-moss-theme/issues)
- [Releases](https://github.com/yourusername/midnight-moss-theme/releases)
