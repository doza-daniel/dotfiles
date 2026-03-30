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

# FZF catpuccin-mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# FZF catpuccin-latte
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39 \
# --color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 \
# --color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 \
# --color=selected-bg:#BCC0CC \
# --color=border:#9CA0B0,label:#4C4F69"

# FZF catpuccin-frappe
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
# --color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
# --color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
# --color=selected-bg:#51576D \
# --color=border:#737994,label:#C6D0F5"
