# thanks timo
export PS1="\[\033[1;36m\]\u\[\033[01;37m\]@\[\033[01;34m\]\h\[\033[01;30m\][\[\033[01;37m\]\w\[\033[01;30m\]]\[\033[01;32m\]\[\033[00m\]+ "


# History
# http://lpetr.org/blog/archives/preserve-bash-history
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# PATHs
# Add `~/bin` to the `$PATH`
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# GNU core utilities update from brew
export $(brew --prefix coreutils)/libexec/gnubin:$PATH
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
#vmNet for Colima / Lima VM
export PATH="/opt/homebrew/opt/socket_vmnet/bin:$PATH"
# Python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
# MacPorts
# export MANPATH="/opt/local/share/man:$MANPATH"


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Custom Aliases
# source ~/.custom/init.sh

# import custom completions import that are placed here by utilities
fpath+=~/.zfunc; autoload -Uz compinit; compinit

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh