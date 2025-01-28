# Set aliases
alias ls="ls -G"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias v="$EDITOR"
alias g="git"
alias f="vifm"
alias dotf="cd $HOME/dotfiles/"
alias wfm="cd $HOME/Documents/projects/wfm/"
alias aat="cd $HOME/Documents/projects/wfm/aat-processor/"
alias rts="cd $HOME/Documents/projects/wfm/rts/"
alias wss="cd $HOME/Documents/projects/wfm/websocket-service/"
alias wss="cd $HOME/Documents/projects/wfm/websocket-service/"
alias adh="cd $HOME/Documents/projects/wfm/adherence/"
alias ssp="cd $HOME/Documents/projects/wfm/snappy-stream-processor/"
alias twf="cd $HOME/Documents/projects/wfm/temporal-workflows/"
alias uas="cd $HOME/Documents/projects/wfm/uas/"
alias sapi="cd $HOME/Documents/projects/wfm/storage-api/"
alias v2="cd $HOME/Documents/projects/wfm/tymeshift-laravel-app/"

# Source git bash scripts for completion and prompt
if command -v xcode-select &>/dev/null; then
    prefix="$(xcode-select -p)/usr/share/git-core"
    if [ -f "${prefix}/git-completion.bash" ]; then
        source "${prefix}/git-completion.bash"
        # needed for completion to work with 'g' alias
        __git_complete g __git_main
    fi

    if [ -f "${prefix}/git-prompt.sh" ]; then
        # export all functions from git-prompt.sh script to subshells
        source "${prefix}/git-prompt.sh"
    fi
fi

# FZF bash completion and history
if command -v fzf &>/dev/null; then
    set -a
    eval "$(fzf --bash)"
    set +a
fi

