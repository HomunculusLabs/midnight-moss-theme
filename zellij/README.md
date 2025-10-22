# Midnight Moss for Zellij

A modern terminal multiplexer theme featuring the Midnight Moss color palette with tmux-style keybindings and streamlined UI.

## Installation

### Prerequisites

1. **Install Zellij**:
   ```bash
   # macOS
   brew install zellij

   # Cargo
   cargo install --locked zellij

   # Arch Linux
   pacman -S zellij

   # Ubuntu/Debian
   # Download latest from https://github.com/zellij-org/zellij/releases
   ```

### Method 1: Direct Configuration

1. **Download the config**:
   ```bash
   mkdir -p ~/.config/zellij
   curl -o ~/.config/zellij/config.kdl \
     https://raw.githubusercontent.com/yourusername/midnight-moss-theme/main/zellij/config.kdl
   ```

2. **Launch Zellij**:
   ```bash
   zellij
   ```

### Method 2: Merge with Existing Config

1. **Backup existing config**:
   ```bash
   cp ~/.config/zellij/config.kdl ~/.config/zellij/config.kdl.backup
   ```

2. **Download theme file**:
   ```bash
   curl -o /tmp/midnight-moss-zellij.kdl \
     https://raw.githubusercontent.com/yourusername/midnight-moss-theme/main/zellij/config.kdl
   ```

3. **Copy theme section** from downloaded file to your config:
   - Copy the `themes` block
   - Copy the `theme "cool-muted"` line
   - Optionally copy keybindings if desired

### Method 3: Theme Only

Add just the theme to your existing config:

```kdl
theme "cool-muted"

themes {
    cool-muted {
        fg "#b8b8b8"
        bg "#1c1c1c"
        black "#1c1c1c"
        red "#9b6a6c"
        green "#6e8f7c"
        yellow "#a09262"
        blue "#5d7e97"
        magenta "#826d94"
        cyan "#5e8d87"
        white "#a8a8a8"
        orange "#9d7a5a"
    }
}
```

## Features

### Color Theme

- **Organic Palette**: Midnight Moss colors throughout the UI
- **True Color Support**: Full 24-bit color rendering
- **Consistent**: Matches other Midnight Moss applications
- **Eye-friendly**: Optimized for reduced strain

### tmux-Style Keybindings

Familiar keybindings for tmux users:

- **Prefix**: `Ctrl+a` (like tmux with rebound prefix)
- **Pane Management**: Intuitive split and navigation
- **Tab Control**: Standard tmux-style tab operations
- **Detach**: Quick session detachment

### Modern UI

- **Simplified UI**: Clean, minimal interface
- **No Pane Frames**: Maximized screen space
- **Compact Layout**: Efficient use of terminal real estate
- **Mouse Support**: Full mouse integration

## Color Palette

### Theme Colors

| Color | Name | Hex | Usage |
|-------|------|-----|-------|
| **Foreground** | Moonlight | `#b8b8b8` | Primary text |
| **Background** | Deep Night | `#1c1c1c` | Main background |
| **Black** | Deep Night | `#1c1c1c` | ANSI black |
| **Red** | Wine | `#9b6a6c` | Errors, deletions |
| **Green** | Forest | `#6e8f7c` | Success, additions |
| **Yellow** | Amber | `#a09262` | Warnings, changes |
| **Blue** | Ocean | `#5d7e97` | Information |
| **Magenta** | Sage | `#826d94` | Special elements |
| **Cyan** | Moss | `#5e8d87` | Highlights, accent |
| **White** | Silver | `#a8a8a8` | Bright text |
| **Orange** | Copper | `#9d7a5a` | Tags, metadata |

## Keybindings

### Prefix Key

- `Ctrl+a`: Enter tmux mode (similar to tmux prefix)

### From tmux Mode

#### Pane Management
- `|`: Split pane vertically (right)
- `-`: Split pane horizontally (down)
- `h`: Move focus left
- `j`: Move focus down
- `k`: Move focus up
- `l`: Move focus right
- `z`: Toggle pane fullscreen/zoom
- `x`: Close current pane

#### Tab Management
- `c`: Create new tab
- `,`: Rename current tab
- `n`: Next tab
- `p`: Previous tab

#### Session Management
- `d`: Detach from session
- `[`: Enter scroll/copy mode

#### Other
- `Space`: Cycle through layouts
- `Esc`: Exit tmux mode (back to normal)
- `g`: Exit tmux mode (alternative)

### Normal Mode

- `Ctrl+a`: Switch to tmux mode

## Configuration Options

### UI Customization

```kdl
// Simplified interface
simplified_ui true

// Remove pane borders for clean look
pane_frames false

// Default layout style
default_layout "compact"
```

### Mouse Support

```kdl
// Enable full mouse integration
mouse_mode true
```

### Clipboard Integration

```kdl
// macOS
copy_command "pbcopy"

// Linux (X11)
copy_command "xclip -selection clipboard"

// Linux (Wayland)
copy_command "wl-copy"

// Windows (WSL)
copy_command "clip.exe"
```

### Scrollback Configuration

```kdl
// Lines to keep in scrollback buffer
scrollback_lines_to_serialize 10000

// Increase for more history
// scrollback_lines_to_serialize 50000
```

## Advanced Configuration

### Custom Layouts

Create custom pane layouts:

```kdl
// ~/.config/zellij/layouts/dev.kdl
layout {
    pane split_direction="vertical" {
        pane size="70%"
        pane split_direction="horizontal" {
            pane size="50%"
            pane size="50%"
        }
    }
}
```

Launch with custom layout:
```bash
zellij --layout dev
```

### Additional Keybindings

Add more keybindings to the `tmux` mode:

```kdl
keybinds {
    tmux {
        // Your existing bindings...

        // Add custom bindings
        bind "r" { SwitchToMode "Resize"; }
        bind "s" { SwitchToMode "Search"; }
        bind "q" { Quit; }
    }
}
```

### Session Management

```kdl
// Auto-attach to existing session
on_force_close "detach"

// Session name template
session_name "dev"
```

## Terminal Integration

### Font Requirements

Works with any monospace font, enhanced with:
- **JetBrains Mono Nerd Font**
- **Fira Code Nerd Font**
- **Cascadia Code**

### Terminal Compatibility

Optimized for terminals with Midnight Moss themes:
- **Alacritty**: Full compatibility with midnight-moss.toml
- **Kitty**: Works perfectly with midnight-moss.conf
- **iTerm2**: Excellent rendering with midnight-moss.itermcolors
- **WezTerm**: True color support

## Usage Tips

### Starting Zellij

```bash
# Start new session
zellij

# Start with name
zellij --session my-project

# Attach to existing session
zellij attach my-project

# List sessions
zellij list-sessions

# Kill session
zellij kill-session my-project
```

### Common Workflows

#### Development Layout

1. `Ctrl+a` → `|` : Split for code and terminal
2. `Ctrl+a` → `-` : Split terminal for logs
3. `Ctrl+a` → `c` : New tab for git operations

#### Scroll and Copy

1. `Ctrl+a` → `[` : Enter scroll mode
2. Use arrow keys or vim keys to navigate
3. Enter search mode with `/`
4. Copy text with mouse selection

### Quick Reference Card

Print and keep handy:

```
┌─────────────────────────────────────────┐
│     Zellij Midnight Moss Quick Ref      │
├─────────────────────────────────────────┤
│ Ctrl+a        │ Enter command mode      │
│ Ctrl+a |      │ Split vertical         │
│ Ctrl+a -      │ Split horizontal       │
│ Ctrl+a h/j/k/l│ Navigate panes         │
│ Ctrl+a z      │ Zoom pane             │
│ Ctrl+a c      │ New tab               │
│ Ctrl+a n/p    │ Next/Previous tab     │
│ Ctrl+a [      │ Scroll mode           │
│ Ctrl+a d      │ Detach                │
│ Ctrl+a x      │ Close pane            │
└─────────────────────────────────────────┘
```

## Troubleshooting

### Colors Not Displaying

1. **Check terminal support**:
   ```bash
   echo $COLORTERM  # Should show 'truecolor'
   ```

2. **Verify Zellij config**:
   ```bash
   zellij setup --check
   ```

3. **Test theme**:
   ```bash
   zellij --theme cool-muted
   ```

### Keybindings Not Working

1. **Check config location**:
   ```bash
   ls -la ~/.config/zellij/config.kdl
   ```

2. **Verify keybind syntax**:
   ```bash
   zellij setup --check
   ```

3. **Reset to defaults**:
   ```bash
   mv ~/.config/zellij/config.kdl ~/.config/zellij/config.kdl.backup
   zellij setup --dump-config > ~/.config/zellij/config.kdl
   # Then re-add theme
   ```

### Session Issues

1. **List active sessions**:
   ```bash
   zellij list-sessions
   ```

2. **Kill zombie sessions**:
   ```bash
   zellij kill-all-sessions
   ```

3. **Clear session data**:
   ```bash
   rm -rf /tmp/zellij-*
   ```

### Performance Issues

1. **Reduce scrollback**:
   ```kdl
   scrollback_lines_to_serialize 5000
   ```

2. **Disable mouse mode**:
   ```kdl
   mouse_mode false
   ```

3. **Use simpler layout**:
   ```kdl
   default_layout "default"
   ```

## Comparison with tmux

### Advantages

- **Modern**: Built in Rust, actively developed
- **Better UI**: More polished default interface
- **Easier Config**: KDL format is more readable
- **Mouse Support**: Better mouse integration
- **Floating Panes**: Supports floating windows

### Migration from tmux

If you're coming from tmux:

1. **Familiar Keybindings**: This config uses tmux-style keys
2. **Similar Concepts**: Panes, tabs (windows), sessions
3. **Improved**: Better defaults, easier customization
4. **Compatible**: Can run tmux inside Zellij if needed

## Integration

### Shell Integration

Add to your shell config:

**Zsh** (`~/.zshrc`):
```bash
# Auto-start Zellij
if [[ -z "$ZELLIJ" ]]; then
    zellij attach -c default
fi
```

**Bash** (`~/.bashrc`):
```bash
# Auto-start Zellij
if [[ -z "$ZELLIJ" ]]; then
    zellij attach -c default
fi
```

### Editor Integration

Zellij works great with terminal editors:
- **Neovim**: Use Midnight Moss Neovim theme
- **Vim**: Use Midnight Moss Vim colorscheme
- **Helix**: Compatible with any terminal setup

### Application Stack

Perfect pairing with Midnight Moss ecosystem:
- **Terminal**: Alacritty/Kitty with Midnight Moss
- **Multiplexer**: Zellij with cool-muted theme
- **Prompt**: Starship Midnight Moss config
- **Editor**: Neovim Midnight Moss colorscheme

Creates a unified, beautiful development environment.

## Resources

- **Zellij Docs**: https://zellij.dev/documentation/
- **Zellij GitHub**: https://github.com/zellij-org/zellij
- **KDL Format**: https://kdl.dev/

Perfect for developers who want a modern, efficient terminal multiplexer with the calming aesthetics of Midnight Moss.
