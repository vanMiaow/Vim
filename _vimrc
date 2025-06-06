vim9script

# Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

# ==== 安装 ====================
# 添加用户变量$VIM=.../Vim(不要引用其它用户变量)
# 修改用户变量$Path+=%VIM%/vim91
# 以管理员身份运行install.exe,仅选中1(脚本)和14,15(右键)
# 以管理员身份运行uninstall.exe卸载

# ==== 插件 ====================
call plug#begin('$VIM/vimfiles/plugged')
Plug 'vim-scripts/minibufexplorerpp'    # 缓冲区浏览器
Plug 'mg979/vim-visual-multi'           # 多光标编辑
Plug 'ycm-core/YouCompleteMe'           # 自动补全
Plug 'jiangmiao/auto-pairs'             # 括号补全
Plug 'SirVer/UltiSnips'                 # snippet引擎
Plug 'honza/vim-snippets'               # snippet文件
Plug 'godlygeek/tabular'                # 自动对齐 :Tabularize
Plug 'PProvost/vim-ps1'                 # PowerShell语法
Plug 'preservim/vim-markdown'           # Markdown语法
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}   # Markdown预览 :MarkdownPreviewToggle
Plug '~/OneDrive/Software/lilypond/lilypond-2.24.1/share/lilypond/2.24.1/vim'   # lilypond.vim
call plug#end()

# ==== MiniBufExpl++ 设置 ======
g:miniBufExplorerMoreThanOne = 0    # 启用MBE++窗口的最小缓冲区数量
g:miniBufExplMapWindowNavVim = 1    # <ctrl-hjkl>切换窗口
g:miniBufExplMapCTabSwitchBufs = 1  # <ctrl-tab>和<shift-ctrl-tab>切换缓冲区

# ==== vim-visual-multi 设置 ===
g:VM_leader = ',,'                   # VM快捷键leader

# ==== YouCompleteMe 设置 ======
g:ycm_key_list_select_completion = ['<down>']   # <down>切换下一项,移除<tab>避免UltiSnips冲突
g:ycm_filetype_whitelist = {        # 按文件类型启用
    '*': 1,                         # 所有文件类型(默认)
    'ycm_nofiletype': 1             # 增加无文件类型
}
g:ycm_filetype_blacklist = {        # 按文件类型禁用(默认)
    'tagbar': 1,
    'notes': 1,
    'markdown': 1,
    'netrw': 1,
    'unite': 1,
    'text': 1,
    'vimwiki': 1,
    'pandoc': 1,
    'infolog': 1,
    'leaderf': 1,
    'mail': 1
}

# ==== UltiSnips 设置 ==========
g:UltiSnipsExpandOrJumpTrigger = '<tab>'    # <tab>展开和向后跳转
g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = $VIM .. '/vimfiles/ultisnips'  # 用户snippet文件位置

# ==== Markdown Preview 设置 ===
# 更新mermaid.js: https://www.jsdelivr.com/package/npm/mermaid/ => $VIM/vimfiles/plugged/markdown-preview.nvim/app/_static/
# 更新chart.js: 不会! 当前版本2.9.4

# ==== 终端 ====================
# set shell=cmd   # 更新插件需要使用cmd
set shell=pwsh

# ==== 语言 ====================
$LANG = 'zh_CN'                # 消息语言
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
set listchars=tab:├─,leadmultispace:│\ \ \ ,trail:·,precedes:<,extends:>
                               # \t显示为├───,行首空格显示为│   ,行尾空格显示为·,前略显示为<,后略显示为>
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
g:mapleader = ','
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
nnoremap <leader>tt      :call general#Test()<cr>
nnoremap <leader>tr      :call general#Trim()<cr>
vnoremap <leader>tr <esc>:call general#Trim(line("'<"), line("'>"))<cr>
nnoremap <leader>t.      :call general#Trim(line('.'))<cr>
# alternative Trim()
# nnoremap <leader>tr      mxHmy:let z=@/<cr>:    %s/\v\s+$/<cr>:let @/=z<cr>`yzt`x
# vnoremap <leader>tr <esc>mxHmy:let z=@/<cr>:'<,'>s/\v\s+$/<cr>:let @/=z<cr>`yzt`x
# nnoremap <leader>t.      mx   :let z=@/<cr>:     s/\v\s+$/<cr>:let @/=z<cr>    `x
nnoremap <leader>cn      :call general#Count('#')<left><left>
vnoremap <leader>cn <esc>:call general#Count('#',line("'<"),line("'>"))<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <leader>cr      :call general#CountReplace('#')<left><left>
vnoremap <leader>cr <esc>:call general#CountReplace('#',1,1,line("'<"),line("'>"))<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
# set filetype
nnoremap <leader>sm :setfiletype melcor<cr>
nnoremap <leader>sr :setfiletype relap<cr>

# ==== 编辑 ====================
set nobackup                   # 禁用备份文件
set noundofile                 # 禁用撤销文件
set noswapfile                 # 禁用交换文件
