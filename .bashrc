
# thanks timo
export PS1="\[\033[1;36m\]\u\[\033[01;37m\]@\[\033[01;34m\]\h\[\033[01;30m\][\[\033[01;37m\]\w\[\033[01;30m\]]\[\033[01;32m\]\[\033[00m\]+ "

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# MacPorts Installer addition on 2022-06-01_at_20:22:14: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# export MANPATH="/opt/local/share/man:$MANPATH"

#vmNet for Colima / Lima VM
export PATH="/opt/homebrew/opt/socket_vmnet/bin:$PATH"

# Python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# History
# http://lpetr.org/blog/archives/preserve-bash-history
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



# Custom Aliases
# source ~/.custom/init.sh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh