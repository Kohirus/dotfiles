" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 语法高亮
syntax on
" 显示状态行
set laststatus=2
" 设置状态栏内容:
" - %F: 显示当前文件的完整路径
" - %r: 如果文件只读，则会显示[RD]
" - %B: 显示光标下字母的编码值 十六进制
" - %l: 光标所在行号
" - %v: 光标所在列号
" - %P: 当前内容在整个文件中的百分比
" - %H %M: 当前系统时间
set statusline=%F%r\ [HEX=%B][%l,%v,%P]\ %{strftime(\"%H:%M\")}
" 显示行号
set nu
" 高亮当前行
set cursorline
" 共享剪切板
set clipboard+=unnamed
" 关闭备份
set nobackup
" 关闭交换文件
set noswapfile
" 自动保存
set autowrite
" 高亮搜索
set hlsearch
" 搜索时自动跳转
set incsearch
" 搜索时忽略大小写
set ignorecase
" 设置超时时间
set ttimeout
set ttimeoutlen=100
" 允许光标跨越行边界
set whichwrap+=<,>,h,l
" 启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 高亮显示括号匹配
set showmatch
" 设置Tab宽度和自动缩进
set tabstop=2
set shiftwidth=4
set autoindent
set noexpandtab
" 自动补全括号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
