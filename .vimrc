""" viのvim互換ではなくvimとして動作させる
set nocompatible
" ファイルタイプ関連を無効化する
filetype off

"------------------------------------------------------------------------------
" エディタの設定
"------------------------------------------------------------------------------
set ignorecase "do not distinguish Capital Charecters
set smartcase "if capital character is input, search 
set incsearch
set hlsearch
set shiftround
set infercase
"set virtualedit=all " edit all
set hidden
set switchbuf=useopen
set showmatch
set matchtime=3
set matchpairs& matchpairs+=<:>
set backspace=indent,eol,start
set showcmd
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
"set foldmethod=indent
"set foldlevel=0
set foldnestmax=1
autocmd FileType cpp setlocal foldmethod=syntax
"setlocal foldmethod=syntax """ 


cnoremap <expr> / getcmdtype() == '/' ? '\\' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus,unnamed
else
  set clipboard& clipboard+=unnamed
endif

set nowritebackup
set nobackup
set noswapfile

"---------- 表示関連の設定 -----------------------------------------------------
"set list
set number
"set wrap
"set textwidth=0
set colorcolumn=80
set t_vb=
"set novisualbell
"set listchars=tab:>>-,trail:-,extends:>>,precedes:<<,nbsp:%,eol:
"------------------------------------------------------------------------------
"
"
"---------- マクロ、キーボード設定 ---------------------------------------------
inoremap jj <Esc>
vnoremap v $h
"------------------------------------------------------------------------------
"
"
"
"------------------------------------------------------------------------------
" NeoBundleによるプラグインの管理
" プラグインを記述してvimを開き":NeoBundleInstall"を実行する
" 削除するときは、記述を消去して":NeoBundleClean"を実行する
"------------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"---------- NeoBundleによるプラグインの追加
"
NeoBundle 'Shougo/neobundle.vim'  " NeoBundle plugin
NeoBundle 'Shougo/vimproc'        " 
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'SingleCompile'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Rip-Rip/clang_complete' " clang_complete 
NeoBundle 'Pydiction'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'jceb/vim-hier'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'vim-jp/cpp-vim'

" カラースキームの追加
NeoBundle 'altercation/vim-colors-solarized'

"--------------------------------------------------------------------
" シンタックスチェック(scrooloose/syntastic)
"--------------------------------------------------------------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

let g:hier_highlight_group_qf="ucurl_my"
nnoremap <Space>hiu :HierUpdate<CR>
nnoremap <Space>hiu :HierClear<CR>

let g:quickrun_config = {
      \   "_" : {
      \       "outputter" : "error",
      \       "outputter/error/success" : "buffer",
      \       "outputter/error/error"   : "quickfix",
      \       "outputter/buffer/split" : ":botright 8sp",
      \       "outputter/quickfix/open_cmd" : "copen",
      \       "runner" : "vimproc",
      \       "runner/vimproc/updatetime" : 500,
      \   },
      \   "cpp" : {
      \       "type" : "cpp/clang++",
      \       "cmdopt" : "-std=c++11 -ID:/home/cpp/boost/boost_1_55_0",
      \   },
      \}
let g:hier_enabled=1
let g:syntastic_cpp_compiler_options='-std=c++11' " c++11文法に対応

""" エラーに下線を引いてくれる設定
"execute "highlight qf_error_ucurl gui=undercurl guisp=Red"
"let g:hier_highlight_group_qf = "qf_error_ucurl"

"let s:silent_quickfix = quickrun#outputter#quickfix#new()
"function! s:silent_quickfix.finish(session)
"  call call(quickrun#outputter#quickfix#new().finish, [a:session], self)
"  :cclose
"  " vim-hierの更新
"  :HierUpdate
"  :QuickfixStatusEnable
"endfunction
"
"call quickrun#register_outputter("silent_quickfix", s:silent_quickfix)

"--------------------------------------------------------------------
" Python Complete
"--------------------------------------------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete
filetype plugin on
let g:python_location = '/home/toshihiko/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height =3

"--------------------------------------------------------------------
" C/C++ Complete 
"--------------------------------------------------------------------

" include 補完設定
let g:neocomplcache_include_paths = {
  \ 'cpp'    : '.,/usr/include/c++/4.7',
  \ 'c'      : '.,/usr/include',
  \ 'python' : '/usr/lib/python2.7/dist-packages\'
  \ }
" pythonのinclude_patternはこれでいいのか？
let g:neocomplcache_include_patterns = {
  \ 'cpp'    : '^\s*#\s*include',
  \ 'python' : '^\s*\<import\',
  \ }

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
endif

let g:neocomplcache_force_overwrite_completefunc = 1
let g:clang_complete_auto = 0 " オートコンプリートは切る
let g:clang_auto_select = 0
let g:clang_use_library = 1
let g:clang_complete_copen = 1

let g:clang_library_path = '/usr/lib/llvm-3.2/lib/'
"let g:clang_user_options = '-std=c++11 -stdlib=libc++'
"let g:neocomplcache_clang_user_options = 
"  \ '-I /usr/include'.
"  \ '-I /usr/include/c++'.
"  \ '-I /usr/include/c++/4.7'
"let g:clang_user_options = '|| exit 0'
let g:neocomplcache_force_omni_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objcpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'



filetype plugin indent on     " required!
filetype indent on
syntax enable
set background=dark
"colorscheme solarized
