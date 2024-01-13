" General Function

function general#Test()
	echo 'Test.'
endfunction

function general#Trim()
	normal mxHmy
	if search('\v\s+$') == 0
		echo 'No trail.'
	else
		execute '%s/\v\s+$//g'
		echo 'Done.'
	endif
	normal `yzt`x
endfunction

function general#TrimLine()
	normal mx0
	if search('\v\s+$', 'c', line('.')) == 0
		echo 'No trail.'
	else
		execute 's/\v\s+$//'
		echo 'Done.'
	endif
	normal `x
endfunction
