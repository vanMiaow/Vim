" Simmer Function

" TODO catch error?

function simmerScript#simmerProcessText(i, j)
	execute '%s/\v.*\(\s+' . a:i . ',\s+' . a:j . ',\s+(\S+)\).*/\1/g'
	execute '%s/\v.*\(.*\).*\n//g'
	execute '%s/\vT\=(\S+\s+){2}(\S+)SECONDS\."\n.*\n/\2  /g'
	execute '%s/\v(^$\n|\n^$)//g'
endfunction

function simmerScript#simmerProcessData()
	execute '%s/\vTIME\s+(\S+)SECONDS\."\zs/,SOLUTIONTIME=\1/g'
endfunction
