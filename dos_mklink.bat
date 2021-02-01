rem リンクを作る場所へ移動する
C:
rem cd C:\cygwin*\home\%USERNAME%
cd C:\cygwin64\home\%USERNAME%
rem こっちはハードリンクでなくてよいのか、要確認。
mklink .vimrc vimfiles\.vimrc
mklink .gvimrc vimfiles\.gvimrc


rem リンクを作る場所へ移動する
C:
cd C:\Users\%USERNAME%\bin\vim*-kaoriya-win64\
mklink /H vimrc_local.vim C:\cygwin64\home\%USERNAME%\vimfiles\vimrc_local.vim
mklink /H startuptime.bat C:\cygwin64\home\%USERNAME%\vimfiles\startuptime.bat


rem DOS窓から実行したときのために戻る
C:
rem cd C:\cygwin*\home\%USERNAME%
cd C:\cygwin64\home\%USERNAME%\vimfiles


pause
