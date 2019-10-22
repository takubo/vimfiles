scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab :

if !exists('loaded_Window')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim



"----------------------------------------------------------------------------------------
" Equal Only Height

function! Window#Resize#EqualOnlyHeight()
  let winfixwidth_save = range(winnr('$') + 1)  " 要素0は使われない。
  call PushPos_All()
  windo let winfixwidth_save[winnr()] = &l:winfixwidth
  windo let &l:winfixwidth = 1
  wincmd =
  windo let &l:winfixwidth = winfixwidth_save[winnr()]
  call PopPos_All()
endfunction



"----------------------------------------------------------------------------------------
" Equal Only Width
"
function! Window#Resize#EqualOnlyWidth()
  let winfixheight_save = range(winnr('$') + 1)  " 要素0は使われない。
  call PushPos_All()
  windo let winfixheight_save[winnr()] = &l:winfixheight
  windo let &l:winfixheight = 1
  wincmd =
  windo let &l:winfixheight = winfixheight_save[winnr()]
  call PopPos_All()
endfunction



"----------------------------------------------------------------------------------------
" Optimal Width

function! Window#Resize#SetOptimalWidth()
  let top = line('w0')
  let bot = line('w$')

  let max = 0
  for i in range(top, bot)
    "echo i virtcol([i, '$'])
    let max = max([max, virtcol([i, '$'])])
  endfor
  echo 'Width: ' . max

  ""let range(top, bot)
  "let lines = map( , virtcol([i, '$']) )
  "echo lines

  if bufname(0) =~ '^NERD_tree'
    let max -= 2
  endif

  exe max + (&number || &l:number || &relativenumber || &l:relativenumber ? 5 : 0) . ' wincmd |'
endfunction



"----------------------------------------------------------------------------------------
" Optimal Height

function! Window#Resize#SetOptimalHeight()
  "TODO
  " バッファ全体を表示
  " 関数全体を表示
  " ブロック全体を表示
  " #ifブロック全体を表示
endfunction



let &cpo = s:save_cpo
unlet s:save_cpo
