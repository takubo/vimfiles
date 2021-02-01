scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if !has('win32')
  finish
endif

" if has('win64')
"   let s:cygwin_root = 'C:/cygwin64'
" else
"   let s:cygwin_root = 'C:/cygwin'
" endif
let s:cygwin_root = isdirectory('C:/cygwin64') ? 'C:/cygwin64' : 'C:/cygwin'


" Shellの設定 (Cygwinでも、なぜか設定しないとbashになる。)
set sh=C:/cygwin64/bin/zsh
exe 'set sh=' . s:cygwin_root . '/bin/zsh'

let s:home = s:cygwin_root . '/home/' . $USERNAME

if substitute($HOME, '\', '/', 'g') == s:home
  " Cygwinから起動されたときの設定 
  " (Cygwinから起動されたときは、$HOMEが最初から設定されていることを利用して判定している。)

  " $TMPを(Cygwinではなく)Windowsのパスにそろえる。
  "let $TMP  = 'C:/Users/' . $USERNAME . '/AppData/Local/Temp'
  "let $TEMP = $TMP

  " cygwinから起動されたときは、これ以降の設定を実施すると二重になる。
  finish
endif

" $HOMEの設定
if isdirectory(s:home)
  let $HOME=s:home
endif

let $LANG = 'ja_JP.UTF-8'

" PATHの追加
let $PATH .= ';' . s:cygwin_root . '/bin;'
let $PATH .= $HOME . '/bin;'

" ファイル名の展開にスラッシュを使う
set shellslash

" ! や :! 等のコマンドを実行するためにシェルに渡されるフラグ。
" 末尾のスペースは必要!!
set shellcmdflag=-c\ 

" ! や :! 等のコマンドでコマンドをシェルに渡すときに、コマンドを囲む引用符(の列)。
set shellxquote=\"

" runtimepathの追加
exe 'set runtimepath+=' . s:home . '/vimfiles/'
exe 'set runtimepath+=' . s:home . '/vimfiles/after'

" packpathの追加
exe 'set packpath+=' . s:home . '/vimfiles/'
exe 'set packpath+=' . s:home . '/vimfiles/after'
