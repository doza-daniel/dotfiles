" Nice try Vi
set nocompatible

so ~/.vim/plugins.vim

set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar

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
highlight ColorColumn ctermbg=234
" autocomplete menu
hi Pmenu ctermbg=black ctermfg=white gui=bold
set cot="menuone"
" search
hi Search ctermbg=165 ctermfg=232


" Display trailing spaces
set list listchars=trail:·,tab:>-

" Set line numbers visible
set number
set rnu
set cursorline

" Saving and Esc
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>

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

