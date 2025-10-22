# Midnight Moss for Sublime Text

A dark, organic color scheme for Sublime Text with moss-inspired accents that create a calming coding environment.

## Installation

### Method 1: Package Control (Recommended)
1. Install [Package Control](https://packagecontrol.io/installation) if you haven't already
2. Open Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`)
3. Type "Package Control: Install Package"
4. Search for "Midnight Moss" (when available on Package Control)

### Method 2: Manual Installation
1. Download `midnight-moss.sublime-color-scheme`
2. Open Sublime Text and go to **Preferences** → **Browse Packages**
3. Create a `User` folder if it doesn't exist
4. Copy the `.sublime-color-scheme` file to the `User` folder
5. Go to **Preferences** → **Color Scheme** → **User** → **Midnight Moss**

### Method 3: Git Clone
```bash
cd "~/Library/Application Support/Sublime Text/Packages"  # macOS
# cd "%APPDATA%\Sublime Text\Packages"  # Windows
# cd "~/.config/sublime-text/Packages"  # Linux

git clone https://github.com/yourusername/midnight-moss-theme.git "Midnight Moss"
```

## Features

- **Modern JSON Format**: Uses Sublime Text's latest `.sublime-color-scheme` format
- **Variable-Based Colors**: Consistent color palette throughout
- **Comprehensive Language Support**: Optimized syntax highlighting for major languages
- **Git Integration**: Built-in support for Git Gutter and diff highlighting
- **Markdown Support**: Enhanced styling for Markdown documents
- **CSS/Web Development**: Specialized highlighting for web technologies
- **Python/JavaScript**: Language-specific optimizations

## Supported Languages

The theme includes specialized syntax highlighting for:
- **Web Technologies**: HTML, CSS, JavaScript, TypeScript, JSON
- **Programming Languages**: Python, Java, C/C++, Go, Rust, PHP
- **Markup**: Markdown, XML, YAML
- **Configuration**: INI, TOML, dotfiles
- **Version Control**: Git diffs, commit messages

## Color Palette

- **Background**: Deep Night (`#1c1c1c`) - Easy on the eyes
- **Primary Text**: Moonlight (`#b8b8b8`) - Clear readability
- **Keywords**: Sage Purple (`#826d94`) - Language constructs
- **Strings**: Amber Yellow (`#a09262`) - String literals
- **Functions**: Ocean Blue (`#5d7e97`) - Method definitions
- **Classes**: Forest Green (`#6e8f7c`) - Type definitions
- **Comments**: Mist Gray (`#7a7a7a`) - Documentation
- **Numbers**: Copper Orange (`#9d7a5a`) - Numeric values
- **Selections**: Moss Green (`#5e8d87`) - Highlights and selections

## Customization

You can customize colors by editing the `variables` section in the scheme file:

```json
"variables": {
    "moss": "#5e8d87",      // Primary accent color
    "forest": "#6e8f7c",    // Success/growth color
    "ocean": "#5d7e97",     // Information/function color
    // ... more variables
}
```

## Git Integration

The theme includes optimized colors for popular Git packages:
- **Git Gutter**: Line change indicators
- **GitSavvy**: Diff views and commit interfaces  
- **Sublime Merge**: Integrated Git client

## Tips

1. **Font Recommendation**: Pairs well with "JetBrains Mono", "Fira Code", or "SF Mono"
2. **Theme Switching**: Use `Ctrl/Cmd + Shift + P` → "UI: Select Color Scheme" for quick switching
3. **Sidebar Theme**: Consider using a dark UI theme like "Adaptive" or "Default Dark"

Perfect for developers who appreciate nature-inspired aesthetics and want a comfortable environment for extended coding sessions.