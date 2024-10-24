# Dotfiles Repository

This repository contains my personal configuration files and setup scripts for macOS. It helps automate the installation and configuration of various tools and settings to create a consistent development environment.

## Setup


### Scripts

- **`setup.sh`**: This script installs essential tools and applications using Homebrew. It sets up the environment with the necessary software and configurations.

  - **Usage**: Run `setup.sh` to install and configure the environment.

- **`bootstrap.sh`**: This script synchronizes your dotfiles from the repository to your home directory.

  - **Usage**: Run `bootstrap.sh` to sync your dotfiles and install fonts.

## Features

- **Tool Installation**: Installs a variety of tools and utilities using Homebrew, such as Python, GNU core utilities, Docker, and more.
- **Zsh Configuration**: Sets up Oh My Zsh with plugins and themes, including Powerlevel10k.
- **Font Installation**: Automatically installs fonts used by Oh-My-Zsh and Vscode, iTerm2, etc.
- **iTerm2 Customization**: Includes color schemes for iTerm2.

## Screenshot

![Terminal Screenshot](screenshot.png)

*This screenshot shows the terminal appearance after running the setup scripts.*


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to customize this `README.md` to better suit your needs or to provide additional information specific to your setup.