scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_Emergency_Mru')
  finish
endif
let g:loaded_Emergency_Mru = 1

let s:save_cpo = &cpo
set cpo&vim


" mru.vimが存在しないとき用

command! -nargs=* MRU2 exe 'browse filter %\c' . substitute(<q-args>, '[ *]', '.*', 'g') . '% oldfiles'
" nnoremap <Leader>o  :<C-u>/ oldfiles<Home>browse filter /\c


let &cpo = s:save_cpo
unlet s:save_cpo
