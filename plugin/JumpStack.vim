scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if exists('loaded_JumpStack')
  finish
endif
let loaded_JumpStack = v:true

let s:save_cpo = &cpo
set cpo&vim


function! s:init_win()
  let w:JumpStack = []
  " 履歴がないとき、w:JumpStackNowIndex は len(w:JumpStack) となっていないといけない。
  " 履歴がない状態でForwardされても実行させないためにも、初期値は0でないといけない。
  let w:JumpStackNowIndex = 0
endfunction


augroup JumpStack
  au!
  au WinNew * call s:init_win()
  " WinNew not fire for the windows created when Vim starts.
  au VimEnter * exe 'tabdo windo call s:init_win()' | tabfirst | 1 wincmd w
augroup end


com! -nargs=0 JumpStackBack         call JumpStack#Back()
com! -nargs=0 JumpStackFoward       call JumpStack#Foward()
com! -nargs=0 JumpStackHistory      call JumpStack#History()


nnoremap <silent> <Plug>(JumpStack-Back)         :<C-u>JumpStackBack<CR>
nnoremap <silent> <Plug>(JumpStack-Foward)       :<C-u>JumpStackFoward<CR>
nnoremap <silent> <Plug>(JumpStack-Disp)         :<C-u>JumpStackHistory<CR>


let &cpo = s:save_cpo
unlet s:save_cpo
