rem �����N�����ꏊ�ֈړ�����
C:
rem cd C:\cygwin*\home\%USERNAME%
cd C:\cygwin64\home\%USERNAME%
rem �������̓n�[�h�����N�łȂ��Ă悢�̂��A�v�m�F�B
mklink .vimrc vimfiles\.vimrc
mklink .gvimrc vimfiles\.gvimrc


rem �����N�����ꏊ�ֈړ�����
C:
cd C:\Users\%USERNAME%\bin\vim*-kaoriya-win64\
mklink /H vimrc_local.vim C:\cygwin64\home\%USERNAME%\vimfiles\vimrc_local.vim
mklink /H startuptime.bat C:\cygwin64\home\%USERNAME%\vimfiles\startuptime.bat


rem DOS��������s�����Ƃ��̂��߂ɖ߂�
C:
rem cd C:\cygwin*\home\%USERNAME%
cd C:\cygwin64\home\%USERNAME%\vimfiles


pause
