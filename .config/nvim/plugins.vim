let plugpath = fnamemodify(resolve(expand('<sfile>:p')), ':h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim')

Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

set shortmess+=c
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#auto_complete = 1
inoremap <expr><C-j> pumvisible()? "\<C-n>" : "\<C-j>"
inoremap <expr><TAB> pumvisible()? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k> pumvisible()? "\<C-p>" : "\<C-k>"

let g:livepreview_previewer = 'zathura'

" Vim-go
" use goimports for formatting
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

nmap <Leader>t <ESC>:e.<CR>
nmap <C-p> <ESC>:FZF<CR>
