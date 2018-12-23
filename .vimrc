"使用utf8编码
set encoding=utf-8
"显示行号
set number
"语法高亮
syntax on
"在底部显示，当前处于命令模式还是插入模式
set showmode
"命令模式下，在底部显示，当前键入的指令
set showcmd
"支持使用鼠标
set mouse=a
"启用256色
set t_Co=256
"自动保持上一行的缩进
set autoindent
"C语言风格缩进
set cindent 
"自动缩进空白字符个数
set shiftwidth=4
"按下Tab键时，显示空格数
set tabstop=4
"光标缩在的行高亮
set cursorline
"关闭自动折行
set nowrap
"光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch
"搜索时，高亮显示匹配结果
set hlsearch
"搜索的高亮颜色设置
hi search term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=Grey
"输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch
"搜索时忽略大小写
set ignorecase
"打开英语单词的拼写检查
set spell spelllang=en_us
"打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示
set autoread
"关闭换行或格式化时自动添加注释符号
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " This can be done as well instead of the previous line, for setting formatoptions as you choose:
    " autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

"------------------------------------macOS config------------------------------------------
"增强mac键盘的delete键（默认在编辑状态无法删除前面的空白）
set backspace=indent,eol,start



"-------------------------------------------------Plug---------------------------------------------------------------

call plug#begin('~/.vim/plugged')


"YCM补全插件
Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'



"异步语法检查
Plug 'w0rp/ale'
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0


"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
" }}}


"自动补全括号插件
Plug 'jiangmiao/auto-pairs'


"目录树
Plug 'scrooloose/nerdtree'
"修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"窗口位置
let g:NERDTreeWinPos='left'
"窗口宽度
let NERDTreeWinSize=25
"不显示隐藏文件
let g:NERDTreeHidden=0
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"打开vim时自动打开NERDTree
autocmd vimenter * NERDTree
"打开vim时，光标自动到右侧编辑区
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w

"共享目录树
Plug 'jistr/vim-nerdtree-tabs'
"将F2设置为开关共享NERDTree的快捷键
map <f2> :NERDTreeTabsToggle<cr>
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1


"函数及成员列表
Plug 'majutsushi/tagbar'
"ctags路径
let g:tagbar_ctags_bin='ctags'
"窗口宽度
let g:tagbar_width=30
map <F3> :Tagbar<CR>


"有道翻译插件 ctrl+t
Plug 'ianva/vim-youdao-translater'
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>





call plug#end()



