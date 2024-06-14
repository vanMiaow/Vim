vim9script

autocmd BufRead,BufNewFile *.mel,*.mpp setfiletype melcor       # Melcor input

autocmd BufRead,BufNewFile *.rlp,*.rpp setfiletype relap        # Relap5 input
autocmd BufRead,BufNewFile outdta      setfiletype relapOutdta  # Relap5 output

autocmd BufRead,BufNewFile *.vtt setfiletype webvtt             # webvtt subtitle
