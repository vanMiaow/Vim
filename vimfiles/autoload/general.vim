vim9script

export def ValidateRange(
		range: list<number>
	): list<number>
	# validate given range to
	#  1) entire buffer, if begin invalid, or
	#  2) line begin, if begin valid and end invalid, or
	#  3) line(s) between begin and end, if both are valid
	#     alse swap if begin > end

	# init range
	var rangeMin: number = 1
	var rangeMax: number = line("$")
	# validate range
	if (range[0] < rangeMin || range[0] > rangeMax)
		# begin invalid, range is entire buffer
		range[0] = rangeMin
		range[1] = rangeMax
	elseif (range[1] < rangeMin || range[1] > rangeMax)
		# begin valid, end invalid, range is begin line
		range[1] = range[0]
	elseif (range[0] > range[1])
		# begin & end valid, range is begin-end line(s)
		# swap if begin > end
		var rangeSwap: number = range[0]
		range[0] = range[1]
		range[1] = rangeSwap
	endif
	# return validated range
	return range
enddef

export def ProcessLines(
		Process: func(number): void,
		pattern: string,
		range:   list<number>
	): number
	# process pattern in given validated range

	# init count
	var count: number = 0
	# save current position
	var save_pos: dict<number> = winsaveview()
	# set cursor to begin line 1st column
	[0, range[0], 1, 0, 0]->setpos(".")
	# in case there is a match at begin position
	if (pattern->search("c", range[1]) != 0)
		# count up
		count += 1
		# process
		Process(count)
		# while there is a match between cursor and end
		while (pattern->search("", range[1]) != 0)
			# count up
			count += 1
			# process
			Process(count)
		endwhile
	endif
	# resume position
	save_pos->winrestview()
	return count
enddef

export def RangeInfo(
		range: list<number>
	): string
	# generate info for given validated range

	# set range info
	var info: string = "Line " .. range[0]
	if (range[1] != range[0])
		info ..= " to " .. range[1]
	endif
	info ..= ": "
	return info
enddef

export def Trim(
		lineFrom: number = 0,
		lineTo:   number = 0
	): void
	# remove trail(s) in given range

	# validate range
	var range: list<number> = [lineFrom, lineTo]->ValidateRange()
	# process lines
	var pattern: string = "\\v\\s+$"
	var subs:    string = ""
	var count: number = (count: number): void => {
		# remove trail
		getline(".")->substitute(pattern, subs, "")->setline(".")
		return
	}->ProcessLines(pattern, range)
	# print number of trail(s) removed
	var info: string = range->RangeInfo()
	if (count == 0)
		info ..= "no trail."
	elseif (count == 1)
		info ..= "1 line trimmed."
	else
		info ..= count .. " lines trimmed."
	endif
	echo info
	return
enddef

export def Count(
		pattern:  string,
		lineFrom: number = 0,
		lineTo:   number = 0
	): void
	# count pattern in given range

	# validate range
	var range: list<number> = [lineFrom, lineTo]->ValidateRange()
	# process lines
	var count: number = (count: number): void => {
		# NOP
		return
	}->ProcessLines(pattern, range)
	# print number of pattern(s) counted
	var info: string = range->RangeInfo()
	info ..= count .. " " .. pattern .. " counted."
	echo info
	return
enddef

export def CountReplace(
		pattern:  string,
		init:     any = 1,
		diff:     any = 1,
		lineFrom: number = 0,
		lineTo:   number = 0
	): void
	# count pattern and replace with number or float sequence in given range

	# validate range
	var range: list<number> = [lineFrom, lineTo]->ValidateRange()
	# check init and diff type, only number and float allowed
	var t_init: number = init->type()
	var t_diff: number = diff->type()
	if ((t_init != v:t_number && t_init != v:t_float) ||
		(t_diff != v:t_number && t_diff != v:t_float))
		echo "Invalid type!"
		return
	endif
	# determin format for number or float
	var format: string
	if (t_init == v:t_number && t_diff == v:t_number)
		# if both init and diff are number, format is number
		format = "%0d"
	else
		# otherwise format is float
		format = "%G"
	endif
	# 1st process: find maxLen of all expr
	var maxLen: number = 0
	(count: number): void => {
		# find maxLen of all expr
		maxLen = [maxLen, (init + (count - 1) * diff)->printf(format)->strlen()]->max()
		return
	}->ProcessLines(pattern, range)
	# insert maxLen as field width in format
	format = format->slice(0, -1) .. maxLen .. format->slice(-1)
	# 2nd process: replace pattern with formatted expr
	var count: number = (count: number): void => {
		# replace pattern with formatted expr
		getline(".")->substitute(pattern, (init + (count - 1) * diff)->printf(format), "")->setline(".")
		return
	}->ProcessLines(pattern, range)
	# print number of pattern(s) counted and replaced
	var info: string = range->RangeInfo()
	info ..= count .. " " .. pattern .. " counted and replaced."
	echo info
	return
enddef

export def Test(): void
	echo "Test."
	return
enddef
