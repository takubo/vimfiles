scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_PushposPopPos')
  finish
endif
let g:loaded_PushposPopPos = 1

let s:save_cpo = &cpo
set cpo&vim



"" データ構造定義 """"""""""""""""
"  dict {
"    'TopRow' : #;
"    'Cursor' : [];
"  } s:SavePos[スタック];
""""""""""""""""""""""""""""""""""

let s:SavePos = []


function! PushPos()
  " 画面最上行番号取得 (インデックス1が行番号)
  let toprow = getpos('w0')[1]

  " カーソル位置取得
  let cursor = getcurpos()

  " スタックへ保存
  call add(s:SavePos, {'TopRow' : toprow, 'Cursor' : cursor})
endfunction


function! ApplyPos()
  " " スタックが空なら何もしない
  " if empty(s:SavePos) | return | endif

  " silentを付けて回る!!!!!!

  " スタックトップの要素を取得
  let savepos = get(s:SavePos, len(s:SavePos)- 1)

  " 画面最上行番号を復帰
  " scrolloffを一旦0にしないと、上手く設定できない。
  let save_scrolloff = &scrolloff
  let &scrolloff = 0
  exe "normal! " . savepos['TopRow'] . "zt"
  let &scrolloff = save_scrolloff

  " カーソル位置を復帰
  call setpos('.', savepos['Cursor'])
endfunction


function! DropPos()
  " " スタックが空なら何もしない
  " if empty(s:SavePos) | return | endif

  " スタックトップの要素を除去
  call remove(s:SavePos, len(s:SavePos)- 1)
endfunction


function! PopPos()
  call ApplyPos()
  call DropPos()
endfunction



" ---------------
" PushPos_All:
" ---------------
function! PushPos_All()
    PushPos
    let g:now_buf = bufnr('')
    let g:now_win = winnr()
    let g:now_tab = tabpagenr()
endfunction


" ---------------
" PopPos_All:
" ---------------
function! PopPos_All()
    silent exe 'tabnext ' . g:now_tab
    silent exe g:now_win . 'wincmd w'
    silent exe 'buffer ' . g:now_buf
    PopPos
endfunction



com! PushPos :call PushPos()
com! ApplyPos :call ApplyPos()
com! DropPos :call DropPos()
com! PopPos :call PopPos()

com! PushPosAll :call PushPos_All()
com! PopPosAll :call PopPos_All()



let &cpo = s:save_cpo
unlet s:save_cpo
