#!/usr/bin/env bash

mkdir -p ~/backups


xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update


brew install python@3.12
mkvirtualenv --python3.12=/usr/local/bin/python3.12 py3.12-data
workon py3.12-data


brew install cask
brew install --cask iterm2

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# brew install --appdir="/Applications" awscli@2
# brew install --appdir="/Applications" jq
# brew install --appdir="/Applications" wget
# brew install --appdir="/Applications" go
# brew install --appdir="/Applications" kubernetes-cli
# brew install --appdir="/Applications" sshuttle
# brew install --cask --appdir="/Applications" multipass
# brew install --cask --appdir="/Applications" colima
# brew install --cask --appdir="/Applications" visual-studio-code
# brew install --cask --appdir="/Applications" spotify
brew install --cask --appdir="/Applications" docker
brew install --appdir="/Applications" docker-compose
brew install --appdir="/Applications" docker-completion
brew install --appdir="/Applications" docker-buildx


# brew tap hashicorp/tap
# brew install hashicorp/tap/terraform
# brew upgrade hashicorp/tap/terraform


# install font
echo "download, install this font and set on iterm2 at Term2 > Preferences > Profile > Text > Font" 
echo 'https://github.com/powerline/fonts/raw/master/Inconsolata/Inconsolata%20Bold%20for%20Powerline.ttf'


# powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k   
echo "set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc"

# iterm2 customization
git clone https://github.com/mbadolato/iTerm2-Color-Schemes ~/Downloads/iterm2-color-schemes
~/Downloads/iterm2-color-schemes/tools/import-scheme.sh -v ~/Downloads/iterm2-color-schemes/schemes/*
rm -rf ~/Downloads/iterm2-color-schemes

echo "restart iterm2 and change your theme at:" 
echo "iTerm2 > Preferences > Profile > Colors > Color Presets -> Import: Argonaut"

# dotfiles
# get vim config
curl --silent https://raw.githubusercontent.com/JackieTreeh0rn/.dot-files/refs/heads/main/.vimrc --output ~/.vimrc

# get vim colors
curl --silent https://github.com/JackieTreeh0rn/.dot-files/blob/main/.vim/colors/molokai.vim --create-dirs --output ~/.vim/colors/molokai.vim

# get zsh config
curl --silent https://raw.githubusercontent.com/JackieTreeh0rn/.dot-files/refs/heads/main/.zshrc --output ~/.zshrc

# get zsh powerlevel10k.zsh-theme
curl --silent https://raw.githubusercontent.com/JackieTreeh0rn/.dot-files/refs/heads/main/.oh-my.zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme --create-dirs --output ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme


# brew install --appdir="/Applications" fzf
# /usr/local/opt/fzf/install
# source ~/.zshrc
