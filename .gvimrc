" colorscheme
if !(has("win32") || has("win32unix") || has("mac"))
  " gvim for unix  
  "colorscheme "jellybeans"
  set showtabline=2
  set guifont=Monospace\ 10
elseif has("mac")
  " gvim for mac
  colorscheme jellybeans
else
  " gvim for windows
  colorscheme jellybeans
  set gfn=Ricty_Diminished:h13.5:cSHIFTJIS
  set antialias
  set showtabline=2
  set transparency=150
endif
