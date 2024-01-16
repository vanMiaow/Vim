vim9script

# quit when a syntax file was already loaded
if ("b:current_syntax"->exists())
	finish
endif

syntax case ignore

# refer to fortran.vim
syntax match melcorNumber display "\<\d\+\(_\a\w*\)\=\>"
syntax match melcorFloat display "\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax region melcorString start=+"+ end=+"+ contains=melcorTodo
syntax region melcorStringR start=+'+ end=+'+ contains=melcorTodo

highlight default link melcorNumber Number
highlight default link melcorFloat Float
highlight default link melcorFloatIll melcorFloat
highlight melcorString guifg=#F5DEB3
highlight default link melcorStringR melcorString
# end

syntax match melcorComment '!.*' contains=melcorTodo
syntax match melcorTodo display '#\w*' contained
syntax match melcorTodo display '#\w*'
syntax match melcorProgram '^\(END\)\?\s*PROGRAM\s\+MEL\(GEN\|COR\)'
syntax match melcorCardName '^\w\+_\w\+'
syntax match melcorInput '^\w\+_INPUT'
syntax match melcorID '^\w\+_ID'
syntax match melcorExecTitle 'EXEC_TITLE' nextgroup=melcorTitle skipwhite
syntax region melcorTitle start=+"+ end=+"+ contained
syntax region melcorTitle start=+'+ end=+'+ contained
syntax match melcorLineNumber '^\s\+\d\+'

highlight melcorComment guifg=#808080
highlight default link melcorTodo Todo
highlight default link melcorProgram Underlined
highlight default link melcorCardName Identifier
highlight melcorInput guifg=#00BFFF
highlight melcorID guifg=#FFD700
highlight default link melcorExecTitle melcorCardName
highlight default link melcorTitle Statement
highlight melcorLineNumber guifg=cyan

b:current_syntax = "melcor"
