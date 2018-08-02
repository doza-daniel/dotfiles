set -x EDITOR /usr/bin/vim

set -x GIT_TERMINAL_PROMPT 1

set -x GOPATH /home/daniel/GoLang
set -x GOROOT /usr/local/go

set -x PATH $GOPATH $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $GOROOT/bin $PATH

function :q
    exit
end

function :qall
    tmux kill-pane -a
    tmux kill-window
end

function gti
    git $argv[1..-1]
end


function goplay
    set -l dir "/tmp/goplay"(date +%N)
    mkdir -p $dir
    vim $dir/main.go
end
