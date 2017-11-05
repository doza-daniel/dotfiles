#!/bin/bash
cd ~
git clone https://github.com/vim/vim.git
cd ~/vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python3-config-dir=/usr/lib/python2.7/config/ \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
sudo make install

cd ~
rm -rf ./vim

