rem リンクを作る場所へ移動する
C:
rem cd C:\cygwin*\home\%USERNAME%
cd C:\cygwin64\home\%USERNAME%
mklink .vimrc vimfiles\.vimrc
mklink .gvimrc vimfiles\.gvimrc


rem リンクを作る場所へ移動する
C:
cd C:\Users\%USERNAME%\bin\vim*-kaoriya-win64\
mklink vimrc_local.vim C:\cygwin64\home\%USERNAME%\vimfiles\vimrc_local.vim
mklink startuptime.bat C:\cygwin64\home\%USERNAME%\vimfiles\startuptime.bat


pause
