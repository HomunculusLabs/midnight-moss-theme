#!/usr/bin/env bash

# Midnight Moss Theme - Main Installer
# Quick installation script for omarchy base installation

set -e

# Colors for output
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print header
echo -e "${CYAN}╔═══════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   🌿 Midnight Moss Theme Installer 🌙        ║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════╝${NC}"
echo ""

# Check if running from correct directory
if [ ! -f "$SCRIPT_DIR/dotfiles/install.sh" ]; then
    echo "Error: Could not find dotfiles/install.sh"
    echo "Please run this script from the midnight-moss-theme directory"
    exit 1
fi

# Display info
echo "This script will install Midnight Moss themes across your system."
echo "Installation directory: $SCRIPT_DIR"
echo ""

# Delegate to the main dotfiles installer
exec "$SCRIPT_DIR/dotfiles/install.sh" "$@"
