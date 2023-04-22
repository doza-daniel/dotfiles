# Disable ctrl-s and ctrl-q.
stty -ixon


# history
HISTSIZE= HISTFILESIZE= # Infinite history
export HISTCONTROL=ignoredups:erasedups # avoid duplicates
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" # After each command, save and reload history

# set default editor
export EDITOR='/usr/local/bin/nvim'

# append history entries..
shopt -s histappend

# locale
export LC_CTYPE=C
export LC_ALL="en_US.UTF-8"

# golang
export GOPATH="$HOME/go"
export GOPRIVATE=*.sbgenomics.com
export PATH="$PATH:$GOPATH/bin"

# additional path elements
export PATH="$HOME/.scripts/:$PATH"
export PATH="/Users/daniel/.local/bin:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"

# aliases
alias ls='ls -G'
alias grep='grep --color=auto'
alias ll='ls -la'
alias vim='nvim'
alias v='nvim'
alias g='git'
alias r='vifm'

# function for showing info about a git repo in the prompt
function git_prompt {
    dotfile_repo=$(git remote -v 2> /dev/null | grep 'doza-daniel/dotfiles')
    git_branch=$(git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    is_dirty=$(git status -s --ignore-submodules=dirty 2> /dev/null)

    [ "$is_dirty" ] && git_branch="$git_branch*"

    [ $git_branch ] && printf '\001%s\002[\001%s\002%s\001%s\002]\001%s\002' "$(tput setaf 1)" "$(tput setaf 3)" "$git_branch" "$(tput setaf 1)" "$(tput sgr0)"
}

# prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]] \$(git_prompt)\[$(tput bold)\]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# won't switch to zsh ...
export BASH_SILENCE_DEPRECATION_WARNING=1

# brew completions for bash
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
  complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
fi

