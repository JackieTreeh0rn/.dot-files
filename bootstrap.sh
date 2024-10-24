#!/usr/bin/env bash

# Define the repository URL
REPO_URL="https://github.com/JackieTreeh0rn/.dot-files"
DOTFILES_DIR="$HOME/.dotfiles"

# Clone the repository if it doesn't exist
if [[ ! -d "$DOTFILES_DIR" ]]; then
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    echo "Dotfiles repository already cloned. Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
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
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    syncDotfiles
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        syncDotfiles
    fi
fi

# Determine which shell is in use and source the appropriate configuration
current_shell=$(basename "$SHELL")

if [[ "$current_shell" == "zsh" && -f "$HOME/.zshrc" ]]; then
    source "$HOME/.zshrc"
elif [[ "$current_shell" == "bash" && -f "$HOME/.bashrc" ]]; then
    source "$HOME/.bashrc"
fi

echo "Dotfiles installation complete."