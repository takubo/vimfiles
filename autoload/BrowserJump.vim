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
    let w:BrowserJumpList[ind]['row'] = line('.')
    let w:BrowserJumpList[ind]['col'] = col('.')

    let w:BrowserJumpNowIndex += 1
    call s:jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! s:jump(n)
  silent exe 'buffer ' . w:BrowserJumpList[a:n]['buf_nr']
  if g:BrowserJump_JumpToOrgPos
    " jumspで取得できる桁はなぜか、1小さいので+1する。
    call setpos('.', [0, w:BrowserJumpList[a:n]['row'], w:BrowserJumpList[a:n]['col'], 0])
  else
    " jumspで取得できる桁はなぜか、1小さいので+1する。
    let cell = split(w:BrowserJumpList[a:n]['org'])
    call setpos('.', [0, cell[1], cell[2] + 1, 0])
  endif
  clearjumps
endfunction


function! s:update_jumplist()
  let new_jump_list = CommnadOutputLine('jumps')[1:-2]
  silent clearjumps
  "echo len(new_jump_list) new_jump_list

  if new_jump_list != []
    if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
      call remove(w:BrowserJumpList, w:BrowserJumpNowIndex + 1, -1)
    endif

    for li in new_jump_list
      " バッファ番号も覚えておく。
      let cell = split(li)
      let bname = join(cell[3:])
      let bn = bufnr(bname)
      let bn = bn >= 0 ? bn : bufnr('%')
      let w:BrowserJumpList += [{ 'org' : li, 'buf_nr' : bn, 'row' : cell[1], 'col' : cell[2] + 1 }]
    endfor

    let w:BrowserJumpNowIndex = len(w:BrowserJumpList) - 1
    return v:true
  endif
  return v:false
endfunction


function! BrowserJump#History()
  let w:BrowserJumpTop = (w:BrowserJumpTop || s:update_jumplist())
  for i in range(0, len(w:BrowserJumpList) - 1)
    echo printf('%3d ', i) (w:BrowserJumpNowIndex == i ? w:BrowserJumpTop ? '?' : '>' : ' ') w:BrowserJumpList[i]['org'] w:BrowserJumpList[i]['buf_nr']
  endfor
  echo ' ' ((w:BrowserJumpNowIndex < 0 || len(w:BrowserJumpList) <= w:BrowserJumpNowIndex) ? w:BrowserJumpNowIndex : '')
endfunction


function! BrowserJump#ToggleOrgPos()
  let g:BrowserJump_JumpToOrgPos = !g:BrowserJump_JumpToOrgPos
  echo 'BrowserJump: ' . (g:BrowserJump_JumpToOrgPos ? '' : 'No ') . 'JumpToOrgPos'
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
