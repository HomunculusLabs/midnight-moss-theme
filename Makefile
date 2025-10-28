# Midnight Moss Theme - Makefile
# Provides standardized installation targets for omarchy base installation

.PHONY: help install install-all install-terminals install-editors install-tools uninstall clean test list

# Default target
help:
	@echo "Midnight Moss Theme - Installation Targets"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Main Targets:"
	@echo "  install          - Interactive installation (default applications)"
	@echo "  install-all      - Install all available themes"
	@echo "  install-terminals - Install terminal emulator themes only"
	@echo "  install-editors  - Install code editor themes only"
	@echo "  install-tools    - Install terminal tool themes only"
	@echo "  uninstall        - Remove installed themes"
	@echo "  list             - List available installation targets"
	@echo "  test             - Run installation in dry-run mode"
	@echo "  clean            - Remove backup files"
	@echo ""
	@echo "Examples:"
	@echo "  make install                    # Interactive installation"
	@echo "  make install-all                # Install everything"
	@echo "  make install TARGETS=vim,tmux   # Install specific applications"
	@echo "  make test                       # Preview what would be installed"
	@echo ""

# Main installation - interactive mode
install:
	@./install.sh

# Install all available themes
install-all:
	@./install.sh --all --yes

# Install only terminal emulator themes
install-terminals:
	@./install.sh --targets alacritty,kitty,iterm2 --yes

# Install only code editor themes
install-editors:
	@./install.sh --targets vim,neovim,vscode,sublime,jetbrains --yes

# Install only terminal tool themes
install-tools:
	@./install.sh --targets tmux,zellij,zsh,starship --yes

# Custom target installation (use: make install TARGETS=vim,tmux,zsh)
ifdef TARGETS
install:
	@./install.sh --targets $(TARGETS) --yes
endif

# Uninstall themes
uninstall:
	@./dotfiles/uninstall.sh

# List available targets
list:
	@./install.sh --list-targets

# Test installation (dry-run)
test:
	@echo "Running installation test (dry-run mode)..."
	@./install.sh --dry-run

# Clean backup files
clean:
	@echo "Removing backup files..."
	@rm -rf ~/.midnight-moss-backups/
	@echo "Backup files removed."

# Development targets
.PHONY: check-files validate

# Check that all expected theme files exist
check-files:
	@echo "Checking theme files..."
	@errors=0; \
	for dir in alacritty firefox iterm2 jetbrains kitty neovim obsidian starship sublime-text tmux vim vscode zellij zsh; do \
		if [ ! -d "$$dir" ]; then \
			echo "❌ Missing directory: $$dir"; \
			errors=$$((errors+1)); \
		fi; \
	done; \
	if [ $$errors -eq 0 ]; then \
		echo "✓ All theme directories present"; \
	else \
		echo "✗ Found $$errors missing directories"; \
		exit 1; \
	fi

# Validate PKGBUILD
validate:
	@echo "Validating PKGBUILD..."
	@if command -v namcap >/dev/null 2>&1; then \
		cd arch-package && namcap PKGBUILD; \
	else \
		echo "⚠ namcap not installed, skipping PKGBUILD validation"; \
		echo "  Install with: sudo pacman -S namcap"; \
	fi
