scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if !has('win32') && !has('win64')
  finish
endif


" ファイル名の展開にスラッシュを使う
set shellslash

" $HOMEの設定
let s:home = 'C:/cygwin/home/' . $USERNAME
if isdirectory(s:home)
  let $HOME=s:home
endif

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
