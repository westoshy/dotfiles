"--------------------------------------------------------------------
" Check System
" if has('win32')     : windows 32bit system
" if has('win32unix') : cygwin
" if has('mac')       : Mac OS
" if has('unix')      : Linux OS
"--------------------------------------------------------------------

filetype off
filetype plugin indent off

source $HOME/dotfiles/.vimrc.general
source $HOME/dotfiles/.vimrc.neobundle
source $HOME/dotfiles/.vimrc.utils
source $HOME/dotfiles/.vimrc.colors
source $HOME/dotfiles/.vimrc.statusbar

source $HOME/dotfiles/.vimrc.markdown
source $HOME/dotfiles/.vimrc.syntax
source $HOME/dotfiles/.vimrc.complete

"--------------------------------------------------------------------
" Plugin Management with NeoBundle
" :NeoBundleInstall, :NeoBundleClean"
"
" if has('vim_starting')
"   set runtimepath+=~/.vim/bundle/neobundle.vim
"   call neobundle#begin(expand('~/.vim/bundle/')) 
"   call neobundle#end()
" endif
"
" NeoBundle 'Shougo/neobundle.vim'  " NeoBundle plugin
" NeoBundle 'Shougo/vimproc', {
"   \ 'build': {
"   \ 'windows': 'echo "Sorry, cannot update"',
"   \ 'cygwin' : 'make -f make_cygwin.mak',
"   \ 'mac'    : 'make -f make_mac.mak',
"   \ 'unix'   : 'make -f make_unix.mak',
"   \ },
"   \}
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'SingleCompile'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'tomtom/tcomment_vim'
"NeoBundle 'osyo-manga/vim-marching'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'jceb/vim-hier'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'davidhalter/jedi-vim'

"NeoBundle 'itchyny/lightline.vim'

NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'

if !(has('win32unix') || has('win32') || has('mac'))
  NeoBundle 'koron/imcsc-vim', {
         \ "rtp" : "uim-ctlso",
         \}
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

" Color Scheme
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'nanotech/jellybeans.vim'

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
"nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Display Zenkaku Space -------------------------
" function! ZenkakuSpace()
"   highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" endfunction
"
" if has('syntax')
"   augroup ZenkakuSpace
"     autocmd!
"     autocmd ColorScheme * call ZenkakuSpace()
"     autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
"   augroup END
"   call ZenkakuSpace()
" endif
"------------------------

filetype plugin indent on     " required!
syntax enable
"set background=dark
"set t_Co=16
"let g:solarized_termtrans=1
"let g:solarized_termcolors=16
"colorscheme solarized
"colorscheme hybrid-light
