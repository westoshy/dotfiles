let s:save_cpo = &cpo
set cpo&vim

if g:jedi#popup_select_first == 0
  inoremap <buffer> . .<C-R>=jedi#complete_opened() ? "": "\<lt>C-X>\<lt>C-O>\<lt>C-P>"<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
