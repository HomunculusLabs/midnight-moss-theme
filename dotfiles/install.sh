#!/usr/bin/env bash

# Midnight Moss Dotfiles Installer
# Automates installation of Midnight Moss themes across your system

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$(dirname "$SCRIPT_DIR")"

# Configuration
BACKUP_DIR="$HOME/.midnight-moss-backups/$(date +%Y%m%d_%H%M%S)"
DRY_RUN=false
INTERACTIVE=true
FORCE=false

# Installation targets (enabled by default)
declare -A INSTALL_TARGETS=(
    [alacritty]=true
    [kitty]=true
    [iterm2]=false  # macOS only
    [vim]=true
    [neovim]=true
    [tmux]=true
    [zellij]=true
    [zsh]=true
    [starship]=true
    [vscode]=false  # Manual installation recommended
    [sublime]=false # Manual installation recommended
    [jetbrains]=false # Manual installation recommended
    [obsidian]=false # Manual installation recommended
    [firefox]=false # Manual installation recommended
)

# Helper functions
print_header() {
    echo -e "\n${CYAN}═══════════════════════════════════════════════${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Backup file if it exists
backup_file() {
    local file="$1"
    if [ -f "$file" ] || [ -d "$file" ]; then
        mkdir -p "$BACKUP_DIR"
        cp -r "$file" "$BACKUP_DIR/"
        print_info "Backed up: $file → $BACKUP_DIR/"
    fi
}

# Create symlink or copy file
install_file() {
    local src="$1"
    local dest="$2"
    local use_symlink="${3:-false}"

    # Create destination directory if needed
    mkdir -p "$(dirname "$dest")"

    # Backup existing file
    backup_file "$dest"

    # Install
    if [ "$DRY_RUN" = true ]; then
        print_info "[DRY RUN] Would install: $dest"
    else
        if [ "$use_symlink" = true ]; then
            ln -sf "$src" "$dest"
            print_success "Symlinked: $dest"
        else
            cp "$src" "$dest"
            print_success "Installed: $dest"
        fi
    fi
}

# Installation functions for each application

install_alacritty() {
    if ! command_exists alacritty; then
        print_warning "Alacritty not found, skipping..."
        return
    fi

    print_header "Installing Alacritty Theme"

    local config_dir="$HOME/.config/alacritty"
    local theme_dir="$config_dir/themes"

    mkdir -p "$theme_dir"

    # Determine which format to use based on alacritty version
    if [ -f "$config_dir/alacritty.toml" ] || alacritty --version | grep -q "0.1[3-9]"; then
        install_file "$THEME_DIR/alacritty/midnight-moss.toml" "$theme_dir/midnight-moss.toml"
        print_info "Add to alacritty.toml: import = [\"~/.config/alacritty/themes/midnight-moss.toml\"]"
    else
        install_file "$THEME_DIR/alacritty/midnight-moss.yml" "$config_dir/midnight-moss.yml"
        print_info "Merge colors section into your alacritty.yml"
    fi
}

install_kitty() {
    if ! command_exists kitty; then
        print_warning "Kitty not found, skipping..."
        return
    fi

    print_header "Installing Kitty Theme"

    local config_dir="$HOME/.config/kitty"
    install_file "$THEME_DIR/kitty/midnight-moss.conf" "$config_dir/midnight-moss.conf"
    print_info "Add to kitty.conf: include midnight-moss.conf"
}

install_iterm2() {
    if [ "$(uname)" != "Darwin" ]; then
        print_warning "iTerm2 is macOS only, skipping..."
        return
    fi

    print_header "Installing iTerm2 Theme"

    local dest="$HOME/Downloads/midnight-moss.itermcolors"
    install_file "$THEME_DIR/iterm2/midnight-moss.itermcolors" "$dest"
    print_info "Double-click ~/Downloads/midnight-moss.itermcolors to import"
    print_info "Then select in Preferences → Profiles → Colors"
}

install_vim() {
    if ! command_exists vim; then
        print_warning "Vim not found, skipping..."
        return
    fi

    print_header "Installing Vim Colorscheme"

    local colors_dir="$HOME/.vim/colors"
    install_file "$THEME_DIR/vim/midnight-moss.vim" "$colors_dir/midnight-moss.vim"
    print_info "Add to .vimrc: colorscheme midnight-moss"
}

install_neovim() {
    if ! command_exists nvim; then
        print_warning "Neovim not found, skipping..."
        return
    fi

    print_header "Installing Neovim Colorscheme"

    local colors_dir="$HOME/.config/nvim/colors"
    install_file "$THEME_DIR/neovim/midnight-moss.lua" "$colors_dir/midnight-moss.lua"
    print_info "Add to init.lua: vim.cmd('colorscheme midnight-moss')"
}

install_tmux() {
    if ! command_exists tmux; then
        print_warning "tmux not found, skipping..."
        return
    fi

    print_header "Installing tmux Theme"

    local config_dir="$HOME/.config/tmux"
    install_file "$THEME_DIR/tmux/midnight-moss.conf" "$config_dir/midnight-moss.conf"
    print_info "Add to .tmux.conf: source-file ~/.config/tmux/midnight-moss.conf"
}

install_zellij() {
    if ! command_exists zellij; then
        print_warning "Zellij not found, skipping..."
        return
    fi

    print_header "Installing Zellij Theme"

    local config_file="$HOME/.config/zellij/config.kdl"

    if [ -f "$config_file" ]; then
        print_warning "Zellij config already exists"
        print_info "Manually merge theme from: $THEME_DIR/zellij/config.kdl"
    else
        install_file "$THEME_DIR/zellij/config.kdl" "$config_file"
    fi
}

install_zsh() {
    if ! command_exists zsh; then
        print_warning "Zsh not found, skipping..."
        return
    fi

    print_header "Installing Zsh Theme"

    if [ -d "$HOME/.oh-my-zsh" ]; then
        local theme_dir="$HOME/.oh-my-zsh/themes"
        install_file "$THEME_DIR/zsh/midnight-moss.zsh-theme" "$theme_dir/midnight-moss.zsh-theme"
        print_info "Set in .zshrc: ZSH_THEME=\"midnight-moss\""
    else
        local theme_dir="$HOME/.config/zsh/themes"
        install_file "$THEME_DIR/zsh/midnight-moss.zsh-theme" "$theme_dir/midnight-moss.zsh-theme"
        print_info "Source in .zshrc: source ~/.config/zsh/themes/midnight-moss.zsh-theme"
    fi
}

install_starship() {
    if ! command_exists starship; then
        print_warning "Starship not found, skipping..."
        return
    fi

    print_header "Installing Starship Theme"

    local config_file="$HOME/.config/starship.toml"

    if [ -f "$config_file" ]; then
        print_warning "Starship config already exists"
        print_info "Merge configuration from: $THEME_DIR/starship/starship.toml"
        install_file "$THEME_DIR/starship/starship.toml" "$HOME/.config/starship-midnight-moss.toml"
    else
        install_file "$THEME_DIR/starship/starship.toml" "$config_file"
    fi
}

# Usage information
show_usage() {
    cat << EOF
Midnight Moss Dotfiles Installer

Usage: $0 [OPTIONS]

OPTIONS:
    -h, --help          Show this help message
    -d, --dry-run       Show what would be installed without making changes
    -f, --force         Force installation without prompts
    -y, --yes           Assume yes to all prompts (non-interactive)
    -t, --targets       Specify targets (comma-separated)
                        Example: -t alacritty,kitty,vim
    -a, --all           Install all supported applications
    --list-targets      List all available installation targets

EXAMPLES:
    # Interactive installation (default)
    $0

    # Install only specific applications
    $0 -t alacritty,vim,tmux

    # Dry run to see what would be installed
    $0 --dry-run

    # Non-interactive installation
    $0 -y

    # Install everything
    $0 --all -y

NOTES:
    - Existing files are backed up to ~/.midnight-moss-backups/
    - Some applications require manual steps (check output)
    - Run with --dry-run first to preview changes

EOF
}

# List available targets
list_targets() {
    echo "Available installation targets:"
    echo ""
    for target in "${!INSTALL_TARGETS[@]}"; do
        local status="${INSTALL_TARGETS[$target]}"
        if [ "$status" = true ]; then
            echo -e "  ${GREEN}✓${NC} $target (enabled by default)"
        else
            echo -e "  ${YELLOW}○${NC} $target (disabled by default)"
        fi
    done
    echo ""
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_usage
                exit 0
                ;;
            -d|--dry-run)
                DRY_RUN=true
                shift
                ;;
            -f|--force)
                FORCE=true
                shift
                ;;
            -y|--yes)
                INTERACTIVE=false
                shift
                ;;
            -t|--targets)
                # Disable all targets first
                for target in "${!INSTALL_TARGETS[@]}"; do
                    INSTALL_TARGETS[$target]=false
                done
                # Enable specified targets
                IFS=',' read -ra TARGETS <<< "$2"
                for target in "${TARGETS[@]}"; do
                    INSTALL_TARGETS[$target]=true
                done
                shift 2
                ;;
            -a|--all)
                for target in "${!INSTALL_TARGETS[@]}"; do
                    INSTALL_TARGETS[$target]=true
                done
                shift
                ;;
            --list-targets)
                list_targets
                exit 0
                ;;
            *)
                echo "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
}

# Main installation function
main() {
    parse_args "$@"

    print_header "Midnight Moss Theme Installer"

    if [ "$DRY_RUN" = true ]; then
        print_warning "DRY RUN MODE - No changes will be made"
    fi

    echo -e "Theme directory: ${BLUE}$THEME_DIR${NC}"
    echo -e "Backup directory: ${BLUE}$BACKUP_DIR${NC}"
    echo ""

    # Confirm installation
    if [ "$INTERACTIVE" = true ] && [ "$FORCE" = false ]; then
        echo -e "${YELLOW}The following will be installed:${NC}"
        for target in "${!INSTALL_TARGETS[@]}"; do
            if [ "${INSTALL_TARGETS[$target]}" = true ]; then
                echo "  - $target"
            fi
        done
        echo ""
        read -p "Continue? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Installation cancelled."
            exit 0
        fi
    fi

    # Install enabled targets
    for target in "${!INSTALL_TARGETS[@]}"; do
        if [ "${INSTALL_TARGETS[$target]}" = true ]; then
            install_$target
        fi
    done

    # Final message
    print_header "Installation Complete!"

    if [ "$DRY_RUN" = false ]; then
        print_success "Themes installed successfully"
        if [ -d "$BACKUP_DIR" ]; then
            print_info "Backups saved to: $BACKUP_DIR"
        fi
        echo ""
        print_info "Some applications may require:"
        echo "  - Restarting the application"
        echo "  - Adding configuration lines (check output above)"
        echo "  - Manual import steps (for VS Code, JetBrains, etc.)"
    fi

    echo ""
    echo -e "${CYAN}🌿 Enjoy Midnight Moss! 🌙${NC}"
}

# Run main function
main "$@"
