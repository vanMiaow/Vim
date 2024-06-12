vim9script

# quit when a syntax file was already loaded
if ("b:current_syntax"->exists())
	finish
endif

syntax case ignore

syntax match relapNumber display "\v[-+.0-9][-+.de0-9]*"
syntax match relapString "\v\a(\w|-){0,7}"

highlight default link relapNumber Number
highlight relapString guifg=#F5DEB3

syntax match relapComment "\*.*" contains=relapTodo
syntax match relapComment "//.*" contains=relapTodo
syntax match relapTodo display "\v(^|[^#])\zs#\w+" contained
syntax match relapTodo display "\v(^|[^#])\zs#\w+"
syntax match relapDefine "\v^\s*#(define|elif|else|endif|error|if|ifdef|ifndef|import|include|line|pragma|undef|using).*$"
syntax match relapDefine "\v^\s*#(define|elif|else|endif|error|if|ifdef|ifndef|import|include|line|pragma|undef|using).*\\$" nextgroup=relapDefine skipnl
syntax match relapDefine "\v.+$" contained
syntax match relapDefine "\v.+\\$" contained nextgroup=relapDefine skipnl
syntax match relapDefine "\v<_\w+_>"
syntax match relapTitle "\v^\s*\=.*"
syntax match relapEnd "\v^\s*\..*"
syntax match relapCardNumber "\v^\d+(\s|$)" contains=relapComponent
syntax match relapComponent "\v^\d{1,4}(\s|$)" contained
syntax match relapComponent "\v^2080\zs\d{4}\ze(\s|$)" contained
syntax match relapComponent "\v^206\zs\d{4}\ze0(\s|$)" contained
syntax match relapComponent "\v^\zs\d{3}\ze\d{4}(\s|$)" contained
syntax match relapComponent "\v^1\zs\d{4}\ze\d{3}(\s|$)" contained
syntax match relapComponent "\v^6\zs\d{2}\ze\d{5}(\s|$)" contained
syntax match relapComponent "\v^201\zs\d{3}\ze\d{2}(\s|$)" contained
syntax match relapComponent "\v^202\zs\d{3}\ze\d{2}(\s|$)" contained
syntax match relapComponent "\v^205\zs\d{3}\ze\d{2}(\s|$)" contained
syntax match relapComponent "\v^\zs3000\ze\d{4}(\s|$)" contained

highlight relapComment guifg=#808080
highlight default link relapTodo Todo
highlight default link relapDefine Comment
highlight default link relapTitle Statement
highlight default link relapEnd Underlined
highlight default link relapCardNumber Identifier
highlight relapComponent guifg=#FFD700

b:current_syntax = "relap"
