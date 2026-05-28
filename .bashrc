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
alias shd="cd $HOME/Documents/projects/wfm/shredder/"
alias sapi="cd $HOME/Documents/projects/wfm/storage-api/"
alias v2="cd $HOME/Documents/projects/wfm/tymeshift-laravel-app/"
alias gctx='kubectl config get-contexts -o name | grep gke | fzf | ( read ctx; kubectl config use-context $ctx )'
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

# Added by `rbenv init` on Mon Sep  2 16:07:02 CEST 2024
eval "$(rbenv init - --no-rehash bash)"

# BEGIN KUBECTL CONFIG
source "$ZENDESK_CODE_DIR/kubectl_config/dotfiles/kubectl_stuff.bash"
# END KUBECTL CONFIG

# BEGIN SCOOTER
export SCOOTER_KUBERNETES_CONTEXT="scooter-euw1-1"
export SCOOTER_PROFILE="devs/wfm"
source "$ZENDESK_CODE_DIR/scooter/scripts/shell/scooter.sh"
# END SCOOTER

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
