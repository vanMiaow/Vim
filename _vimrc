vim9script

# Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

# ==== 安装 ====================
# 添加用户变量$VIM=...\Vim(不要引用其它用户变量)
# 修改用户变量$Path+=%VIM%\vim90
# 运行install.exe,仅安装选项14和15(添加右键菜单)

# ==== 插件 ====================
call plug#begin("$VIM/vimfiles/plugged")
Plug "vim-scripts/minibufexplorerpp"    # 缓冲区浏览器
Plug "PProvost/vim-ps1"                 # PowerShell语法
Plug "~/OneDrive/Software/lilypond/lilypond-2.24.1/share/lilypond/2.24.1/vim"   # lilypond.vim
Plug 'godlygeek/tabular'                # 自动对齐  :Tabularize
Plug 'preservim/vim-markdown'           # Markdown语法
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}   # Markdown预览  :MarkdownPreviewToggle
call plug#end()

# ==== MiniBufExpl++ 设置 ======
g:miniBufExplorerMoreThanOne = 0    # 启用MBE++窗口的最小缓冲区数量
g:miniBufExplMapWindowNavVim = 1    # <Ctrl-hjkl>切换窗口
g:miniBufExplMapCTabSwitchBufs = 1  # <Ctrl-Tab>和<Ctrl-Shift-Tab>切换缓冲区

# ==== 终端 ====================
# set shell="C:\Program\ Files\PowerShell\7\pwsh.exe"
# set shell="C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
# 该终端使用当前用户的(HKEY_CURRENT_USER)执行策略,而非默认作用域(HKEY_LOCAL_MACHINE)的执行策略
# 注册表项位于计算机\HKEY_...\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell

# ==== 语言 ====================
$LANG = "zh_CN"                # 消息语言
set langmenu=zh_CN             # 菜单语言
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
                               # 打开文件使用的编码

# ==== 外观 ====================
winpos 100 100                 # 窗口位置
set lines=30 columns=100       # 窗口大小
set guioptions-=m              # 隐藏菜单栏
set guioptions-=T              # 隐藏工具栏
colorscheme desert             # 主题
set guifont=courier_new:h13    # 字体
set number                     # 显示行号
set cursorline                 # 当前行高亮
set list                       # 显示不可见字符
set listchars=tab:├─,leadmultispace:│\ \ \ ,trail:·
                               # \t显示为├───,行首空格显示为│   ,行尾空格显示为·
highlight SpecialKey guifg=#808080
                               # 不可见字符颜色
set tabstop=4                  # Tab宽度,\t的宽度
set softtabstop=4              # SoftTab宽度,<Tab>或<BS>的宽度
set expandtab                  # 以space取代tab
set shiftwidth=4               # 缩进宽度
set autoindent                 # 自动缩进
set smartindent                # 智能缩进

# ==== 搜索 ====================
set ignorecase                 # 忽略大小写
set smartcase                  # 智能大小写

# ==== 折叠 ==================== <<
set foldmethod=marker          # 根据标记折叠
set foldmarker=<<,>>           # 折叠标记为<<和>>
set foldlevelstart=99          # 打开文件时展开所有折叠
                               # >>

# ==== 映射 ====================
g:mapleader = ","
inoremap <a-k> <up>
inoremap <a-j> <down>
inoremap <a-h> <left>
inoremap <a-l> <right>
nnoremap <leader>de d$
# open terminal
nnoremap <leader>th :leftabove  vertical terminal<cr>
nnoremap <leader>tj :rightbelow          terminal<cr>
nnoremap <leader>tk :leftabove           terminal<cr>
nnoremap <leader>tl :rightbelow vertical terminal<cr>
# functions in vimfiles/autoload/general.vim
nnoremap <leader>tt :call general#Test()<cr>
nnoremap <leader>tr :call general#Trim()<cr>
nnoremap <leader>t. :call general#Trim(line("."))<cr>
# alternative Trim()
# nnoremap <leader>tr mxHmy:%s/\v\s+$//g<cr>`yzt`x
# nnoremap <leader>tl mx0:s/\v\s+$/<cr>`x
nnoremap <leader>cn :call general#Count("#")<left><left>
nnoremap <leader>cr :call general#CountReplace("#")<left><left>
# set filetype
nnoremap <leader>sm :setfiletype melcor<cr>
nnoremap <leader>sr :setfiletype relap<cr>

# ==== 编辑 ====================
set nobackup                   # 禁用备份文件
set noundofile                 # 禁用撤销文件
set noswapfile                 # 禁用交换文件
