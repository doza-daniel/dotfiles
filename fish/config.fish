set -x EDITOR /usr/bin/vim

set -x GIT_TERMINAL_PROMPT 1

set -x GOROOT /usr/local/go
set -x GOPATH /home/daniel/GoWorkspace

set -x PATH $GOPATH $PATH
set -x PATH $GOROOT/bin $PATH
set -x PATH $GOPATH/bin $PATH

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
