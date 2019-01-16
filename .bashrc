stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ll='ls -la'
alias vim='nvim'
alias v='nvim'
alias g='git'

function git_prompt {
    dotfile_repo=$(git remote -v 2> /dev/null | grep 'doza-daniel/dotfiles\.git')
    [ "$dotfile_repo" ] && return
    git_branch=$(git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    is_dirty=$(git status -s --ignore-submodules=dirty 2> /dev/null)

    [ "$is_dirty" ] && git_branch="$git_branch*"

    [ $git_branch ] && printf '\001%s\002[\001%s\002%s\001%s\002]\001%s\002' "$(tput setaf 1)" "$(tput setaf 3)" "$git_branch" "$(tput setaf 1)" "$(tput sgr0)"
}

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]] \$(git_prompt)\[$(tput bold)\]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

