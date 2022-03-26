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
source $HOME/.config/nvim/colors/custom.vim

" autocomplete menu
set completeopt-=preview
set pumheight=10

" Display trailing spaces
set list
set listchars=trail:·,tab:>-

" Set line numbers visible
set number
set relativenumber
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

" No delay going in normal mode
set ttimeoutlen=10

" StatusLine
set laststatus=2
set statusline=%{StatuslineMode()}\ %t%m%r%=line:\ %l\ col:\ %c\ %y
set noshowmode

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "[NORMAL]"
  elseif l:mode==?"v"
    return "[VISUAL]"
  elseif l:mode==#"i"
    return "[INSERT]"
  elseif l:mode==#"R"
    return "[REPLACE]"
  elseif l:mode==?"s"
    return "[SELECT]"
  elseif l:mode==#"t"
    return "[TERMINAL]"
  elseif l:mode==#"c"
    return "[COMMAND]"
  elseif l:mode==#"!"
    return "[SHELL]"
  endif
endfunction

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

" Convenient {} placement
imap {<CR> {<CR>}<Esc>O

" browse
nmap <Leader>t <ESC>:e.<CR>
let g:netrw_banner = 0
let g:netrw_liststyle=3

source ~/.config/nvim/plugins.vim
