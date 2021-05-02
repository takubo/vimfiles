scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if !exists('loaded_BrowserJump')
  finish
endif
let loaded_BrowserJump = v:true

let s:save_cpo = &cpo
set cpo&vim


let g:BrowserJump_JumpToOrgPos = get(g:, 'BrowserJump_JumpToOrgPos', v:false)


function! BrowserJump#Back()
  if s:update_jumplist() || w:BrowserJumpTop
    exe 'normal! ' . line('.') . 'G'
    call s:update_jumplist()
    let w:BrowserJumpTop = v:false
  endif

  if w:BrowserJumpNowIndex > 0
    let w:BrowserJumpNowIndex -= 1
    call s:jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! BrowserJump#Foward()
  if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
    " 現在位置に戻って来れるように更新
    let ind = w:BrowserJumpNowIndex
    let w:BrowserJumpList[ind]['lnum'] = line('.')
    let w:BrowserJumpList[ind]['col'] = col('.')

    let w:BrowserJumpNowIndex += 1
    call s:jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! s:jump(n)
  silent exe 'buffer ' . w:BrowserJumpList[a:n]['bufnr']
  if !g:BrowserJump_JumpToOrgPos
    " getjumplist()で取得できる桁は、なぜか1小さいので+1する。
    call setpos('.', [0, w:BrowserJumpList[a:n]['lnum'], w:BrowserJumpList[a:n]['col'] + 1, w:BrowserJumpList[a:n]['coladd']])
  else
    " getjumplist()で取得できる桁は、なぜか1小さいので+1する。
    let cell = split(w:BrowserJumpList[a:n]['org']) " TODO
    call setpos('.', [0, cell[1], cell[2] + 1, 0])
  endif
  clearjumps
endfunction


function! s:update_jumplist()
  let new_jump_list = getjumplist()[0]

  silent clearjumps

  if new_jump_list != []
    if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
      call remove(w:BrowserJumpList, w:BrowserJumpNowIndex + 1, -1)
    endif

    let w:BrowserJumpList += new_jump_list

    let w:BrowserJumpNowIndex = len(w:BrowserJumpList) - 1
    return v:true
  endif
  return v:false
endfunction


function! BrowserJump#History()
  let w:BrowserJumpTop = (w:BrowserJumpTop || s:update_jumplist())
  for i in range(0, len(w:BrowserJumpList) - 1)
    let jump_list = w:BrowserJumpList[i]
    echo printf('%3d %s %5d %3d %s',
              \ i,
              \ w:BrowserJumpNowIndex == i ? w:BrowserJumpTop ? '?' : '>' : ' ',
              \ jump_list['lnum'],
              \ jump_list['bufnr'],
              \ bufname(jump_list['bufnr'])
              \ )
  endfor
  echo ' ' ((w:BrowserJumpNowIndex < 0 || len(w:BrowserJumpList) <= w:BrowserJumpNowIndex) ? w:BrowserJumpNowIndex : '')
endfunction


function! BrowserJump#ToggleOrgPos()
  let g:BrowserJump_JumpToOrgPos = !g:BrowserJump_JumpToOrgPos
  echo 'BrowserJump: ' . (g:BrowserJump_JumpToOrgPos ? '' : 'No ') . 'JumpToOrgPos'
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
