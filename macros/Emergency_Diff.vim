scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_Emergency_Diff')
  finish
endif
let g:loaded_Emergency_Diff = 1

let s:save_cpo = &cpo
set cpo&vim


" FuncNameStlが存在しないとき用

" Next Hunk
nnoremap <silent> t ]c^zz
" Previouse Hunk
nnoremap <silent> T [c^zz
" Top Hunk
nnoremap <silent> <Leader>t gg]c[c^zz
" Bottom Hunk
nnoremap <silent> <Leader>T  G[c]c^zz


let &cpo = s:save_cpo
unlet s:save_cpo
