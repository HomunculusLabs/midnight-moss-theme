class MidnightMossThemes < Formula
  desc "Dark organic color theme collection with moss-inspired accents"
  homepage "https://github.com/HomunculusLabs/midnight-moss-theme"
  url "https://github.com/HomunculusLabs/midnight-moss-theme/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256" # Update with actual SHA256 when releasing
  license "MIT"
  version "1.0.0"

  def install
    # Create base directory
    (share/"midnight-moss").install Dir["*"]

    # Install terminal themes to conventional locations
    (share/"alacritty/themes").install "alacritty/midnight-moss.toml"
    (share/"alacritty/themes").install "alacritty/midnight-moss.yml"
    (share/"kitty/themes").install "kitty/midnight-moss.conf"
    (share/"iterm2").install "iterm2/midnight-moss.itermcolors"

    # Install editor themes
    (share/"vim/colors").install "vim/midnight-moss.vim"
    (share/"nvim/colors").install "neovim/midnight-moss.lua"

    # Install shell themes
    (share/"zsh/themes").install "zsh/midnight-moss.zsh-theme"
    (share/"starship").install "starship/starship.toml" => "midnight-moss.toml"

    # Install multiplexer themes
    (share/"tmux").install "tmux/midnight-moss.conf"
    (share/"zellij/themes").install "zellij/config.kdl" => "midnight-moss.kdl"

    # Install application themes
    (share/"obsidian/themes/midnight-moss").install "obsidian/theme.css"
    (share/"obsidian/themes/midnight-moss").install "obsidian/manifest.json"
    (share/"vscode").install "vscode/themes/midnight-moss-theme.json"
    (share/"sublime-text").install "sublime-text/midnight-moss.sublime-color-scheme"
    (share/"jetbrains").install "jetbrains/midnight-moss.icls"

    # Install Firefox theme
    (share/"firefox").install "firefox/userChrome.css"
    (share/"firefox").install "firefox/userContent.css"
  end

  def caveats
    <<~EOS
      Midnight Moss themes have been installed to:
        #{share}/midnight-moss

      Quick setup for common applications:

      Alacritty:
        mkdir -p ~/.config/alacritty/themes
        cp #{share}/alacritty/themes/midnight-moss.toml ~/.config/alacritty/themes/
        # Add to alacritty.toml: import = ["~/.config/alacritty/themes/midnight-moss.toml"]

      iTerm2:
        open #{share}/iterm2/midnight-moss.itermcolors
        # Select in Preferences → Profiles → Colors → Color Presets

      Kitty:
        echo "include #{share}/kitty/themes/midnight-moss.conf" >> ~/.config/kitty/kitty.conf

      Vim:
        mkdir -p ~/.vim/colors
        cp #{share}/vim/colors/midnight-moss.vim ~/.vim/colors/
        # Add to .vimrc: colorscheme midnight-moss

      Neovim:
        mkdir -p ~/.config/nvim/colors
        cp #{share}/nvim/colors/midnight-moss.lua ~/.config/nvim/colors/
        # Add to init.lua: vim.cmd('colorscheme midnight-moss')

      Zsh (Oh-My-Zsh):
        cp #{share}/zsh/themes/midnight-moss.zsh-theme ~/.oh-my-zsh/themes/
        # Set ZSH_THEME="midnight-moss" in ~/.zshrc

      tmux:
        echo "source-file #{share}/tmux/midnight-moss.conf" >> ~/.tmux.conf

      VS Code:
        # Copy to extensions or install from marketplace

      For detailed instructions, see:
        #{share}/midnight-moss/INSTALL.md
    EOS
  end

  test do
    assert_predicate share/"midnight-moss/README.md", :exist?
    assert_predicate share/"alacritty/themes/midnight-moss.toml", :exist?
    assert_predicate share/"vim/colors/midnight-moss.vim", :exist?
  end
end
