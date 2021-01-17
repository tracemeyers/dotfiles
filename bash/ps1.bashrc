#!/bin/bash

if [ -f /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-prompt.sh
fi

set_prompt () {
    Last_Command=$? # Must come first!

    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    Checkmark='\342\234\223'

    PS1="$White"

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command != 0 ]]; then
        # Add a bright white exit status for the last command
        PS1+="$Red(\$?) "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h"
    else
        PS1+="$Green\\u@\\h"
    fi
    PS1+="$Red$(__git_ps1) "
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w$Reset "

    PS1+="$(date +%T) "
    PS1+="\n\$ "
}

PROMPT_COMMAND='set_prompt'
