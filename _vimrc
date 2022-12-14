" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" ==== 安装 ====================
" 添加用户变量$VIM=...\Vim(不要引用其它用户变量)
" 修改用户变量$Path+=%VIM%vim90
" 运行install.exe,仅安装选项14和15(添加右键菜单)

" ==== 插件 ====================
set nocompatible
filetype off
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle')
Plugin 'VundleVim/Vundle.vim'  " 插件管理器
Plugin 'minibufexplorerpp'     " 缓冲区浏览器
Plugin 'PProvost/vim-ps1'      " PowerShell语法
call vundle#end()
filetype plugin indent on

" ==== MiniBufExpl++ 设置 ======
let g:miniBufExplorerMoreThanOne=0    " 启用MBE++窗口的最小缓冲区数量
let g:miniBufExplMapWindowNavVim=1    " <Ctrl-hjkl>切换窗口
let g:miniBufExplMapCTabSwitchBufs=1  " <Ctrl-Tab>和<Ctrl-Shift-Tab>切换缓冲区

" ==== 终端 ====================
set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
" 该终端使用当前用户的(HKEY_CURRENT_USER)执行策略,而非默认作用域(HKEY_LOCAL_MACHINE)的执行策略
" 注册表项位于计算机\HKEY_...\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell
" PluginInstall只支持cmd终端,在安装新的插件之前需要先禁用PowerShell终端

" ==== 语言 ====================
let $LANG='zh_CN'              " 消息语言
set langmenu=zh_CN             " 菜单语言
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
                               " 打开文件使用的编码

" ==== 外观 ====================
winpos 100 100                 " 窗口位置
set lines=30 columns=100       " 窗口大小
set guioptions-=m              " 隐藏菜单栏
set guioptions-=T              " 隐藏工具栏
colo desert                    " 主题
set guifont=courier_new:h13    " 字体
set number                     " 显示行号
set cursorline                 " 当前行高亮
set list                       " 显示不可见字符
set lcs=tab:\\\ ,trail:*       " \t显示为\   ,行尾空格显示为*
set tabstop=4                  " Tab宽度,\t的宽度
set softtabstop=4              " SoftTab宽度,<Tab>或<BS>的宽度
set noexpandtab                " 不以space取代tab
set shiftwidth=4               " 缩进宽度

" ==== 搜索 ====================
set ignorecase                 " 忽略大小写
set smartcase                  " 智能大小写

" ==== 折叠 ===================={{{
set foldmethod=marker          " 根据标记{{{折叠}}}
set foldlevelstart=99          " 打开文件时展开所有折叠
let fortran_fold=1             " 启用Fortran语法折叠 program/module/subroutine/function
let fortran_fold_conditionals=1 "启用条件分支折叠 if/select/do
                               " 打开Fortran源码时还将自动设置:
                               "   根据语法折叠
                               "   折叠指示列宽
                               " 相应内容在$VIM/vimfiles/filetype.vim
                               " }}}

" ==== 映射 ====================
let mapleader=','
inoremap <a-k> <up>
inoremap <a-j> <down>
inoremap <a-h> <left>
inoremap <a-l> <right>
nnoremap <leader>tt :call generalScript#test()<cr>
nnoremap <leader>tr :call generalScript#trim()<cr>
nnoremap <leader>tl :call generalScript#trimLine()<cr>
" nnoremap <leader>tr mxHmy:%s/\v\s+$//g<cr>`yzt`x
" nnoremap <leader>tl mx0:s/\v\s+$/<cr>`x
nnoremap <leader>de d$
nnoremap <leader>mc :call melcorScript#melcorCount()<cr>
nnoremap <leader>re /\v\*\*\*\*\*\*\*\*<cr>
nnoremap <leader>sd :call simmerScript#simmerProcessData()<cr>
nnoremap <leader>st :call simmerScript#simmerProcessText()<left>
nnoremap <leader>sm :setf melcor<cr>
nnoremap <leader>sr :setf relap<cr>
nnoremap <leader>ss :setf simmer<cr>

" ==== 编辑 ====================
set nobackup                   " 禁用备份文件
set noundofile                 " 禁用撤销文件
set noswapfile                 " 禁用交换文件
