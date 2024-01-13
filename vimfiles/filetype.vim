au BufRead,BufNewFile *.mel {
	setf melcor
	set lcs=tab:-->,trail:*
}

au BufRead,BufNewFile *.rlp {
	setf relap
}

au BufRead,BufNewFile *.sim {
	setf simmer
}

au BufRead,BufNewFile *.f,*.for,*.fortran,*.fpp,*.ftn,*.f77,*.f90,*.f95,*.f03,*.f08 {
	# 根据语法折叠
	set foldmethod=syntax
	# 折叠指示列宽
	set foldcolumn=8
	# 启用Fortran语法折叠 program/module/subroutine/function
	g:fortran_fold = 1
	# 启用条件分支折叠 if/select/do
	g:fortran_fold_conditionals = 1
}
