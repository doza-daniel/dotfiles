#!/bin/bash

if [ -z `grep doza-daniel/dotfiles .git/config` ]; then
    echo "Move to the root git directory!"
    exit 1
fi

if [[ -z `which curl` ]]; then
    echo "Please install 'curl'."
    exit 1
fi

link_with_backup() {
	local src=$(readlink -f $1)
	local dst=$(readlink -f $2)

	if [ -f $dst ] || [ -d $dst ]; then
		mv $dst $dst.old
	else
		mkdir -p $(dirname $dst)
	fi
	ln -s $src $dst
}

link_with_backup ./vim/vim ~/.vim
link_with_backup ./vim/vimrc ~/.vimrc
link_with_backup ./tmux/tmux.conf ~/.tmux.conf
link_with_backup ./fish/ ~/.config/fish
link_with_backup ./konsole ~/.local/share/konsole


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
