# Midnight Moss for Starship

A sophisticated cross-shell prompt theme featuring the Midnight Moss color palette with powerline-style segments and intelligent context awareness.

## Installation

### Prerequisites

1. **Install Starship**:
   ```bash
   # macOS
   brew install starship

   # Linux
   curl -sS https://starship.rs/install.sh | sh

   # Cargo
   cargo install starship --locked
   ```

2. **Initialize Starship** in your shell config:

   **Bash** (`~/.bashrc`):
   ```bash
   eval "$(starship init bash)"
   ```

   **Zsh** (`~/.zshrc`):
   ```bash
   eval "$(starship init zsh)"
   ```

   **Fish** (`~/.config/fish/config.fish`):
   ```fish
   starship init fish | source
   ```

### Method 1: Merge Configuration

1. **Download the theme config**:
   ```bash
   curl -o ~/.config/starship-midnight-moss.toml \
     https://raw.githubusercontent.com/yourusername/midnight-moss-theme/main/starship/starship.toml
   ```

2. **Merge or replace your config**:
   ```bash
   # Option A: Replace (backup first!)
   cp ~/.config/starship.toml ~/.config/starship.toml.backup
   cp ~/.config/starship-midnight-moss.toml ~/.config/starship.toml

   # Option B: Append to existing config
   cat ~/.config/starship-midnight-moss.toml >> ~/.config/starship.toml
   ```

3. **Reload your shell**:
   ```bash
   exec $SHELL
   ```

### Method 2: Direct Configuration

Copy the contents of `starship.toml` and paste into your `~/.config/starship.toml` file.

## Features

### Prompt Layout

```
▓▒░   /current/directory  main ✓  node v18.0.0  14:30
▸
```

### Powerline-Style Design

- **Gradient Background**: Smooth color transitions across segments
- **Custom Separators**: Powerline triangular separators
- **Nerd Font Icons**: Rich iconography for context
- **Compact Layout**: Information-dense yet readable

### Intelligent Modules

#### **Directory Module**
- **Current Path**: Bright silver text on charcoal background
- **Truncation**: Smart path shortening (3 levels)
- **Icons**: Special folder icons (Documents, Downloads, Projects, etc.)
- **Substitutions**: Pretty icons for common directories

#### **Git Integration**
- **Branch Display**: Forest green branch name with icon
- **Status Indicators**: Moss green status symbols
- **Background**: Slate gray segment
- **Clean Detection**: Visual indicator for clean repos

#### **Language Version Display**
Auto-detects and shows versions for:
- **Node.js**: Blue ocean with  icon
- **Python**: Amber yellow with  icon
- **Go**: Moss green with  icon
- **Rust**: Wine red with  icon
- **PHP**: Sage purple with  icon

#### **Time Display**
- **Format**: 24-hour clock (HH:MM)
- **Color**: Muted gray text
- **Background**: Ash segment
- **Optional**: Disabled by default (set `disabled = false` to enable)

#### **Command Status**
- **Success**: Forest green ▸ prompt symbol
- **Error**: Wine red ▸ prompt symbol
- **New Line**: Prompt on separate line for clarity

## Color Scheme

### Segment Backgrounds (Gradient)

| Segment | Background | Purpose |
|---------|-----------|---------|
| **Prefix** | `#262626` (Shadow) | Decorative gradient opener |
| **Directory** | `#2e2e2e` (Charcoal) | Current path |
| **Git** | `#3a3a3a` (Slate) | Git branch and status |
| **Languages** | `#464646` (Stone) | Version information |
| **Time** | `#525252` (Ash) | Clock display |

### Text Colors

| Element | Color | Hex |
|---------|-------|-----|
| **Directory** | Silver | `#c8c8c8` |
| **Git Branch** | Forest | `#6e8f7c` |
| **Git Status** | Moss | `#5e8d87` |
| **Node.js** | Ocean | `#5d7e97` |
| **Python** | Amber | `#a09262` |
| **Rust** | Wine | `#9b6a6c` |
| **Go** | Moss | `#5e8d87` |
| **PHP** | Sage | `#826d94` |
| **Time** | Mist | `#7a7a7a` |

### Prompt Symbols

- **Success**: `▸` in forest green (`#6e8f7c`)
- **Error**: `▸` in wine red (`#9b6a6c`)

## Configuration Options

### Directory Icons

The theme includes directory substitutions:

```toml
[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"projects" = " "
```

Add your own custom substitutions:

```toml
[directory.substitutions]
"~/code" = " "
"~/dotfiles" = " "
"~/.config" = " "
```

### Git Configuration

Customize git status symbols:

```toml
[git_status]
ahead = "⇡${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
behind = "⇣${count}"
conflicted = "🏳"
deleted = "✘"
renamed = "»"
modified = "●"
staged = "✚"
untracked = "?"
```

### Time Format

Change time display format:

```toml
[time]
disabled = false
time_format = "%R"      # 24-hour HH:MM
# time_format = "%I:%M %p"  # 12-hour with AM/PM
# time_format = "%T"        # Full time with seconds
```

### Additional Languages

Add more language version displays:

```toml
[ruby]
symbol = " "
style = "bg:#464646"
format = '[[ $symbol ($version) ](fg:#9b6a6c bg:#464646)]($style)'

[java]
symbol = " "
style = "bg:#464646"
format = '[[ $symbol ($version) ](fg:#9d7a5a bg:#464646)]($style)'

[docker_context]
symbol = " "
style = "bg:#464646"
format = '[[ $symbol $context ](fg:#5e8d87 bg:#464646)]($style)'
```

## Advanced Customization

### Two-Line Prompt

For a more spacious layout:

```toml
format = """
[▓▒░](#262626)\
[  ](bg:#262626 fg:#5e8d87)\
[](bg:#2e2e2e fg:#262626)\
$directory\
[](fg:#2e2e2e bg:#3a3a3a)\
$git_branch\
$git_status\
[](fg:#3a3a3a bg:#464646)\
$nodejs\
$rust\
$golang\
$php\
$python\
[](fg:#464646 bg:#525252)\
$time\
[ ](fg:#525252)
$line_break
$character"""
```

### Minimal Variant

For a cleaner look:

```toml
format = """
$directory\
$git_branch\
$git_status\
$line_break\
$character"""

[directory]
style = "fg:#5e8d87 bold"
format = "[$path]($style) "

[git_branch]
style = "fg:#6e8f7c"
format = "[$symbol$branch]($style) "
```

### Add Username and Hostname

```toml
format = """
$username\
$hostname\
$directory\
# ... rest of format
"""

[username]
style_user = "fg:#b8b8b8 bg:#262626"
style_root = "fg:#1c1c1c bg:#9b6a6c"
format = "[$user]($style) "
show_always = false  # Only show in SSH

[hostname]
ssh_only = true
style = "fg:#a09262 bg:#262626"
format = "[@$hostname]($style) "
```

## Terminal Integration

### Font Requirements

For best results, use a **Nerd Font**:
- **JetBrains Mono Nerd Font**
- **Fira Code Nerd Font**
- **Hack Nerd Font**
- **Meslo LG Nerd Font**

Install Nerd Fonts:
```bash
# macOS
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# Linux (manual)
curl -fLo "JetBrains Mono Nerd Font.ttf" \
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.tar.xz
```

### Terminal Emulator Setup

Works perfectly with Midnight Moss terminal themes:
- **Alacritty**: Use `midnight-moss.toml`
- **Kitty**: Use `midnight-moss.conf`
- **iTerm2**: Import `midnight-moss.itermcolors`
- **WezTerm**: Compatible with true color support

## Performance Tips

Starship is fast by default, but you can optimize further:

```toml
# Scan timeout for slow filesystems
scan_timeout = 10

# Command timeout
command_timeout = 500

# Disable slow modules
[nodejs]
detect_files = ["package.json"]  # Only show in Node projects

[python]
detect_extensions = ["py"]       # Only show for Python files
```

## Troubleshooting

### Icons Not Displaying

1. **Install a Nerd Font**: See [Font Requirements](#font-requirements)
2. **Configure terminal** to use the Nerd Font
3. **Test icons**:
   ```bash
   echo -e "\ue0b0 \uf898 \uf81f \ue235"
   ```

### Colors Not Showing

1. **Check true color support**:
   ```bash
   echo $COLORTERM  # Should show 'truecolor'
   ```

2. **Test starship**:
   ```bash
   starship prompt
   ```

3. **Verify config location**:
   ```bash
   starship config
   ```

### Prompt Not Updating

1. **Reload shell**:
   ```bash
   exec $SHELL
   ```

2. **Check starship init**:
   ```bash
   # Should show eval line
   grep starship ~/.zshrc  # or ~/.bashrc
   ```

3. **Clear starship cache**:
   ```bash
   rm -rf ~/.cache/starship
   ```

### Segments Misaligned

- Ensure terminal width is sufficient (minimum 80 columns)
- Verify Nerd Font is properly configured
- Check for conflicting prompt customizations

## Shell-Specific Notes

### Zsh

Works with Oh-My-Zsh, but disable Oh-My-Zsh themes:

```bash
# In ~/.zshrc
ZSH_THEME=""  # Disable Oh-My-Zsh theme
eval "$(starship init zsh)"
```

### Bash

Add to end of `~/.bashrc`:

```bash
eval "$(starship init bash)"
```

### Fish

Works natively with Fish shell configuration:

```fish
# In ~/.config/fish/config.fish
starship init fish | source
```

## Integration

Starship Midnight Moss pairs perfectly with:
- **Terminal themes**: Consistent colors across the stack
- **Editor themes**: Unified development environment
- **tmux/Zellij**: Complementary multiplexer themes
- **Shell tools**: fzf, bat, delta with matching colors

Creates a cohesive, professional development environment with the calming Midnight Moss aesthetic.

## Resources

- **Starship Docs**: https://starship.rs
- **Nerd Fonts**: https://www.nerdfonts.com
- **Configuration Guide**: https://starship.rs/config/

Perfect for developers who want a fast, beautiful, and informative shell prompt that matches the Midnight Moss ecosystem.
