# Midnight Moss for Kitty

A dark, organic terminal theme for Kitty with moss-inspired colors optimized for modern terminal workflows.

## Installation

### Method 1: Include Configuration File

1. **Download the theme**:
   ```bash
   curl -o ~/.config/kitty/midnight-moss.conf \
     https://raw.githubusercontent.com/yourusername/midnight-moss-theme/main/kitty/midnight-moss.conf
   ```

2. **Include in your main config**:
   Add this line to your `~/.config/kitty/kitty.conf`:
   ```bash
   include midnight-moss.conf
   ```

3. **Reload Kitty**:
   Press `Ctrl+Shift+F5` or restart Kitty

### Method 2: Direct Integration

1. Download `midnight-moss.conf`
2. Copy the contents into your `~/.config/kitty/kitty.conf` file
3. Reload with `Ctrl+Shift+F5`

### Method 3: One-liner Installation

```bash
curl -o ~/.config/kitty/midnight-moss.conf https://raw.githubusercontent.com/yourusername/midnight-moss-theme/main/kitty/midnight-moss.conf && echo "include midnight-moss.conf" >> ~/.config/kitty/kitty.conf
```

## Features

### Comprehensive Color Palette

- **16 Standard ANSI Colors**: Carefully chosen for compatibility
- **Cursor Styling**: Moss green cursor with high contrast
- **Selection**: Moss background with dark text for readability
- **Tab Bar**: Sophisticated gradient for active/inactive tabs
- **Window Borders**: Moss accent for active windows

### UI Elements

- **Active Tab**: High contrast with moss accents
- **Inactive Tabs**: Subdued charcoal background
- **URL Highlighting**: Moss green underlines on hover
- **Border Colors**: Moss for active, stone for inactive windows
- **Bell Border**: Amber notification color

### Enhanced Features

- **Marks Support**: Three color-coded mark types (moss, forest, ocean)
- **Tab Bar Styling**: Clean separation between tabs
- **Split Panes**: Clear visual borders for active/inactive panes
- **System Integration**: Native titlebar colors on macOS/Wayland

## Color Reference

### Primary Colors

| Element | Color Name | Hex | Usage |
|---------|-----------|-----|-------|
| **Background** | Deep Night | `#1c1c1c` | Main background |
| **Foreground** | Moonlight | `#b8b8b8` | Primary text |
| **Cursor** | Moss | `#5e8d87` | Cursor and accent |
| **Selection BG** | Moss | `#5e8d87` | Text selection |
| **Selection FG** | Deep Night | `#1c1c1c` | Selected text |

### ANSI Colors (0-15)

| Index | Name | Normal | Bright |
|-------|------|--------|--------|
| 0/8 | Black | `#1c1c1c` | `#525252` |
| 1/9 | Red | `#9b6a6c` | `#a37174` |
| 2/10 | Green | `#6e8f7c` | `#7a9e8c` |
| 3/11 | Yellow | `#a09262` | `#afa072` |
| 4/12 | Blue | `#5d7e97` | `#6d8ca7` |
| 5/13 | Magenta | `#826d94` | `#927ba4` |
| 6/14 | Cyan | `#5e8d87` | `#6e9b95` |
| 7/15 | White | `#b8b8b8` | `#c8c8c8` |

### Tab Bar Colors

- **Active Tab**: Foreground `#c8c8c8`, Background `#1c1c1c`
- **Inactive Tab**: Foreground `#7a7a7a`, Background `#262626`
- **Tab Bar Background**: `#2e2e2e`

## Configuration Tips

### Font Recommendations

The theme pairs excellently with these fonts:

```bash
# In kitty.conf
font_family      JetBrains Mono
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size 14.0
```

Alternative fonts that work well:
- **Fira Code** - Programming ligatures
- **Cascadia Code** - Modern monospace with ligatures
- **SF Mono** - Clean macOS font
- **Source Code Pro** - Adobe's programming font

### Window Layout

Enhance your split pane experience:

```bash
# Window layout settings
window_padding_width 4
window_border_width 1pt
active_border_color #5e8d87
inactive_border_color #3a3a3a

# Tab bar
tab_bar_edge top
tab_bar_style powerline
tab_powerline_style slanted
```

### Cursor Customization

```bash
# Cursor settings
cursor_shape block
cursor_blink_interval 0
cursor_stop_blinking_after 15.0
```

### Background Opacity

For a subtle transparency effect:

```bash
background_opacity 0.95
dynamic_background_opacity yes
```

## Advanced Customization

### Marks Configuration

Kitty's marks feature is configured with three color variants:

```bash
# Mark 1 (Moss) - Primary marks
mark1_foreground #1c1c1c
mark1_background #5e8d87

# Mark 2 (Forest) - Secondary marks
mark2_foreground #1c1c1c
mark2_background #6e8f7c

# Mark 3 (Ocean) - Tertiary marks
mark3_foreground #1c1c1c
mark3_background #5d7e97
```

### URL Hints

```bash
# URL styling
url_color #5e8d87
url_style curly
detect_urls yes
```

## Terminal Integration

### Works Perfectly With

- **Neovim/Vim**: Use the Midnight Moss Neovim/Vim themes
- **tmux**: Pair with Midnight Moss tmux configuration
- **Zsh**: Combine with Midnight Moss zsh theme
- **Starship**: Use the matching Starship prompt theme

### Application Compatibility

Optimized for:
- **Git**: Clear diff and status highlighting
- **htop/btop**: Enhanced process monitoring
- **Ranger/lf**: File manager colors
- **Less/Bat**: Pager integration
- **fzf**: Fuzzy finder styling

## Troubleshooting

### Colors Not Displaying Correctly

1. **Check Kitty version**:
   ```bash
   kitty --version  # Should be 0.19.0 or newer
   ```

2. **Test color support**:
   ```bash
   kitty +kitten themes
   ```

3. **Verify configuration**:
   ```bash
   kitty --debug-config | grep -A 20 "^# Colors"
   ```

### Theme Not Loading

1. **Check file location**:
   ```bash
   ls -la ~/.config/kitty/midnight-moss.conf
   ```

2. **Verify include statement**:
   ```bash
   grep "midnight-moss" ~/.config/kitty/kitty.conf
   ```

3. **Check for errors**:
   ```bash
   kitty --debug-config
   ```

### Tab Bar Issues

If tab bar colors aren't applying:

```bash
# Ensure these settings are after the include statement
tab_bar_edge top
tab_bar_style powerline
```

## Performance Notes

Kitty is GPU-accelerated and performs excellently with this theme:

- **True Color Support**: Full 24-bit color rendering
- **Ligature Support**: Works with programming fonts
- **Fast Rendering**: Optimized for low latency
- **Image Display**: Built-in image protocol support

## Keyboard Shortcuts

Useful Kitty shortcuts with the theme:

- `Ctrl+Shift+F5`: Reload configuration
- `Ctrl+Shift+F6`: Debug configuration
- `Ctrl+Shift+F2`: Edit kitty.conf
- `Ctrl+Shift+T`: New tab
- `Ctrl+Shift+Enter`: New window
- `Ctrl+Shift+W`: Close window

## Integration

The Midnight Moss Kitty theme is part of a comprehensive theme ecosystem:

- Consistent colors across all development tools
- Pairs with editor themes for unified experience
- Complements tmux and shell prompt themes
- Reduces eye strain during long coding sessions

Perfect for developers who appreciate nature-inspired aesthetics and want a cohesive, comfortable terminal environment.
