scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if !has('win32')
  finish
endif


" Shellの設定 (Cygwinでも、なぜか設定しないとbashになる。)
set sh=C:/cygwin/bin/zsh

let s:home = 'C:/cygwin/home/' . $USERNAME

if substitute($HOME, '\', '/', 'g') == s:home
  " Cygwinから起動されたときの設定

  " $TMPを(Cygwinではなく)Windowsのパスにそろえる。
  "let $TMP  = 'C:/Users/' . $USERNAME . '/AppData/Local/Temp'
  "let $TEMP = $TMP

  " cygwinから起動されたときは、この後の設定を実施すると二重になる。
  finish
endif

" $HOMEの設定
if isdirectory(s:home)
  let $HOME=s:home
endif

let $LANG = 'ja_JP.UTF-8'

" PATHの追加
let $PATH .= ';C:/cygwin/bin;'
let $PATH .= $HOME . '/bin;'

" ファイル名の展開にスラッシュを使う
set shellslash

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
