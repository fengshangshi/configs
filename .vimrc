"设置内部使用的字符集
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,ucs-bom
set termencoding=utf-8
set nobomb

"环境配置
"linux环境
if has('unix')
   let g:my_vimrc = $HOME.'/.vimrc'
   let g:vimrc_home = $HOME.'/.vim'
   "不高亮光标所在的屏幕行
   set nocursorline
endif

"自动命令
"vim配置文件保存时自动重新载入配置
autocmd! BufWritePost vimrc exec 'source '.g:my_vimrc

"选项配置
syntax on
"不兼容vi
set nocompatible
"备份文件存放目录
exec 'set backupdir='.fnameescape(g:vimrc_home.'/.vim_backup/')
"swap文件存放目录
exec 'set directory='.fnameescape(g:vimrc_home.'/.vim_swap/')
"持久撤销文件存放目录
exec 'set undodir='.fnameescape(g:vimrc_home.'/.vim_undo/')
"创建备份
set backup
"持久撤销功能
set undofile
"显示折叠列
set foldcolumn=3
"用于开始编辑时总是关闭所有的折叠（值为0），关闭某些折叠（1）或者没有折叠（99）
set foldlevelstart=99
set foldlevel=99

"<tab>代表的空格数
set tabstop=4
"缩进每一步使用的空格数，>>
set shiftwidth=4
set softtabstop=4
set noexpandtab
"光标上下至少保留的屏幕行数
set scrolloff=2
"如果设置nowrap，光标左右至少保留的列数
set sidescrolloff=2
"水平滚动时滚动的最少列数
set sidescroll=1
"新建行时的参考上一行自动缩进
set autoindent
set showmode
set showcmd
set hidden
"以增强模式运行命令行补全
set wildmenu
set wildmode=list:longest
"不适用可视响铃
set novisualbell
"表明使用的是快速终端连接
set ttyfast
"显示光标位置的行号和列号，逗号分隔
set ruler
set backspace=indent,eol,start
"总是显示状态行
set laststatus=2
"显示行号
set number
"行号使用的最小宽度
set numberwidth=6
"语法高亮指定折叠
set foldmethod=syntax
"搜索模式下忽略大小写
set ignorecase
"如果搜索模式包含大写字符，不使用ignorecase选项
set smartcase
set gdefault
"高亮搜索匹配到的字符
set incsearch
"插入括号时，短暂的跳转到匹配的对应括号
set showmatch
"高亮所有匹配
set hlsearch
"不自动换行
set nowrap
"插入文本的最大宽度
set textwidth=120
set formatoptions+=q
set formatoptions+=r
set formatoptions+=n
set formatoptions+=l
"显示tab和空格
set list
"set lcs=tab:\|\ ,nbsp:%,trail:-
set listchars=tab:\|\-,trail:-,extends:>,precedes:<
"set listchars=tab:\|\ ,nbsp:%,trail:-

set complete+=k
set history=1000
"文件名补全时忽略.svn
set wildignore+=*.svn
"窗口分隔会把新窗口放到当前窗口之下
"set nosplitbelow
set splitbelow
"窗口分隔会把新窗口放到当前窗口之右
"set nosplitright
set splitright
"状态栏信息
set statusline=[%F]%y%r%m%*%=[Line:%l\/%L,\ Column:%c][%p%%]
"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line:\ %l\/%L,\ col:\ %c)
"设置背景色
set background=dark
"colorscheme solarized
set t_Co=256
colorscheme solarized
"在可视模式下可以选择一个方块
set virtualedit+=block
set autoread
set cmdheight=1
set linebreak
set whichwrap=b,s,<,>,[,]
set autochdir
"以下字符不被切分
set iskeyword+=_,$,@,%,#,-

"打开文件时，自动跳转到上次光标所在的位置
if has('autocmd')
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exec "normal! g'\"" | endif
endif

"文件类型侦测
filetype plugin indent on

"Javascript 折叠
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
autocmd FileType javascript setl fen
autocmd FileType javascript call JavaScriptFold()

"PHP 折叠
autocmd FileType php EnablePHPFolds

"超出80字符提示线条
set colorcolumn=80
"设置列的背景色
hi ColorColumn ctermbg=darkred

"zi 打开关闭折叠
"zv 查看此行
"zm 关闭折叠
"zM 关闭所有
"zr 打开
"zR 打开所有
"zc 折叠当前行
"zo 打开当前折叠
"zd 删除折叠
"zD 删除所有折叠
if &term =~ "xterm"
	let &t_ti = "\<Esc>[?47h"
	let &t_te = "\<Esc>[?47l"
endif

"设置快捷键 nerd tree
map <F8> :NERDTree<cr>
map <F9> :NERDTreeClose<cr>
