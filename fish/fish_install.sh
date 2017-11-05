#!/bin/bash

if [[ -z `which git` ]]; then
	echo "Please install git!"
	exit 1
fi

echo "INSTALLING FISH SHELL"

cd ~
git clone https://github.com/fish-shell/fish-shell.git fish
cd fish

autoreconf --no-recursive
./configure
make
sudo make install

cd ~
rm -rf ./fish


