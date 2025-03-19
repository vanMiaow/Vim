vim9script

# Melcor input
autocmd BufRead,BufNewFile *.mel,*.mpp,melinp* setfiletype melcor
# Relap5 input
autocmd BufRead,BufNewFile *.rlp,*.rpp setfiletype relap
# Relap5 output
autocmd BufRead,BufNewFile outdta setfiletype relapOutdta
# WebVTT subtitle
autocmd BufRead,BufNewFile *.vtt setfiletype webvtt
