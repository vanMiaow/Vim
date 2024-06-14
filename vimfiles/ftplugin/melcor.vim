vim9script

# 快捷键: 统计组件
nnoremap <leader>mc :call MelcorCount()<cr>

def g:MelcorCount(): void
	# count CV, FL, HS records
	# if INUM missing, append as comment
	# reserve original comment

	# get line range of entire buffer
	var range: list<number> = [0, 0]->general#ValidateRange()
	# create package dictionary of name, pattern and count
	var dictionary: dict<dict<any>> = {
		cv: {name: "CV", pattern: "\\v^CV_ID", count: 0},
		fl: {name: "FL", pattern: "\\v^FL_ID", count: 0},
		hs: {name: "HS", pattern: "\\v^HS_ID", count: 0}
	}
	# init info
	var info: string = range->general#RangeInfo()
	# loop over all packages
	for package in dictionary->values()
		# init inum list
		var inum: list<number>
		# 1st process: match and construct inum list
		# if positive: inum found, this record needs no further process
		# if zero: inum not found, and an inum comment should be generated for this record
		package.count = (count: number): void => {
			# try match inum in current record and add to inum list
			inum->add(getline(".")->matchstr("\\v^\\S+\\s+['\"][^'\"]+['\"]\\s*\\zs\\d+\\ze(.*)$")->str2nr())
			return
		}->general#ProcessLines(package.pattern, range)
		# 2nd process: generate inum comment for record(s) with no inum
		package.count = (count: number): void => {
			# if inum not found
			if (inum[count - 1] <= 0)
				# match required (id and name) and optional (inum comment and actual comment) part of current record
				var req: string # required (id and name)
				var cum: string # inum comment
				var com: string # actual comment
				[req, cum, com] = getline(".")->matchlist("\\v^(\\S+\\s+['\"][^'\"]+['\"])\\s*(!\\s*\\d+\\s*)?(!.*)?$")->slice(1, 4)
				# update inum for current record
				inum[count - 1] = inum->max() + 10
				# generate new inum comment
				cum = " !" .. inum[count - 1]
				# if actual comment exist, append space
				if (com->strlen() > 0)
					cum ..= " "
				endif
				# update current record
				(req .. cum .. com)->setline(".")
			endif
			return
		}->general#ProcessLines(package.pattern, range)
		# append number of record(s) counted for this package
		info ..= package.count .. " " .. package.name .. "(s), "
	endfor
	# print number of record(s) counted for each package
	info = info->slice(0, -2) .. " counted."
	echo info
	return
enddef
