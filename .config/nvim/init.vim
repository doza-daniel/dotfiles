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
colorscheme gruvbox

hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

" autocomplete menu
set completeopt-=preview
set completeopt+=noinsert
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

" Plugins

call plug#begin('~/.config/nvim')

Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'

call plug#end()

" vim-go: start
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

map <C-u> <Esc>:GoDecls<CR>
" vim-go: end

" ale: start
let g:ale_completion_enabled = 1
let g:ale_linters = {
  \ 'go': ['gopls'],
  \}
" ale: end

" vimtex: start
let g:vimtex_view_method = 'zathura'
let g:vimtex_mappings_enabled = 0
let g:vimtex_imaps_enabled = 0
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]

filetype plugin indent on

imap c1 ć
imap ch č
imap zh ž
imap sh š
imap dy đ

imap C1 Ć
imap Ch Č
imap Zh Ž
imap Sh Š
imap Dy Đ
" vimtex: end

set shortmess+=c
inoremap <expr><C-j> pumvisible()? "\<C-n>" : "\<C-j>"
inoremap <expr><TAB> pumvisible()? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k> pumvisible()? "\<C-p>" : "\<C-k>"

nmap <C-p> <ESC>:FZF<CR>
"foobar
