rem ƒŠƒ“ƒN‚ğì‚éêŠ‚ÖˆÚ“®‚·‚é
C:
rem cd C:\cygwin*\home\%USERNAME%
cd C:\cygwin64\home\%USERNAME%
mklink .vimrc vimfiles\.vimrc
mklink .gvimrc vimfiles\.gvimrc


rem ƒŠƒ“ƒN‚ğì‚éêŠ‚ÖˆÚ“®‚·‚é
C:
cd C:\Users\%USERNAME%\bin\vim*-kaoriya-win64\
mklink vimrc_local.vim C:\cygwin64\home\%USERNAME%\vimfiles\vimrc_local.vim
mklink startuptime.bat C:\cygwin64\home\%USERNAME%\vimfiles\startuptime.bat


pause
