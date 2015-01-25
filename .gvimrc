" colorscheme
if !(has("win32") || has("win32unix"))
  " gvim for unix  
  colorscheme "hybrid"
  set showtabline=2
  set guifont=Monospace\ 10
elseif has("mac")
  colorscheme "jellybeans"
else
  " gvim for windows
  colorscheme jellybeans
  set gfn=Ricty_Diminished:h13.5:cSHIFTJIS
  set antialias
  set showtabline=2
  set transparency=150
endif
