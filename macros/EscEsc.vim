scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_EscEsc')
  finish
endif
let g:loaded_EscEsc = 1

let s:save_cpo = &cpo
set cpo&vim


let s:EscEsc = []


function! EscEsc_Add(str)
  call add(s:EscEsc, a:str)
endfunction


function! EscEsc_Exe()
  for i in s:EscEsc
    "echo i
    exe i
  endfor
endfunction


" 'noh'はユーザ定義関数内では(事実上)実行出来ないので、別途実行の要あり。
nnoremap <silent> <Plug>(EscEsc) :<C-u>call EscEsc_Exe() <Bar> noh  <Bar> echon <CR>


com! EscDisp echo s:EscEsc


let &cpo = s:save_cpo
unlet s:save_cpo
