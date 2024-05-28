" Set leader to space bar
let mapleader="\<SPACE>"

" Syntax Highlighting
syntax on

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

" Display whitespaces (trailing and tabs)
set list listchars=trail:·,tab:>-

" Set line numbers visible
set number
set relativenumber
set cursorline

" Indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Searching options
set hlsearch
set incsearch
set ignorecase
set smartcase

" No delay going in normal mode
set ttimeoutlen=10

" Enable mouse (useful for resizing splits)
set mouse=a

" Convenient {} placement
imap {<CR> {<CR>}<Esc>O

" Hide netrw banner and work like a tree
let g:netrw_banner=0
let g:netrw_liststyle=3

" Complete menu while typing ex commands
set wildmenu
set wildoptions=pum,fuzzy
