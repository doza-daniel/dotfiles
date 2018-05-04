"
" Save this file as
" ~/.vim/after/syntax/cpp/cpp-custom.vim
"

" Less important char
syn match cppLessImportantChars /[{}()\[\];&*.,<>]/
hi def cppLessImportantChars guifg=#889988

" Setting the conceal character for lambdas
syn match cpp11LambdaHead "\[[a-zA-Z0-9&=\s,]*\]\s*(.*)\(\s*{\)\@=" conceal cchar=λ
syn match cpp11LambdaHead "\[[a-zA-Z0-9&=\s,]*\]\(\s*{\)\@=" conceal cchar=λ
syn match cpp11LambdaHead "\[[a-zA-Z0-9&=\s,]*\]\s*(.*)\s*mutable\s*\(\s*{\)\@=" conceal cchar=λ

" Auto keyword is not
syn keyword cpp11Auto auto
hi def link cpp11Auto Type

" C++ Types
syn keyword cppStlTypes uint uint8_t list vector shared_ptr unique_ptr mutex
hi def link cppStlTypes Type

" True and false
syn keyword cppBoolTrue true
hi def link cppBoolTrue BooleanTrue

syn keyword cppBoolFalse false
hi def link cppBoolFalse BooleanFalse

" Misunderstood
syn keyword cppKeyword virtual override nullptr
hi def link cppKeyword Keyword

" Namespace
syn match cppSyntaxNamespaceAccess '[0-9a-zA-Z_]*::'
hi def link cppSyntaxNamespaceAccess Passive

