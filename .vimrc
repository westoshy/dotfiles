""" viのvim互換ではなくvimとして動作させる
set nocompatible
" ファイルタイプ関連を無効化する
filetype off

"---------------------------------------------------------------------------
" エディタの設定
"---------------------------------------------------------------------------
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
set softtabstop=2
"set foldmethod=indent
"set foldlevel=0
set foldnestmax=1
autocmd FileType cpp setlocal foldmethod=syntax
"setlocal foldmethod=syntax """ 
set statusline=2


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

" display -----------------------------------------------------------
"set list
set number " display row numbers
"set wrap
set textwidth=80   " force a line break
set colorcolumn=80 " display colum line
set t_vb=
"set novisualbell
"set listchars=tab:>>-,trail:-,extends:>>,precedes:<<,nbsp:%,eol:

" mouse keyboard ----------------------------------------------------
inoremap jj <Esc>
vnoremap v $h

"noremap ; :
"noremap : ;
"--------------------------------------------------------------------
" Plugin Management with NeoBundle
" :NeoBundleInstall, :NeoBundleClean"
"
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/')) 
  call neobundle#end()
endif

NeoBundle 'Shougo/neobundle.vim'  " NeoBundle plugin
NeoBundle 'Shougo/vimproc'        " 
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'SingleCompile'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Rip-Rip/clang_complete' " clang_complete 
"NeoBundle 'Pydiction'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'jceb/vim-hier'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'davidhalter/jedi-vim'

NeoBundle 'itchyny/lightline.vim'


set laststatus=2
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" カラースキームの追加
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'

"--------------------------------------------------------------------
" シンタックスチェック(scrooloose/syntastic)
"--------------------------------------------------------------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

let g:hier_highlight_group_qf="ucurl_my"
nnoremap <Space>hiu :HierUpdate<CR>
nnoremap <Space>hiu :HierClear<CR>

let g:quickrun_config = {
  \  "_" : {
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

"--------------------------------------------------------------------
" Python Complete
"--------------------------------------------------------------------
"autocmd FileType python set omnifunc=pythoncomplete#Complete
""autocmd FileType python let g:python_location='~/.vim/bundle/Pydiction/complete-dict'
"autocmd FileType python let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
"autocmd FileType python setl autoindent
"autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl expandtab tabstop=2 sw=2 softtabstop=2
""setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"NeoBundleLazy "davidhalter/jedi-vim",{
"  \ "autoload": {
"  \   "filetypes":["python","python3","djangohtml"]
"  \ },
"  \ "build": {
"  \   "mac":  "pip install jedi",
"  \   "unix": "pip install jedi",
"  \}}
"let s:hooks=neobundle#get_hooks("jedi-vim")
"function! s:hooks.on_source(bundle)
" jediにvimの設定を任せると'compliteopt+=preview'するので
" 自動設定機能をoffにして手動で設定する



" 補完の最初の項目が選択された状態をoffにする
"let g:jedi#popup_select_first=0
" quickrunと被るため大文字に変更
"let g:jedi#rename_command='<Leader>R'
"let g:jedi#popup_on_dot=1
autocmd FileType python let b:did_ftplugin=1
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_select_first=0
let g:jedi#auto_vim_configuration=0
"autocmd FileType python setlocal completeopt-=preview

"--------------------------------------------------------------------
" C/C++ Complete 
"--------------------------------------------------------------------

" include 補完設定
let g:neocomplcache_include_paths = {
  \ 'cpp'    : '.,/usr/include/c++/4.8/,~/Development/Cplusplus/include',
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

let g:clang_library_path = '/usr/lib/llvm-3.4/lib'
"let g:clang_user_options = '-std=c++11 -stdlib=libc++'
"let g:neocomplcache_clang_user_options = 
"  \ '-I /usr/include'.
"  \ '-I /usr/include/c++'.
"  \ '-I /usr/include/c++/4.8'
"let g:clang_user_options = '|| exit 0'
let g:neocomplcache_force_omni_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objcpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"-------------------------------------------------------------------
" vim R plugin
"-------------------------------------------------------------------
let g:vimrplugin_term="terminator"
let g:vimrplugin_term_cmd="terminator --title R -e"
let g:vimrplugin_r_path="/usr/bin/R"
let g:vimrplugin_allnames=1
let g:vimrplugin_show_args=1

if has("gui_running")
  inoremap <C-Space> <C-x><C-o>
else
  inoremap <Nul> <C-x><C-o>
endif
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

"--- タブでomni補完を行う
function InsertTabWrapper(type)
  let col = col('.') - 1
  "omni補完の場合、omini以外にも上下左右の移動もする
  if a:type=='omni'
    if pumvisible()
      return "\<c-n>"
    endif
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
      return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
      return "\<c-n>"
    else
      return "\<c-x>\<c-o>"
    endif
"keywordの場合、該当のとき以外は何もしない
  else
    if pumvisible() || !col || getline('.')[col - 1] !~ '\k\|<\|/'
      return ""
    else
      return "\<c-x>\<c-p>"
    endif
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper('omni')<cr><c-r>=InsertTabWrapper('keyword')<cr>
"--------------------------------------------------------

" Ctrl+e launches NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Display Zenkaku Space -------------------------
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
"------------------------

filetype plugin indent on     " required!
filetype indent on
syntax enable
set background=dark
set t_Co=16
"let g:solarized_termtrans=1
"let g:solarized_termcolors=16
"colorscheme solarized
colorscheme hybrid-light
