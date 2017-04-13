filetype on

" 开启鼠标控制
" set mouse=a
" F6 语法开关，关闭语法可以加快大文件的展示
" nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
set langmenu=none
set fileencodings=utf-8,gbk,gb18030,ucs-bom,cp936,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf8

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set number
set autoindent
set hlsearch
set incsearch
set encoding=utf-8
" highlight Normal ctermfg=white ctermbg=cyan
set nowrap
syntax enable

let g:proj_window_width=5
" 加注释时多加个空格 ("和#改成" 和# )
let g:NERDSpaceDelims=1

set backspace=2

" kj 替换 Esc
inoremap kj <Esc>
" 状态条设置
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness

map <C-T> :FufFile<CR>
map <C-E> :MRU<CR>
map <C-S-M> :Rmodel<CR>
map <C-S-C> :Rcontroller<CR>
map <C-S-U> :Runit<CR>
map <C-S-L> :Rfunctional<CR>
map <C-H> :Rhelper<CR>
map <C-V> :Rview<CR>
map <C-J> :ZoomWin<CRo
map <leader>h :GundoToggle<CR>

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  "     " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F8> :TagbarToggle<CR>



""rubocop配置
"let g:vimrubocop_config = '~/.vim/bundle/rubocop.yml'
"let g:vimrubocop_keymap = 0
"map <leader>r :RuboCop<CR>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" match Todo /\s\+$/
filetype plugin on
let mapleader = ","

" THE VIM OUTLINER (TVO)
" defaults:
let otl_install_menu=1
let no_otl_maps=0
let no_otl_insert_maps=0

" overrides:
let otl_bold_headers=0
let otl_use_thlnk=0

" au BufWinLeave *.otl mkview
" au BufWinEnter *.otl silent loadview
let maplocalleader = ","

""Only do this part when compiled with support for autocommands.
"if has("autocmd")
"  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"endif

let g:EclimCompletionMethod = 'omnifunc'

set nocompatible               " be iMproved
filetype off                   " required!


set ignorecase smartcase

"括号高亮
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
"
"" \ ['black',       'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



" ============== Vundle part =================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" rails 的m v c跳转
" Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-rails'

Bundle 'tsaleh/vim-matchit.git'
Bundle 'ecomba/vim-ruby-refactoring.git'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'git://git.wincent.com/command-t.git'
Bundle 'YankRing.vim'
" Bundle 'vividchalk.vim'
" Bundle 'dracula/vim'
" 代码注释插件
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'kchmck/vim-coffee-script'


Bundle 'drmingdrmer/xptemplate'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-endwise'
" RuboCop 代码检查
Bundle 'w0rp/ale'

Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'yggdroot/indentline'

"括号高亮
Bundle 'kien/rainbow_parentheses.vim'

" 代码补全
Bundle 'Valloric/YouCompleteMe'

" 代码历史版本控制
Bundle 'sjl/gundo.vim'
Bundle 'mru.vim'
Bundle 'greplace.vim'

"文件内方法列表插件
Bundle 'majutsushi/tagbar'
" 文件搜索插件
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ctags.vim'
"底部状态栏
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'

" 打标签
" Bundle "kshenoy/vim-signature"

"Bundle 'snipMate'
"Bundle 'snipmate-snippets'
"Bundle 'Jasmine-snippets-for-snipMate'
"Bundle 'godlygeek/tabular'
"Bundle 'msanders/snipmate.vim'
"Bundle 'jelera/vim-javascript-syntax'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'flazz/vim-colorschemes'
"Bundle 'othree/html5.vim'
"Bundle 'xsbeats/vim-blade'
"Bundle 'Raimondi/delimitMate'
"Bundle 'groenewege/vim-less'
"Bundle 'evanmiller/nginx-vim-syntax'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tomasr/molokai'
"Bundle 'mru.vim'
"Bundle 'greplace.vim'
"Bundle 'christoomey/vim-run-interactive'
"Bundle 'croaky/vim-colors-github'
"Bundle 'danro/rename.vim'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'pbrisbin/vim-mkdir'
"Bundle 'scrooloose/syntastic'
"Bundle 'vim-scripts/matchit.zip'
"Bundle 'vim-scripts/tComment'
"Bundle 'mattn/emmet-vim'
"Bundle 'scrooloose/nerdtree'
"Bundle 'thoughtbot/vim-rspec'
"Bundle 'tpope/vim-bundler'



set list lcs=tab:\|\
"let g:indentLine_setColors = 0
" Vim
let g:indentLine_color_term = 239

"色彩主题
"
highlight Normal ctermfg=grey ctermbg=darkblue

" colorscheme vividchalk
" colorscheme dracula
" colorscheme koehler
" colorscheme solarized
 let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1
colorscheme hybrid


" set background=light
set background=dark

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


map <S-F> <Leader><Leader>f
map <Leader>a :YRShow<CR>
map <Leader>t :NERDTree<CR>
map <Leader>q :q<CR>
map <Leader>f :Rfixture<CR>
map <Leader>rj :Rjavascript<CR>

"YCM配置
"自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2
"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"跳转到定义处
"autocmd BufWritePost,FileWritePost *.coffee :silent !coffee --compile --join appstore/static/javascripts/angular/controllers.js appstore/static/javascripts/angular/controllers.coffee appstore/static/javascripts/angular/tabs/*coffee appstore/static/javascripts/angular/applications/*coffee appstore/static/javascripts/angular/users/*coffee appstore/static/javascripts/angular/commons/*coffee
"autocmd BufWritePost,FileWritePost *.coffee :silent !coffee --compile appstore/static/javascripts/angular/app.coffee appstore/static/javascripts/angular/directives.coffee appstore/static/javascripts/angular/filters.coffee appstore/static/javascripts/angular/services.coffee

"autocmd BufWritePost,FileWritePost *.coffee :silent !coffee --compile --join tvboxcms/static/javascripts/angular/controllers.js tvboxcms/static/javascripts/angular/controllers.coffee tvboxcms/static/javascripts/angular/tabs/*coffee tvboxcms/static/javascripts/angular/applications/*coffee tvboxcms/static/javascripts/angular/users/*coffee tvboxcms/static/javascripts/angular/commons/*coffee
"autocmd BufWritePost,FileWritePost *.coffee :silent !coffee --compile tvboxcms/static/javascripts/angular/app.coffee tvboxcms/static/javascripts/angular/directives.coffee tvboxcms/static/javascripts/angular/filters.coffee tvboxcms/static/javascripts/angular/services.coffee

"autocmd BufWritePost,FileWritePost *.coffee :silent !coffee --compile --join m-cms-preview/static/javascripts/angular/controllers.js m-cms-preview/static/javascripts/angular/controllers.coffee m-cms-preview/static/javascripts/angular/tabs/*coffee m-cms-preview/static/javascripts/angular/applications/*coffee m-cms-preview/static/javascripts/angular/users/*coffee m-cms-preview/static/javascripts/angular/commons/*coffee
"autocmd BufWritePost,FileWritePost *.coffee :silent !coffee --compile m-cms-preview/static/javascripts/angular/app.coffee m-cms-preview/static/javascripts/angular/directives.coffee m-cms-preview/static/javascripts/angular/filters.coffee m-cms-preview/static/javascripts/angular/services.coffee
