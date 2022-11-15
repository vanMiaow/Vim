" General Function

function generalScript#test()
	echo 'Test.'
endfunction

function generalScript#trim()
	normal mxHmy
	if search('\v\s+$') == 0
		echo 'No trail.'
	else
		execute '%s/\v\s+$//g'
		echo 'Done.'
	endif
	normal `yzt`x
endfunction

function generalScript#trimLine()
	normal mx0
	if search('\v\s+$', 'c', line('.')) == 0
		echo 'No trail.'
	else
		execute 's/\v\s+$//'
		echo 'Done.'
	endif
	normal `x
endfunction
