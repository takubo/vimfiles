scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:


if !has('win32') && !has('win64')
  finish
endif

let s:home = 'C:/cygwin/home/' . $USERNAME
if $HOME == s:home
  " cygwinから起動されたときは、この後の設定を実施すると二重になる。
  finish
endif


" $HOMEの設定
if isdirectory(s:home)
  let $HOME=s:home
endif

" ファイル名の展開にスラッシュを使う
set shellslash

" PATHの追加
let $PATH.=';C:\cygwin\bin'

" Shellの設定
set sh=C:\cygwin\bin\zsh

" ! や :! 等のコマンドを実行するためにシェルに渡されるフラグ。
" 末尾のスペースは必要!!
set shellcmdflag=-c\ 

" ! や :! 等のコマンドでコマンドをシェルに渡すときに、コマンドを囲む引用符(の列)。
set shellxquote=\"

" runtimepathの追加
exe 'set runtimepath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/'
exe 'set runtimepath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/after'

" packpathの追加
exe 'set packpath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/'
exe 'set packpath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/after'
