==== 变量 =================================================================<<

1.$VIM
  VIM用户文件路径,一般在$OneDrive/Software/Vim(但是在设置环境变量时不要引用$OneDrive)

2.$VIMRUNTIME
  VIM支持文件路径,默认在$VIM/vim90,一般不需要设置

===========================================================================>>

==== 目录 =================================================================<<

Vim/
│ .git/
│ tutorial/
│ vim90/
│ vimfiles/
│ │ autoload/       脚本,调用时自动加载
│ │ colors/         配色方案
│ │ compiler/       编译器选项,设置编译器后加载
│ │ doc/            文档
│ │ ftdetect/       文件类型检测,检测到对应文件类型后加载(用于覆盖默认文件类型)
│ │ ftplugin/       脚本,检测到对应文件类型后加载
│ │ indent/         缩进,检测到对应文件类型后加载
│ │ keymap/         键盘映射
│ │ plugged/        脚本,vim-plug管理加载
│ │ plugin/         脚本,vim启动时加载
│ │ syntax/         语法,检测到对应文件类型后加载
│ │ filetype.vim    文件类型检测
│ .gitignore
│ _vimrc

===========================================================================>>

==== 按键 =================================================================<<

1.光标
  k         ↑
  j         ↓
  h         ←
  l         →
  0         Home
  $         End

  nG        移动到第n行
  gg        Ctrl + Home / 1G
  G         Ctrl + End

  w         下一个单词开头
  e         下一个单词结尾
  b         上一个单词开头
  W/E/B     则仅以空格分隔单词

  ^b        Page Up
  ^f        Page Down

2.查找替换
  /word     向下查找
  ?word     向上查找
  n         继续查找(同向)
  N         继续查找(反向)

  :[range]s/{pattern}/{replace}/g
            在[range]内匹配{pattern}并替换为{replace}
            g替换每行的所有匹配,否则只替换第一个
            [range]的详细用法可以参考:help range

  :[range]g/{pattern}/{cmd}
            在[range]内匹配{pattern}并对匹配的行执行{cmd}

  :g和:s组合可以实现一些特殊的替换操作,比如
    :let n=1 | g/#N/s//\=n/|let n+=1
  可以将文件内的#N标记替换为1,2,...的数字序列

3.复制粘贴
  x         Delete,向后删除一个字符
  X         Backspace,向前删除一个字符

  d         删除
  dd        删除当前行
  ndd       由当前行起,向下删除共n行
  dnG       删除当前行与第n行之间所有行,允许dgg/dG
  d0        删除行首与游标之间所有字符
  d$        删除行尾与游标之间所有字符

  y         复制
  yy        复制当前行
  nyy       由当前行起,向下复制共n行
  ynG       复制当前行与第n行之间所有行,允许ygg/yG
  y0        复制行首与游标之间所有字符
  y$        复制行尾与游标之间所有字符

  v         选择
  V         行选择
  ^v        块选择

  p         粘贴至下一行
  P         粘贴至上一行

  .         重复操作

  u         undo
  ^r        redo

4.编辑模式
  i         从光标输入
  I         从当前行第一个非空字符输入(≈行首)
  a         从光标后输入
  A         从行尾输入
  o         从下一行另起新行输入
  O         从上一行另起新行输入
  r         取代(一次)
  R         取代(一直)

5.文件
  :w        保存
  :q        退出
  :q!       强制退出(不保存)
  :wq       保存并退出
  :e file   编辑

6.折叠
  set fdm=marker
  zfngg     折叠当前行到第n行
  zd        删除当前折叠
  za        打开/关闭当前折叠
  zo        打开当前折叠
  zc        关闭当前折叠
  zr        打开所有折叠
  zm        关闭所有折叠
  大写      嵌套折叠

7.窗口
  :vsplit   垂直分割
  ^w + hjkl 移动光标至目标方向窗口
  ^w + HJKL 移动当前窗口至目标方向

8.补全
  ^n        下一项
  ^p        上一项
  ^e        还原
  ^x        选择来源,详见:help ins-completion

9.缩进
  =         自动缩进
  >         增加缩进
  <         减少缩进

===========================================================================>>

==== 高亮 =================================================================<<

*** 已使用vim9script,语法有细微差别
*** 命令 syn hi def au setf 等尽量写完整

1.定义语法规则
  在$VIM/vimfiles/syntax/下建立 语法规则.vim
  开头    " quit when a syntax file was already loaded
          if exists("b:current_syntax")
              finish
          endif
  中间    syn keyword/match/region ${group} ... 详见:help syn-define,syn-arguments
          hi ${group} ...                       详见:help highlight
          hi def link ${from-group} ${to-group} 详见:help highlight-link,group-name
  结尾    let b:current_syntax = "语法规则"

2.识别文件类型
  在$VIM/vimfiles/下建立filetype.vim,添加
  au BufRead,BufNewFile *.文件后缀 setf=语法规则

===========================================================================>>

==== 插件 =================================================================<<

*** 换用vim-plug,Vundle不再使用
*** vim-plug用法类似

1.配置Vundle
  * 克隆
    git clone https://github.com/VundleVim/Vundle.vim.git $VIM/vimfiles/bundle/Vundle.vim

  * 配置
   set nocompatible
   filetype off
   set rtp+=$VIM/vimfiles/bundle/Vundle.vim
   call vundle#begin('$VIM/vimfiles/bundle')
   Plugin 'VundleVim/Vundle.vim'
   call vundle#end()
   filetype plugin indent on

  * 安装
    :PluginInstall

2.管理插件
  * 显示
    :PluginList

  * 搜索
    :PluginSearch
    从http://vim-scripts.org/搜索插件,该网站已停止运行,因此该命令会出错
    可关注Github上将搜索源替换为https://github.com/vim-scripts/的计划

  * 安装
    添加
    Plugin 'someplugin'                    " 从https://github.com/vim-scripts/
    Plugin 'someuser/someplugin'           " 从https://github.com/
    Plugin 'git://someurl/someplugin.git'  " 从其他git
    Plugin 'file:///somepath/someplugin'   " 从本地
    到vundle#begin/end之间
    :PluginInstall

  * 删除
    移除相应Plugin 'someplugin'
    :PluginClean

  * 更新
    :PluginUpdate

===========================================================================>>
