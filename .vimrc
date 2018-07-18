" Nice try Vi
set nocompatible

so ~/.vim/plugins.vim

let mapleader="\<SPACE>"
set shell=bash

" Vsplits show up on right
set splitright

" Turn on syntax coloring
syntax on

" Colors
set t_Co=256
set background=dark
colorscheme jellybeans
hi CursorLine cterm=bold,underline term=bold,underline ctermbg=none

" don't use background for tab characters
hi SpecialKey ctermbg=none ctermfg=244

" use the background from terminal
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi ColorColumn ctermbg=234

" autocomplete menu
set cot="menuone"
hi Pmenu ctermbg=16 ctermfg=3 gui=bold
hi PmenuThumb ctermbg=1
hi PmenuSbar ctermbg=11
hi PmenuSel ctermfg=253 ctermbg=232 cterm=bold
set pumheight=5

" search
hi Search ctermbg=165 ctermfg=232


" Display trailing spaces
set list listchars=trail:·,tab:>-

" Set line numbers visible
set number
set rnu
set cursorline

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
autocmd FileType make set nolist


" No delay going in normal mode
set ttimeoutlen=10


nmap <Leader>t <ESC>:NERDTreeToggle<CR>

set wildignore+=*.o,*.obj,build,build-*,.*.swp,.*.swo

