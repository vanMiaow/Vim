" quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

syn match relapComment '\*.*'
syn match relapTitle '=.*'
syn match relapCardNumber '^\d\+'

hi relapComment guifg=#808080
hi def link relapTitle      Statement
hi def link relapCardNumber Identifier

let b:current_syntax = "relap"
