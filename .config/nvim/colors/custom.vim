" Cursor Line
hi CursorLine cterm=bold,underline term=bold,underline ctermbg=none

" don't use background for tab characters
hi SpecialKey ctermbg=none ctermfg=244

" use the background from terminal
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi ColorColumn ctermbg=234

" Autocomplete menu
hi Pmenu ctermbg=16 ctermfg=3 gui=bold
hi PmenuThumb ctermbg=1
hi PmenuSbar ctermbg=11
hi PmenuSel ctermfg=253 ctermbg=232 cterm=bold

" search
hi Search ctermbg=165 ctermfg=232

hi StatusLine ctermbg=4 ctermfg=232 cterm=bold

" Vertical split line doesn't need background
hi VertSplit ctermbg=none ctermfg=242
