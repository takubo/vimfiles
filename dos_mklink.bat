C:
cd C:\cygwin\home\%USERNAME%
mklink .vimrc vimfiles\.vimrc
mklink .gvimrc vimfiles\.gvimrc

C:
cd C:\Users\%USERNAME%\bin\vim81-kaoriya-win64\
mklink vimrc_local.vim C:\cygwin\home\%USERNAME%\vimfiles\vimrc_local.vim
mklink startuptime.bat C:\cygwin\home\%USERNAME%\vimfiles\startuptime.bat


pause
