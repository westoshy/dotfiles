let OSTYPE=system('uname')
" cygwin: OSTYPE=="CYGWIN_NT-6.1\n"
" linux : OSTYPE=="Linux\n"
" mac   : OSTYPE=="Darwin\n"

filetype off
filetype plugin indent off

set ignorecase "do not distinguish Capital Charecters
set smartcase "if capital character is input, search 
set incsearch
set hlsearch
set shiftround
set infercase
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
set foldnestmax=1
autocmd FileType cpp setlocal foldmethod=syntax
set statusline=2
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
let IM_vi_CooperativeMode = has('gui_running') ? 0 : 1
" set timeout timeoutlen=3000 ttimeoutlen=100
set cmdheight=2
set statusline+=%{IMStatus(`JpFixedMode`)}
function! IMStatus(...)
  return ''
endfunction

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
set number " display row numbers
set textwidth=80   " force a line break
set colorcolumn=80 " display colum lin

" mouse keyboard ----------------------------------------------------
inoremap jj <Esc>
vnoremap v $h
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
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'SingleCompile'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'jceb/vim-hier'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'davidhalter/jedi-vim'

NeoBundle 'itchyny/lightline.vim'

NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'

if OSTYPE != "CYGWIN_NT-6.1\n"
  echo "aa"
  NeoBundle 'koron/imcsc-vim', {
         \ "rtp" : "uim-ctlso",
         \}
  NeoBundle 'fuenor/im_control.vim'
endif

" Previm --------------------------------------------------
autocmd BufRead, BufNewFile *.mkd setfiletype mkd
autocmd BufRead, BufNewFile *.md  setfiletype mkd
let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

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


NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'

"--------------------------------------------------------------------
" Syntax check (scrooloose/syntastic)
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
let g:syntastic_cpp_compiler_options='-std=c++11' 

"--------------------------------------------------------------------
" Python
"--------------------------------------------------------------------
autocmd FileType python let b:did_ftplugin=1
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_select_first=0
let g:jedi#auto_vim_configuration=0

"--------------------------------------------------------------------
" Ruby
"--------------------------------------------------------------------
NeoBundleLazy 'marcus/rsense', {
      \ 'autoload': {
      \   'filetypes': 'ruby',
      \ },
      \}
NeoBundle 'supermomonga/neocomplete-rsense.vim', {
      \ 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],
      \}
let g:rsenseUseOmniFunc = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'


"--------------------------------------------------------------------
" C/C++
"--------------------------------------------------------------------

let g:marching_backend = "sync_clang_command"
let g:marcing_clang_command_option="-std=c++11"
let g:marching_enable_neocomplete=1

let g:marching_include_paths = [
  \ "~/Developments/Cplusplus/publiclib/include/"
  \]

let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_ignore_case=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#skip_auto_completion_time=""
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

"-------------------------------------------------------------------
" R
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
syntax enable
set background=dark
set t_Co=16
"let g:solarized_termtrans=1
"let g:solarized_termcolors=16
"colorscheme solarized
colorscheme hybrid-light
