##############################################################################
# Shell options

shopt -s globstar
shopt -s histappend

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

set -o vi

##############################################################################
# Basic aliases

alias less='less -r'
alias grep='grep --color'
alias open=xdg-open

##############################################################################
# Env vars

EDITOR=nvim

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=5000

##############################################################################
# ripgrep

RIPGREP_CONFIG_PATH=~/.ripgreprc

# --no-ignore is needed due to bugs in how rg treats .gitignore.
# Example .gitignore:
#   sheepdog
# Example path:
#   cmd/sheepdog/main.go
# Example cmd:
#   rg SometingInMain
# This fails to find SometingInMain even though git properly detects changes
alias rg='rg --follow -g "!vendor" -g "!node_modules" --no-ignore'
alias rgsort='rg --follow -g "!vendor" -g "!node_modules" --no-ignore --sort path'
alias rgg='rg --follow --sort path -g "*.go" -g "!vendor" -g "!node_modules" --no-ignore'

##############################################################################
# Development

# Credit Dave Cheney
# https://dave.cheney.net/2016/06/21/automatically-run-your-packages-tests-with-inotifywait
watch() { while inotifywait --exclude .swp -e modify -r .; do "$@"; done; }
