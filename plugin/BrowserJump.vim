scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if exists('loaded_BrowserJump')
  finish
endif
let loaded_BrowserJump = v:true

let s:save_cpo = &cpo
set cpo&vim


function! s:init_win()
  let w:BrowserJumpList = []
  " 履歴がないとき、w:BrowserJumpNowIndex は len(w:BrowserJumpLista) となっていないといけない。
  " 履歴がない状態でForwardされても実行させないためにも、初期値は0でないといけない。
  let w:BrowserJumpNowIndex = 0
endfunction


augroup BrowserJump
  au!
  au WinNew * call s:init_win()
  " WinNew not fire for the windows created when Vim starts.
  au VimEnter * exe 'tabdo windo call s:init_win()' | tabfirst | 1 wincmd w
augroup end


com! -nargs=0 BrowserJumpBack         call BrowserJump#Back()
com! -nargs=0 BrowserJumpFoward       call BrowserJump#Foward()
com! -nargs=0 BrowserJumpHistory      call BrowserJump#History()


nnoremap <silent> <Plug>(BrowserJump-Back)         :<C-u>BrowserJumpBack<CR>
nnoremap <silent> <Plug>(BrowserJump-Foward)       :<C-u>BrowserJumpFoward<CR>
nnoremap <silent> <Plug>(BrowserJump-Disp)         :<C-u>BrowserJumpHistory<CR>
nnoremap <silent> <Plug>(BrowserJump-ToggleOrgPos) :<C-u>BrowserJumpToggleOrgPos<CR>


let &cpo = s:save_cpo
unlet s:save_cpo
