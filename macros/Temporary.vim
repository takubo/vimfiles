scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_Temporary')
  finish
endif
let g:loaded_Temporary = 1

let s:save_cpo = &cpo
set cpo&vim



"nnoremap <silent><expr> <leader>. stridx(&isk, '.') < 0 ? ':<C-u>setl isk+=.<CR>' : ':<C-u>setl isk-=.<CR>'
"nnoremap <silent><expr> <leader>, stridx(&isk, '_') < 0 ? ':<C-u>setl isk+=_<CR>' : ':<C-u>setl isk-=_<CR>'
"nnoremap <silent><expr> <leader>u stridx(&isk, '_') < 0 ? ':<C-u>setl isk+=_<CR>' : ':<C-u>setl isk-=_<CR>'



"nnoremap <silent> <leader>t :<C-u>ToggleWord<CR>



"nnoremap <Leader>k :<C-u>let g:clever_f_use_migemo = !g:clever_f_use_migemo<CR>



"nnoremap <silent> ][ ][:FuncNameStl<CR>
"nnoremap <silent> [] []:FuncNameStl<CR>
"nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:call feedkeys(":FuncName\<CR>"')
"nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:FuncName<CR>')



"=====================================================================================================================================
if 0
  " diffのコマンド
  set diffexpr=MyDiff()
  function MyDiff()
    let opt = ""
    if &diffopt =~ "iwhite"
      let opt = opt . "-b "
    endif
    silent execute "!git-diff-normal-format " . opt . v:fname_in . " " . v:fname_new . " > " . v:fname_out
    redraw!
  endfunction
endif
"=====================================================================================================================================



augroup MyVimrc_Rendor
  au!
  "au InsertLeave * normal! <C-l>
  "au CursorHold * normal! <C-l>
  "au CursorHold * call feedkeys(":\<C-u>redraw<CR>", 'nx')
  "au CursorHold * redraw
  "au VimResized * normal! <C-l>
  "au CursorHold * let &renderoptions=&renderoptions
augroup end



"nmap <C-e> <Esc>
"nmap <C-e><C-e> <Esc><Esc>
"vmap <C-e> <Esc>



"nnoremap <silent> <C-u>            :<C-u>vnew<CR>
"nnoremap <C-n>                     <C-w>n
"nnoremap <silent> <C-p>            :<C-u>vnew<CR>



let &cpo = s:save_cpo
unlet s:save_cpo
