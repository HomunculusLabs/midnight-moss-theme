# Midnight Moss for Neovim

A dark, organic colorscheme for Neovim featuring moss-inspired colors with comprehensive syntax highlighting and plugin support.

## Installation

### Using a Plugin Manager

#### lazy.nvim (Recommended)

```lua
{
  'yourusername/midnight-moss-theme',
  config = function()
    vim.cmd('colorscheme midnight-moss')
  end,
}
```

#### packer.nvim

```lua
use {
  'yourusername/midnight-moss-theme',
  config = function()
    vim.cmd('colorscheme midnight-moss')
  end,
}
```

#### vim-plug

```vim
Plug 'yourusername/midnight-moss-theme'
```

Then in your `init.vim`:
```vim
colorscheme midnight-moss
```

### Manual Installation

1. **Download the theme**:
   ```bash
   mkdir -p ~/.config/nvim/colors
   curl -o ~/.config/nvim/colors/midnight-moss.lua \
     https://raw.githubusercontent.com/yourusername/midnight-moss-theme/main/neovim/midnight-moss.lua
   ```

2. **Load the colorscheme**:
   Add to your `init.lua`:
   ```lua
   vim.cmd('colorscheme midnight-moss')
   ```

   Or in `init.vim`:
   ```vim
   colorscheme midnight-moss
   ```

3. **Reload Neovim**:
   ```vim
   :source $MYVIMRC
   ```

## Features

### Comprehensive Syntax Highlighting

- **Modern Lua API**: Uses Neovim's built-in highlight API
- **Semantic Tokens**: LSP semantic highlighting support
- **TreeSitter**: Enhanced highlighting for TreeSitter
- **Language Support**: Optimized for major languages

### Plugin Support

- **Telescope**: Fuzzy finder integration
- **nvim-tree**: File explorer theming
- **gitsigns**: Git integration colors
- **lualine**: Status line support
- **nvim-cmp**: Completion menu styling
- **which-key**: Keybinding popup theming
- **indent-blankline**: Indentation guides
- **hop/leap**: Motion plugin highlights

### UI Elements

- **Editor**: Background, foreground, cursor, line numbers
- **Selections**: Visual mode, search highlights
- **Diff**: Add, change, delete markers
- **Diagnostics**: LSP errors, warnings, hints, info
- **Popups**: Floating windows, completion menus
- **Status Line**: Integrated colors for status plugins

## Color Palette

### Base Colors

| Color | Name | Hex | Usage |
|-------|------|-----|-------|
| **Background** | Deep Night | `#1c1c1c` | Editor background |
| **Background Alt** | Shadow | `#262626` | Sidebars, statusline |
| **Background Highlight** | Charcoal | `#2e2e2e` | Cursor line, selections |
| **Foreground** | Moonlight | `#b8b8b8` | Normal text |
| **Foreground Alt** | Mist | `#7a7a7a` | Comments, muted text |

### Accent Colors

| Color | Name | Hex | Usage |
|-------|------|-----|-------|
| **Moss** | Primary | `#5e8d87` | Links, visual selections, operators |
| **Forest** | Success | `#6e8f7c` | Strings, diff additions, success |
| **Ocean** | Info | `#5d7e97` | Functions, info diagnostics |
| **Wine** | Error | `#9b6a6c` | Errors, diff deletions |
| **Sage** | Keyword | `#826d94` | Keywords, special tokens |
| **Amber** | String | `#a09262` | String literals, warnings |
| **Copper** | Constant | `#9d7a5a` | Constants, numbers, tags |

## Syntax Highlighting Examples

### Language Elements

```lua
-- Keywords: Sage purple
if, else, function, return, local

-- Strings: Amber yellow
"Hello, World!"

-- Functions: Ocean blue
function myFunction()

-- Numbers: Copper orange
42, 3.14

-- Comments: Mist gray
-- This is a comment

-- Operators: Moss green
+, -, *, /, =, ==

-- Classes/Types: Forest green
class MyClass
```

### LSP Integration

- **Errors**: Wine red underline
- **Warnings**: Amber yellow underline
- **Hints**: Mist gray underline
- **Info**: Ocean blue underline
- **References**: Moss green background

### Git Integration

- **Added Lines**: Forest green
- **Changed Lines**: Amber yellow
- **Deleted Lines**: Wine red
- **Conflict Markers**: Wine red background

## Configuration

### Basic Setup

```lua
-- In your init.lua
vim.cmd('colorscheme midnight-moss')

-- Optional: Enable true colors
vim.opt.termguicolors = true

-- Optional: Enable cursorline highlighting
vim.opt.cursorline = true
```

### With Options

```lua
-- Customize before loading colorscheme
vim.g.midnight_moss_italic_comments = true
vim.g.midnight_moss_italic_keywords = false
vim.g.midnight_moss_transparent_background = false

vim.cmd('colorscheme midnight-moss')
```

### Lualine Integration

```lua
require('lualine').setup {
  options = {
    theme = {
      normal = {
        a = { bg = '#5e8d87', fg = '#1c1c1c', gui = 'bold' },
        b = { bg = '#2e2e2e', fg = '#b8b8b8' },
        c = { bg = '#262626', fg = '#7a7a7a' },
      },
      insert = {
        a = { bg = '#6e8f7c', fg = '#1c1c1c', gui = 'bold' },
      },
      visual = {
        a = { bg = '#826d94', fg = '#1c1c1c', gui = 'bold' },
      },
      replace = {
        a = { bg = '#9b6a6c', fg = '#1c1c1c', gui = 'bold' },
      },
      command = {
        a = { bg = '#a09262', fg = '#1c1c1c', gui = 'bold' },
      },
    },
  },
}
```

### nvim-tree Integration

```lua
require('nvim-tree').setup {
  renderer = {
    highlight_git = true,
    highlight_opened_files = "icon",
    icons = {
      glyphs = {
        git = {
          unstaged = "~",
          staged = "+",
          unmerged = "",
          renamed = "➜",
          untracked = "?",
          deleted = "",
        },
      },
    },
  },
}
```

### Telescope Integration

The theme includes built-in Telescope support. Colors are automatically applied for:
- Prompt border and title
- Selection highlight
- Results and preview windows
- Matching characters

## Plugin Highlights

### Supported Plugins

#### Core Plugins
- **nvim-treesitter**: Enhanced syntax highlighting
- **nvim-lspconfig**: LSP integration
- **nvim-cmp**: Completion menu
- **gitsigns.nvim**: Git indicators

#### UI Plugins
- **lualine.nvim**: Status line
- **bufferline.nvim**: Buffer tabs
- **nvim-tree.lua**: File explorer
- **telescope.nvim**: Fuzzy finder
- **which-key.nvim**: Keybinding help
- **indent-blankline.nvim**: Indent guides
- **trouble.nvim**: Diagnostics panel

#### Navigation Plugins
- **hop.nvim**: Jump motion
- **leap.nvim**: Enhanced navigation
- **flash.nvim**: Fast navigation

#### Git Plugins
- **gitsigns.nvim**: Git status in sign column
- **diffview.nvim**: Git diff viewer
- **neogit**: Git interface

## Language Support

Optimized syntax highlighting for:

### Programming Languages
- **Lua**: Full semantic support
- **Python**: Comprehensive highlighting
- **JavaScript/TypeScript**: Modern syntax
- **Go**: Complete language support
- **Rust**: Advanced highlighting
- **C/C++**: System programming
- **Java**: Enterprise development

### Web Technologies
- **HTML**: Tag and attribute highlighting
- **CSS/SCSS**: Selector and property colors
- **JSON**: Structure highlighting
- **Markdown**: Enhanced readability

### Configuration Files
- **YAML**: Structure highlighting
- **TOML**: Configuration files
- **Dockerfile**: Container configs
- **Shell**: Bash/Zsh scripts

## Troubleshooting

### Colors Not Displaying Correctly

1. **Enable true colors**:
   ```lua
   vim.opt.termguicolors = true
   ```

2. **Check terminal support**:
   ```bash
   echo $COLORTERM  # Should show 'truecolor' or '24bit'
   ```

3. **Test in terminal**:
   ```vim
   :set termguicolors?
   ```

### Theme Not Loading

1. **Verify installation**:
   ```bash
   ls -la ~/.config/nvim/colors/midnight-moss.lua
   ```

2. **Check for errors**:
   ```vim
   :messages
   ```

3. **Reload colorscheme**:
   ```vim
   :colorscheme midnight-moss
   ```

### Plugin Highlights Not Working

1. **Ensure plugins are loaded after colorscheme**:
   ```lua
   vim.cmd('colorscheme midnight-moss')
   -- Plugin setup comes after
   require('plugin').setup()
   ```

2. **Clear highlight cache**:
   ```vim
   :hi clear
   :colorscheme midnight-moss
   ```

## Customization

### Override Highlights

```lua
-- In your init.lua, after loading the colorscheme
vim.api.nvim_set_hl(0, 'Comment', { fg = '#your_color', italic = true })
vim.api.nvim_set_hl(0, 'Function', { fg = '#your_color', bold = true })
```

### Transparent Background

```lua
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
```

### Italic Comments

```lua
vim.api.nvim_set_hl(0, 'Comment', { fg = '#7a7a7a', italic = true })
```

## Terminal Integration

Works seamlessly with:
- **Alacritty**: Use Midnight Moss Alacritty theme
- **Kitty**: Pair with Midnight Moss Kitty config
- **iTerm2**: Combine with Midnight Moss iTerm2 colors
- **tmux**: Enhanced with Midnight Moss tmux theme

## Performance

- **Lazy Loading**: Fast startup time
- **Treesitter Optimized**: Efficient syntax highlighting
- **No External Dependencies**: Pure Lua implementation
- **Minimal CPU Usage**: Optimized highlight definitions

Perfect for developers who want a cohesive, eye-friendly coding environment with the calming aesthetics of the Midnight Moss color palette.
