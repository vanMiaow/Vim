" quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

syn case ignore

" refer to fortran.vim
syn match melcorNumber display "\<\d\+\(_\a\w*\)\=\>"
syn match melcorFloat display "\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match melcorFloatIll display "\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
syn match melcorFloatIll display "\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match melcorFloatIll display "\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match melcorFloatIll display "\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn region melcorString start=+"+ end=+"+ contains=melcorTodo
syn region melcorStringR start=+'+ end=+'+ contains=melcorTodo

hi def link melcorNumber Number
hi def link melcorFloat Float
hi def link melcorFloatIll melcorFloat
hi melcorString guifg=#F5DEB3
hi def link melcorStringR melcorString
" end

syn match melcorComment '!.*' contains=melcorTodo
syn match melcorTodo display '#\w*' contained
syn match melcorTodo display '#\w*'
syn match melcorProgram '^\(END\)\?\s*PROGRAM\s\+MEL\(GEN\|COR\)'
syn match melcorCardName '^\w\+_\w\+'
syn match melcorInput '^\w\+_INPUT'
syn match melcorID '^\w\+_ID'
syn match melcorExecTitle 'EXEC_TITLE' nextgroup=melcorTitle skipwhite
syn region melcorTitle start=+"+ end=+"+ contained
syn region melcorTitle start=+'+ end=+'+ contained
syn match melcorLineNumber '^\s\+\d\+'

hi melcorComment guifg=#808080
hi def link melcorTodo Todo
hi def link melcorProgram Underlined
hi def link melcorCardName Identifier
hi melcorInput guifg=#00BFFF
hi melcorID guifg=#FFD700
hi def link melcorExecTitle melcorCardName
hi def link melcorTitle Statement
hi melcorLineNumber guifg=cyan

let b:current_syntax = "melcor"
