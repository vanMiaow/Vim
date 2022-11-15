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
	set foldmethod=syntax
	set foldcolumn=8
}
