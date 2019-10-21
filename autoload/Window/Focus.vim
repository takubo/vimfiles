scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab :

if !exists('loaded_Window')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim



"----------------------------------------------------------------------------------------
" Skip Terminal

function! Window#Focus#SkipTerm(direction)
  "Window番号を指定されていたら、そのWindowへ移動。
  if v:prevcount | return v:prevcount | endif

  "windowが2つしかないなら、もう一方へ移動することは自明なので、terminalであっても移動を許す。
  if winnr('$') == 2 | return winnr() == 1 ? 2 : 1 | endif

  let terms = term_list()
  let next_win = winnr()

  for i in range(winnr('$'))
    if a:direction >= 0
      let next_win = ( next_win == winnr('$') ? 1 : next_win + 1 )  "順方向
    else
      let next_win = ( next_win == 1 ? winnr('$') : next_win - 1 )  "逆方向
    endif
    let nr = winbufnr(next_win)
    if count(terms, nr) < 1 || term_getstatus(nr) =~# 'normal' | return next_win | endif
  endfor
endfunction



let &cpo = s:save_cpo
unlet s:save_cpo
