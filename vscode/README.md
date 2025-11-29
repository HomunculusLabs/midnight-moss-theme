# Midnight Moss for VS Code

A comprehensive dark theme for Visual Studio Code with organic moss-inspired colors.

## Installation

### Method 1: VS Code Marketplace (Recommended)

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
3. Search for "Midnight Moss"
4. Click Install
5. Go to Preferences → Color Theme → Midnight Moss

### Method 2: Install from VSIX

1. Download the `.vsix` file from [releases](https://github.com/HomunculusLabs/midnight-moss-theme/releases)
2. Open VS Code
3. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
4. Click the `...` menu → "Install from VSIX..."
5. Select the downloaded file
6. Reload and select the theme

### Method 3: Manual Installation

1. Clone or download this repository
2. Copy the `vscode` folder to your extensions directory:
   - **Windows**: `%USERPROFILE%\.vscode\extensions\midnight-moss-theme`
   - **macOS**: `~/.vscode/extensions/midnight-moss-theme`
   - **Linux**: `~/.vscode/extensions/midnight-moss-theme`
3. Restart VS Code
4. Go to Preferences → Color Theme → Midnight Moss

## Features

- Comprehensive syntax highlighting for all major languages
- Carefully crafted UI colors for optimal contrast
- Terminal colors matching the theme
- Support for editor features like bracket matching, selections, and find/replace
- Consistent color scheme across all VS Code panels

## Supported Languages

The theme includes optimized syntax highlighting for:
- JavaScript/TypeScript
- Python
- Go
- Rust
- PHP
- HTML/CSS
- Markdown
- JSON/YAML
- And many more...

## Building & Publishing

### Build the Extension

```bash
cd vscode
npm install
npm run package
```

This creates a `.vsix` file that can be shared or installed locally.

### Publish to Marketplace

```bash
# First time: Create a publisher at https://marketplace.visualstudio.com/manage
# Then login with your Personal Access Token
vsce login homunculuslabs

# Publish
npm run publish
```

## Color Palette

| Element | Color | Hex |
|---------|-------|-----|
| Background | Deep Night | `#1c1c1c` |
| Foreground | Moonlight | `#b8b8b8` |
| Accent | Moss | `#5e8d87` |
| Keywords | Sage | `#826d94` |
| Functions | Ocean | `#5d7e97` |
| Strings | Amber | `#a09262` |
| Classes | Forest | `#6e8f7c` |
| Errors | Wine | `#9b6a6c` |
| Comments | Mist | `#7a7a7a` |

## License

MIT License - See [LICENSE](../LICENSE) for details.
