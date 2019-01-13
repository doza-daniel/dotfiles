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

Plug 'scrooloose/nerdTree'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go'

call plug#end()

" PLUGIN SETTINGS
" YCM Settings
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_key_list_select_completion = ['<TAB>','<Down>','<c-j>']
let g:ycm_key_list_previous_completion = ['<Up>','<c-k>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_use_ultisnips_completer = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'haskell' : ['.']
  \ }

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

nmap <Leader>t <ESC>:NERDTreeToggle<CR>
nmap <C-p> <ESC>:FZF<CR>
