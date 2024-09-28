#!/usr/bin/env bash

mkdir -p ~/backups

# Xcode cmdline tools
xcode-select --install

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update


brew install python@3.12
# mkvirtualenv --python3.12=/usr/local/bin/python3.12 py3.12-data
# workon py3.12-data


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
fi;
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
/opt/homebrew/opt/fzf/install
# Mooooo
brew install cowsay
# Install iTerm
brew install --cask --appdir="/Applications" iterm2
# brew install --cask --appdir="/Applications" multipass
# brew install --cask --appdir="/Applications" visual-studio-code
# brew install --cask --appdir="/Applications" spotify

# Remove outdated versions from the cellar.
brew cleanup


# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerlevel10k Theme
# To configure, run `p10k configure` or edit ~/.p10k.zsh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k   
echo "set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc"


# Install Fonts
# References: https://github.com/powerline/fonts 
echo "Download and manually install fonts in your OS after..."
echo "Install iTERM2: Term2 -> Preferences -> Profile > Text -> Font"
echo "Install VSCode: settings.json -> "editor.fontFamily": "MesloLGS NF" and "terminal.integrated.fontFamily": "MesloLGS NF""
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output ~/Downloads
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output ~/Downloads
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output ~/Downloads
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output ~/Downloads
curl --silent https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output ~/Downloads


# iterm2 customization
git clone https://github.com/mbadolato/iTerm2-Color-Schemes ~/Downloads/iterm2-color-schemes
~/Downloads/iterm2-color-schemes/tools/import-scheme.sh -v ~/Downloads/iterm2-color-schemes/schemes/*
rm -rf ~/Downloads/iterm2-color-schemes
echo "Restart iterm2 and change your theme at:" 
echo "iTerm2 > Preferences > Profile > Colors > Color Presets -> Import: Argonaut"


# # dotfiles
# # get vim config
# curl --silent https://raw.githubusercontent.com/JackieTreeh0rn/.dot-files/refs/heads/main/.vimrc --output ~/.vimrc

# # get vim colors
# curl --silent https://github.com/JackieTreeh0rn/.dot-files/blob/main/.vim/colors/molokai.vim --create-dirs --output ~/.vim/colors/molokai.vim

# # get zsh config
# curl --silent https://raw.githubusercontent.com/JackieTreeh0rn/.dot-files/refs/heads/main/.zshrc --output ~/.zshrc

# # get and apply zsh powerlevel10k.zsh-theme
# curl --silent https://raw.githubusercontent.com/JackieTreeh0rn/.dot-files/refs/heads/main/.oh-my.zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme --create-dirs --output ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme


# source final shell .dot config
source ~/.zshrc

