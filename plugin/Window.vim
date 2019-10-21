scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab :

if exists('loaded_Window')
  "finish
endif
let loaded_Window = v:true

let s:save_cpo = &cpo
set cpo&vim



"----------------------------------------------------------------------------------------
" Focus

" Basic
nnoremap <silent> <Plug>(Window-Focus-SkipTerm-Inc) <Esc>:exe Window#Focus#SkipTerm(+1) . ' wincmd w'<CR>
nnoremap <silent> <Plug>(Window-Focus-SkipTerm-Dec) <Esc>:exe Window#Focus#SkipTerm(-1) . ' wincmd w'<CR>



let &cpo = s:save_cpo
unlet s:save_cpo
