#!/usr/bin/env bash

# Check for Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    sudo softwareupdate -i -a
fi

# Check for Homebrew and install
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade
# Save Homebrew’s installed location.
HOMEBREW_PREFIX=$(brew --prefix)

brew install python@3.12
brew install virtualenv
brew install virtualenvwrapper
echo "Must add export WORKON_HOME=~"/.virtualenvs" and source virtualenvwrapper.sh to .zshrc or .bashrc"
# Using: 
# mkvirtualenv -p python3.12 ENVNAME
# workon ENVNAME


# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${HOMEBREW_PREFIX}/bin/gsha256sum" "${HOMEBREW_PREFIX}/bin/sha256sum"
# Install GnuPG to enable PGP-signing commits.
brew install gnupg
# Install some other useful utilities like `sponge`.
brew install wget #--with-iri
brew install moreutils
brew install tree
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed #--with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2
# Switch to using brew-installed bash as default bash shell
if ! fgrep -q "${HOMEBREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${HOMEBREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  # chsh -s "${HOMEBREW_PREFIX}/bin/bash"; # sticking with zsh
fi
# Install more recent versions of some macOS tools.
brew install vim #--with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp
brew install gnu-tar
# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
# brew install binutils
# brew install binwalk
brew install cifer
# brew install dex2jar
brew install dns2tcp
# brew install fcrackzip
# brew install foremost
brew install hashcat
# brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz
brew install ack
brew install lynx
#Install GIT binaries
brew install git
brew install git-lfs
brew install gs
# Docker binaries
brew install docker
brew install docker-compose
brew install docker-completion
brew install docker-buildx
# Colima (lima linux - small footprint vm's - using for local docker context in liue of Docker Desktop)
brew install colima
# Install Fuzzy Finder (finder for shell commands) https://github.com/junegunn/fzf?tab=readme-ov-file#usage
brew install fzf
${HOMEBREW_PREFIX}/opt/fzf/install
# Mooooo
brew install cowsay
# Install iTerm
brew install --cask --appdir="/Applications" iterm2
brew install ffmpeg
# brew install --cask --appdir="/Applications" multipass
# brew install --cask --appdir="/Applications" visual-studio-code
# brew install --cask --appdir="/Applications" spotify

# Remove outdated versions from the cellar.
brew cleanup


# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Set prelimnary ZSH variables for configuring
ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"

# Oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM}/plugins/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# Theme - powerlevel10k
# To configure, run `p10k configure` or edit ~/.p10k.zsh
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k   
echo "You must set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc"


# Install Fonts
# References: https://github.com/powerline/fonts 
echo "Download and manually install fonts in your OS after..."
mkdir -p "${HOME}/.fonts"
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output ${HOME}/.fonts
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output ${HOME}/.fonts
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output ${HOME}/.fonts
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output ${HOME}/.fonts
cp ${HOME}/.fonts/* $HOME/Library/Fonts/
echo "Select font in iTERM2: Term2 -> Preferences -> Profile > Text -> Font"
echo "Select font in VSCode: settings.json -> "editor.fontFamily": "MesloLGS NF" and "terminal.integrated.fontFamily": "MesloLGS NF""

# iterm2 customization
git clone https://github.com/mbadolato/iTerm2-Color-Schemes ${HOME}/Downloads/iterm2-color-schemes
${HOME}/Downloads/iterm2-color-schemes/tools/import-scheme.sh -v ${HOME}/Downloads/iterm2-color-schemes/schemes/*
rm -rf ${HOME}/Downloads/iterm2-color-schemes
echo "You must restart iterm2 and change your theme at:" 
echo "iTerm2 > Preferences > Profile > Colors > Color Presets -> Import: Argonaut"

echo -#####################################-
echo run ./bootstrap.sh to pull .dot files
echo -#####################################-