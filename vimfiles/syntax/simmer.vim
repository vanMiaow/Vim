" quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

syn case ignore

" refer to fortran.vim
syn match simmerNumber display "\<\d\+\(_\a\w*\)\=\>"
syn match simmerFloat display "\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match simmerFloatIll display "\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
syn match simmerFloatIll display "\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match simmerFloatIll display "\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match simmerFloatIll display "\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn region simmerString start=+"+ end=+"+
syn region simmerStringR start=+'+ end=+'+

hi def link simmerNumber Number
hi def link simmerFloat Float
hi def link simmerFloatIll simmerFloat
hi simmerString guifg=#F5DEB3
hi def link simmerStringR simmerString
" end

" todo simmerComment
"      simmerOperator?

syn match simmerPreStart '^' nextgroup=simmerStart skipwhite
syn match simmerStart '\(RE\)\?START' contained nextgroup=simmerTitle skipwhite
syn match simmerTitle '.*' contained
syn match simmerNamelistStart '&\w\+'
syn match simmerNamelistEnd '\/'

hi def link simmerStart Underlined
hi def link simmerTitle Statement
hi def link simmerNamelistStart Identifier
hi def link simmerNamelistEnd Comment

let b:current_syntax = "simmer"
