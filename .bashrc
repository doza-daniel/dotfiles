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

function setup_fzf() {
    eval $(\
        ghostty +show-config |\
        grep -E '#([A-Za-z]|[0-9])+$' |\
        sed 's/-/_/; s/palette = /palette/; s/ = /=/; s/^/local /'\
    )

    export FZF_DEFAULT_OPTS=" \
        --color=bg:$background,fg:$foreground \
        --color=bg+:$selection_background,fg+:$selection_foreground \
        --color=hl:$palette5,hl+:$palette13 \
        --color=pointer:$background \
        --color=gutter:$background \
        --color=scrollbar:$palette2 \
        --color=spinner:$palette2 \
        --color=header:$palette2 \
        --color=info:$palette2"
}
setup_fzf
unset -f setup_fzf

# opencode
export PATH=/Users/daniel/.opencode/bin:$PATH
