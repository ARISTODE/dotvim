let mapleader = ";"
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

set tags=./tags;

" set the directory of swap file
set swapfile 
set dir=~/tmp

set linespace=3
" map <C-6> to <;-1>
nnoremap <Leader>1 <C-^>
" ruby ruby code faster
nnoremap <Leader>r :!ruby %<cr>
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set autoindent
set smartindent
"匹配括号
set showmatch
set vb t_vb=

"设置自动对齐
set ignorecase
" 关闭兼容模式
set nocompatible
" 允许退格键
set backspace=indent,eol,start
" vim 自身命令行模式智能补全
set wildmenu
" 将 pathogen 自身也置于独立目录中，需指定其路径 
runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
execute pathogen#infect()
" 配色方案
set background=dark
colorscheme solarized 
let g:spacegray_italicize_comments = 1
let g:spacegray_underline_search = 1
let g:molokai_original = 1
" let g:rehash256 = 1
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"""""""""""""""""""""""""""
"   set menu and status bar
"""""""""""""""""""""""""""

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" Set the status line the way i like it
set statusline=%F:\ %l
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
set guifont=Source\ Code\ Pro:h15
" 禁止折行
set nowrap
" 开启语法高亮功能
syntax enable

"""""""""""""""
"   indent
"""""""""""""""

" 自适应不同语言的智能缩进
filetype indent on
" 设置换行字符数
set textwidth=80
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
nnoremap <C-e> :NERDTreeToggle<CR>


"""""""""""""""""""
"   vim wiki
"""""""""""""""""""

map <LEADER>3 :e ~/vimwiki/.index.wiki


"""""""""""""""""""
"   quit quickly
"""""""""""""""""""

map <LEADER>f :q!<CR>

"""""""""""""""""""
"   vimrc editing
"""""""""""""""""""

map <LEADER>e :e ~/.vimrc
autocmd! BufWritePost vimrc source ~/.vimrc

"""""""""""""""""""
"   buffers 
"""""""""""""""""""

set hidden "inorder to switch between buffers"
map <s-tab> :bp<cr>
map <tab> :bn<cr>
map ,bd :bd<cr>

"""""""""""""""""""
"   ctrl p
"""""""""""""""""""

"Ctrlp plugin enable
set runtimepath^=~/.vim/bundle/ctrlp.vim
" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif


"""""""""""""""
" Auto Save
let g:auto_save = 1

"""""""""""""""
" Select tab in vim
" Add tab selection in vim 
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif


"""""""
"  AG and CtrlSF
"""""""
let g:ag_working_path_mode="r"
map ,k :CtrlSF 


"""""""""""
"  Tagbar
"""""""""""

map ,t :TagbarToggle<CR>


"""""""
" python exectution
"""""""
"按F5运行python"
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction



