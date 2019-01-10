" Nice try Vi
set nocompatible

let mapleader="\<SPACE>"

" Turn on syntax coloring
syntax on

set shell=bash

" Vsplits show up on right
set splitright

" Colors
set t_Co=256
set background=dark
colorscheme jellybeans

" autocomplete menu
set cot="menuone"
set pumheight=5

" Display trailing spaces
set list listchars=trail:·,tab:>-

" Set line numbers visible
set number
set rnu
set cursorline

" Searching options
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation
set autoindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" don't show tabs in makefiles
autocmd FileType make set nolist

" No delay going in normal mode
set ttimeoutlen=10

set laststatus=1

" Tabs
map <Leader>n <Esc>:tabnext<CR>
map <Leader>p <Esc>:tabprev<CR>
map <Leader>N <Esc>:tabnew<CR>

" buffers
map <Leader>l <Esc>:bn<CR>
map <Leader>h <Esc>:bp<CR>

" Windows
" Switch windows
map , <Esc>:wincmd w<CR>

" Resize vsplits
map = <Esc>:wincmd ><CR>
map - <Esc>:wincmd <<CR>

" Resize hsplits
map + <Esc>:wincmd +<CR>
map _ <Esc>:wincmd -<CR>

" Make
map <Leader>m <Esc>:make<CR>

" Convenient {} placement
imap {<CR> {<CR>}<Esc>O

so ./plugins.vim
so ./colors/custom.vim