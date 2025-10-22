#!/usr/bin/env bash

# Midnight Moss Dotfiles Uninstaller
# Removes Midnight Moss theme files and optionally restores backups

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
BACKUP_BASE_DIR="$HOME/.midnight-moss-backups"
DRY_RUN=false
RESTORE_BACKUPS=false

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

# Remove file or symlink
remove_file() {
    local file="$1"

    if [ -e "$file" ] || [ -L "$file" ]; then
        if [ "$DRY_RUN" = true ]; then
            print_info "[DRY RUN] Would remove: $file"
        else
            rm "$file"
            print_success "Removed: $file"
        fi
    fi
}

# Uninstall functions for each application

uninstall_alacritty() {
    print_header "Uninstalling Alacritty Theme"

    remove_file "$HOME/.config/alacritty/themes/midnight-moss.toml"
    remove_file "$HOME/.config/alacritty/midnight-moss.yml"

    print_info "Remember to remove import line from alacritty.toml/yml"
}

uninstall_kitty() {
    print_header "Uninstalling Kitty Theme"

    remove_file "$HOME/.config/kitty/midnight-moss.conf"

    print_info "Remember to remove include line from kitty.conf"
}

uninstall_iterm2() {
    print_header "Uninstalling iTerm2 Theme"

    remove_file "$HOME/Downloads/midnight-moss.itermcolors"

    print_info "Manually change color preset in iTerm2 preferences"
}

uninstall_vim() {
    print_header "Uninstalling Vim Colorscheme"

    remove_file "$HOME/.vim/colors/midnight-moss.vim"

    print_info "Remove 'colorscheme midnight-moss' from .vimrc"
}

uninstall_neovim() {
    print_header "Uninstalling Neovim Colorscheme"

    remove_file "$HOME/.config/nvim/colors/midnight-moss.lua"

    print_info "Remove colorscheme line from init.lua"
}

uninstall_tmux() {
    print_header "Uninstalling tmux Theme"

    remove_file "$HOME/.config/tmux/midnight-moss.conf"

    print_info "Remove source-file line from .tmux.conf"
}

uninstall_zellij() {
    print_header "Uninstalling Zellij Theme"

    print_warning "Zellij config contains keybindings and other settings"
    print_info "Manually remove theme section from ~/.config/zellij/config.kdl"
    print_info "Or restore from backup"
}

uninstall_zsh() {
    print_header "Uninstalling Zsh Theme"

    remove_file "$HOME/.oh-my-zsh/themes/midnight-moss.zsh-theme"
    remove_file "$HOME/.config/zsh/themes/midnight-moss.zsh-theme"

    print_info "Change ZSH_THEME in .zshrc to a different theme"
}

uninstall_starship() {
    print_header "Uninstalling Starship Theme"

    remove_file "$HOME/.config/starship-midnight-moss.toml"

    print_warning "If you replaced starship.toml, restore from backup"
    print_info "Or manually remove Midnight Moss configuration"
}

# Show available backups
list_backups() {
    if [ ! -d "$BACKUP_BASE_DIR" ]; then
        print_warning "No backups found"
        return
    fi

    echo -e "${CYAN}Available backups:${NC}\n"
    local count=0
    for backup in "$BACKUP_BASE_DIR"/*; do
        if [ -d "$backup" ]; then
            count=$((count + 1))
            local date=$(basename "$backup")
            echo -e "  ${count}. ${BLUE}$date${NC}"
            echo "     $(ls "$backup" | wc -l) file(s)"
        fi
    done

    if [ $count -eq 0 ]; then
        print_warning "No backups found"
    fi
    echo ""
}

# Restore from backup
restore_backup() {
    local backup_date="$1"
    local backup_dir="$BACKUP_BASE_DIR/$backup_date"

    if [ ! -d "$backup_dir" ]; then
        print_error "Backup not found: $backup_date"
        return 1
    fi

    print_header "Restoring from Backup: $backup_date"

    # Restore each file
    for file in "$backup_dir"/*; do
        local basename=$(basename "$file")
        local dest="$HOME/.config/$basename"

        if [ "$DRY_RUN" = true ]; then
            print_info "[DRY RUN] Would restore: $basename"
        else
            cp -r "$file" "$(dirname "$dest")/"
            print_success "Restored: $basename"
        fi
    done
}

# Usage information
show_usage() {
    cat << EOF
Midnight Moss Dotfiles Uninstaller

Usage: $0 [OPTIONS]

OPTIONS:
    -h, --help          Show this help message
    -d, --dry-run       Show what would be removed without making changes
    -r, --restore       Restore files from backup
    -l, --list-backups  List available backups
    -b, --backup-date   Specify backup date to restore
                        Example: -b 20241022_143022

EXAMPLES:
    # Remove all Midnight Moss theme files
    $0

    # Dry run to see what would be removed
    $0 --dry-run

    # List available backups
    $0 --list-backups

    # Restore from specific backup
    $0 --restore --backup-date 20241022_143022

NOTES:
    - This script removes Midnight Moss theme files
    - Config file references must be removed manually
    - Backups are preserved in ~/.midnight-moss-backups/
    - Use --restore to revert to previous configuration

EOF
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
            -r|--restore)
                RESTORE_BACKUPS=true
                shift
                ;;
            -l|--list-backups)
                list_backups
                exit 0
                ;;
            -b|--backup-date)
                BACKUP_DATE="$2"
                shift 2
                ;;
            *)
                echo "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
}

# Main uninstall function
main() {
    parse_args "$@"

    print_header "Midnight Moss Theme Uninstaller"

    if [ "$DRY_RUN" = true ]; then
        print_warning "DRY RUN MODE - No changes will be made"
    fi

    # Handle restore mode
    if [ "$RESTORE_BACKUPS" = true ]; then
        if [ -z "$BACKUP_DATE" ]; then
            list_backups
            echo -e "${YELLOW}Specify a backup to restore with: --backup-date <date>${NC}"
            exit 0
        else
            restore_backup "$BACKUP_DATE"
            exit 0
        fi
    fi

    # Confirm uninstallation
    echo -e "${YELLOW}This will remove Midnight Moss theme files from your system.${NC}"
    echo ""
    read -p "Continue? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Uninstallation cancelled."
        exit 0
    fi

    # Uninstall all components
    uninstall_alacritty
    uninstall_kitty
    uninstall_iterm2
    uninstall_vim
    uninstall_neovim
    uninstall_tmux
    uninstall_zellij
    uninstall_zsh
    uninstall_starship

    # Final message
    print_header "Uninstallation Complete"

    if [ "$DRY_RUN" = false ]; then
        print_success "Theme files removed"
        print_info "Backups are still available in: $BACKUP_BASE_DIR"
        print_info "Run with --list-backups to see available backups"
        print_info "Run with --restore to restore from backup"
    fi

    echo ""
    echo -e "${CYAN}Remember to:${NC}"
    echo "  - Remove theme references from config files"
    echo "  - Restart applications"
    echo "  - Select a different theme where needed"
}

# Run main function
main "$@"
