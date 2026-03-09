# Set aliases
alias ls="ls -G"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias v="$EDITOR"
alias g="git"
alias f="vifm"
alias dotf="cd $HOME/dotfiles/"
alias gco="g br --format '%(refname)' | sed 's,refs/heads/,,' | fzf | xargs git checkout"

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
