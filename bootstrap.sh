#!/usr/bin/env bash

# Define the repository URL
REPO_URL="https://github.com/JackieTreeh0rn/.dot-files"
DOTFILES_DIR="$HOME/.dotfiles"

# Clone the repository if it doesn't exist
if [[ ! -d "$DOTFILES_DIR" ]]; then
    if ! git clone "$REPO_URL" "$DOTFILES_DIR"; then
        echo "Failed to clone the repository. Please check your network connection and access rights."
        exit 1
    fi
else
    echo "Dotfiles repository already cloned. Pulling latest changes..."
    if ! git -C "$DOTFILES_DIR" pull; then
        echo "Failed to pull the latest changes. Please check your network connection and access rights."
        exit 1
    fi
fi

# Function to sync dotfiles
function syncDotfiles() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude "bootstrap.sh" \
        --exclude "setup.sh" \
        --exclude "README.md" \
        -avh --no-perms "$DOTFILES_DIR/" "$HOME/"
}

# Prompt for confirmation
if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
    syncDotfiles
    SYNCED=true
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        syncDotfiles
        SYNCED=true
    else
        SYNCED=false
    fi
fi

# Only source configuration if files were synced
if [ "$SYNCED" = true ]; then
    # Source .zshrc if running in Zsh
    if [ -n "$ZSH_VERSION" ] && [ -f "$HOME/.zshrc" ]; then
        source "$HOME/.zshrc"
    elif [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
    fi
fi

echo "Dotfiles installation complete."