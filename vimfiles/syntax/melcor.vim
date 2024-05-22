vim9script

# quit when a syntax file was already loaded
if ("b:current_syntax"->exists())
	finish
endif

syntax case ignore

# modified from fortran.vim
syntax match melcorNumber display "\<\d\+\(_\a\w*\)\=\>"
syntax match melcorFloat display "\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax match melcorFloatIll display "\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syntax region melcorString oneline start='"' end='"' contains=melcorTodo
syntax region melcorStringR oneline start="'" end="'" contains=melcorTodo

highlight default link melcorNumber Number
highlight default link melcorFloat Float
highlight default link melcorFloatIll melcorFloat
highlight melcorString guifg=#F5DEB3
highlight default link melcorStringR melcorString
# end

syntax match melcorComment "!.*" contains=melcorTodo
syntax match melcorComment "//.*" contains=melcorTodo
syntax match melcorTodo display "\v(^|[^#])\zs#\w+" contained
syntax match melcorTodo display "\v(^|[^#])\zs#\w+"
syntax match melcorDefine "\v^\s*#(include|define|undef|if|ifdef|ifndef|elif|else|endif).*$"
syntax match melcorDefine "\v^\s*#(include|define|undef|if|ifdef|ifndef|elif|else|endif).*\\$" nextgroup=melcorDefine skipnl
syntax match melcorDefine "\v.+$" contained
syntax match melcorDefine "\v.+\\$" contained nextgroup=melcorDefine skipnl
syntax match melcorDefine "\v<_\w+_>"
syntax match melcorProgram "\v^(END)?\s*PROGRAM\s+MEL(GEN|COR)"
syntax match melcorCardName "\v^\w+_\w+"
syntax match melcorInput "^\v\w+_INPUT"
syntax match melcorID "^\v\w+_ID"
syntax match melcorExecTitle "EXEC_TITLE" nextgroup=melcorTitle skipwhite
syntax region melcorTitle oneline start='"' end='"' contained
syntax region melcorTitle oneline start="'" end="'" contained
syntax match melcorLineNumber "\v^\s+\d+"

highlight melcorComment guifg=#808080
highlight default link melcorTodo Todo
highlight default link melcorDefine Comment
highlight default link melcorProgram Underlined
highlight default link melcorCardName Identifier
highlight melcorInput guifg=#00BFFF
highlight melcorID guifg=#FFD700
highlight default link melcorExecTitle melcorCardName
highlight default link melcorTitle Statement
highlight melcorLineNumber guifg=cyan

b:current_syntax = "melcor"
