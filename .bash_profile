# Won't switch to zsh ...
export BASH_SILENCE_DEPRECATION_WARNING=1

# Add brew and programs installed by brew to path
eval $(/opt/homebrew/bin/brew shellenv)

# Source git bash scripts for completion and prompt
if command -v xcode-select &>/dev/null; then
    prefix="$(xcode-select -p)/usr/share/git-core"
    if [ -f "${prefix}/git-completion.bash" ]; then
        source "${prefix}/git-completion.bash"
        # needed for completion to work with 'g' alias
        __git_complete g __git_main
    fi

    if [ -f "${prefix}/git-prompt.sh" ]; then
        source "${prefix}/git-prompt.sh"
    fi
fi

# Set prompt: `[user@machine cdir] [git_branch] $`
function set_prompt {
    local bold="\[$(tput bold)\]"
    local normal="\[$(tput sgr0)\]"
    local col00="\[$(tput setaf 0)\]"
    local col01="\[$(tput setaf 1)\]"
    local col02="\[$(tput setaf 2)\]"
    local col03="\[$(tput setaf 3)\]"
    local col04="\[$(tput setaf 4)\]"
    local col05="\[$(tput setaf 5)\]"
    local col06="\[$(tput setaf 6)\]"
    local col07="\[$(tput setaf 7)\]"
    local col08="\[$(tput setaf 8)\]"
    local col09="\[$(tput setaf 9)\]"
    local col10="\[$(tput setaf 10)\]"
    local col11="\[$(tput setaf 11)\]"
    local col12="\[$(tput setaf 12)\]"
    local col13="\[$(tput setaf 13)\]"
    local col14="\[$(tput setaf 14)\]"
    local col15="\[$(tput setaf 15)\]"

    PS1="${bold}"
    PS1+="${col01}[${col03}\u${col02}@${col04}\h ${col05}\W${col01}] "

    if command -v __git_ps1 &> /dev/null; then
        export GIT_PS1_SHOWDIRTYSTATE=1
        PS1+="$(__git_ps1 "${col01}[${col03}%s${col01}]") "
    fi

    PS1+="${col07}\\$"
    PS1+="${normal} "
}

PROMPT_COMMAND="set_prompt"

# Disable ctrl-s and ctrl-q.
stty -ixon

# Eternal bash history.
# when exiting bash, don't override history file with current session's history
shopt -s histappend
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# Change the file location because certain bash sessions truncate .bash_history
# file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Set EDITOR to neovim if exists, else try vim
if [ -x "$(command -v nvim)" ]; then
    export EDITOR=$(command -v nvim)
elif [ -x "$(command -v vim)" ]; then
    export EDITOR=$(command -v vim)
fi

# Set locale
export LC_ALL="en_US.UTF-8"

# Additional path elements
export PATH="$HOME/.local/bin/:$PATH"

# Set aliases
alias ls="ls -G"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias v="$EDITOR"
alias g="git"
alias f="vifm"