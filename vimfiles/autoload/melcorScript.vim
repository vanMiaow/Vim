" Melcor Function

function melcorScript#melcorCount(...)
	if a:0 == 0
		" echo 'All.'
		normal mxHmy
		let s:info = ''
		let s:info = s:info . melcorScript#melcorCount('CV')
		let s:info = s:info . melcorScript#melcorCount('FL')
		let s:info = s:info . melcorScript#melcorCount('HS')
		echo s:info
		normal `yzt`x
	elseif a:0 > 1
		echo 'Error: more than 1 arg.'
	elseif a:1 == 'CV'
		" echo 'CV.'
		return 'CV:' . melcorScript#melcorCountReg("^CV_ID\\s+'.+'(\\s+\\d+)?") . ' ' " CV_ID #CVNAME #ICVNUM
	elseif a:1 == 'FL'
		" echo 'FL.'
		return 'FL:' . melcorScript#melcorCountReg("^FL_ID\\s+'.+'(\\s+\\d+)?") . ' ' " FL_ID #FPNAME #IFPNUM
	elseif a:1 == 'HS'
		" echo 'HS.'
		return 'HS:' . melcorScript#melcorCountReg("^HS_ID\\s+'.+'(\\s+\\d+)?") . ' ' " HS_ID #HSNAME #IHSNUM
	else
		echo 'Error: invalid arg.'
	endif
endfunction

function melcorScript#melcorCountReg(reg)
	" match (any_0)(pattern)(any_1) => (pattern)(!serial_number)
	" do not work with folding
	let s:n = 0
	normal gg
	while 1
		if search('\v' . a:reg, 'W') == 0
			break
		endif
		let s:n = s:n + 1
		execute 's/\v.*(' . a:reg . ').*/\1\!' . s:n . '/'
		" s/\v.*(a:reg).*/\1\!s:n/
		" .*(reg).* -> (reg)!n
	endwhile
	return s:n
endfunction
