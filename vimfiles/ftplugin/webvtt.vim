vim9script

# 快捷键: 转换格式
nnoremap <leader>vl :call VTT2LRC()<cr>

def g:VTT2LRC(): void
    # convert WebVTT:
    #   TIME_START --> TIME_STOP
    #   SUBTITLE
    # to Lyric:
    #   [TIME_START]SUBTITLE
    #   [TIME_STOP]

    # remove WEBVTT in first line
    execute 'silent :%s/^WEBVTT.*$//'
    # convert WebVTT to Lyric
    execute 'silent :%s/\v([0-9:.]+)\s*--\>\s*([0-9:.]+)$\n^(.+)$/[\1]\3\r[\2]/'
    # remove blank lines
    execute 'silent :%s/^$\n//'
    # remove numbers
    execute 'silent :%s/^\d\+$//'
    # save file
    execute 'w'
    return
enddef
