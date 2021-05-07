scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if !exists('loaded_BrowserJump')
  finish
endif
let loaded_BrowserJump = v:true

let s:save_cpo = &cpo
set cpo&vim


function! BrowserJump#Back()
  call s:update_jumplist()

  if w:BrowserJumpNowIndex > 0
    " 既に最古の履歴箇所に居るときは、何もしない。

    if w:BrowserJumpNowIndex == len(w:BrowserJumpList)
      " 現在位置を登録するために、要素を1つ追加しておく。
      " 上のupdate_jump()で新規登録があった場合、この時点で、Indexはlen(JumpList)となっている。 (つまり、Indexは1大きい。)
      " バッファ番号はここで登録しておく。行桁は仮の番号であり、下のs:update_curpos()で正しい値が登録される。
      call add(w:BrowserJumpList, {'bufnr':bufnr(), 'lnum':0, 'col':0, 'coladd':0})
    endif

    " 現在位置に戻って来れるように履歴を更新しておく。
    " 今回、最新の現在位置を追加したときは、ここが行桁を登録する場所となる。
    " 現在位置に戻って来れるように履歴を更新しておく。
    call s:update_curpos()

    " Back動作実行
    let w:BrowserJumpNowIndex -= 1
    call s:exe_jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! BrowserJump#Foward()
  if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
    " 既に最新の履歴箇所に居るときは、何もしない。

    " 現在位置に戻って来れるように履歴を更新しておく。
    call s:update_curpos()

    " Forward動作実行
    let w:BrowserJumpNowIndex += 1
    call s:exe_jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! BrowserJump#History()
  call s:update_jumplist()

  for i in range(0, len(w:BrowserJumpList) - 1)
    let jump_list = w:BrowserJumpList[i]
    echo printf('%3d %s %5d %3d %s',
              \ i,
              \ w:BrowserJumpNowIndex == i ? '>' : ' ',
              \ jump_list['lnum'],
              \ jump_list['bufnr'],
              \ bufname(jump_list['bufnr'])
         \ )
  endfor

  " 上のupdate_jump()で新規登録があった場合、この時点で、IndexはJumpListの範囲外を指している。
  " この場合、現在位置が最新の履歴になる可能性がある。
  if w:BrowserJumpNowIndex == len(w:BrowserJumpList)
    echo '    >'
  endif
endfunction


function! s:update_curpos()
  let now_idx = w:BrowserJumpNowIndex

  if !has_key(w:BrowserJumpList[now_idx], 'org_lnum')
    let w:BrowserJumpList[now_idx]['org_lnum']   = w:BrowserJumpList[now_idx]['lnum']
    let w:BrowserJumpList[now_idx]['org_col']    = w:BrowserJumpList[now_idx]['col']
    let w:BrowserJumpList[now_idx]['org_coladd'] = w:BrowserJumpList[now_idx]['coladd']
  endif

  let cur_pos = getpos('.')

  let w:BrowserJumpList[now_idx]['lnum'] = cur_pos[1]
  let w:BrowserJumpList[now_idx]['col'] = cur_pos[2]
  let w:BrowserJumpList[now_idx]['coladd'] = cur_pos[3]
endfunction


function! s:update_jumplist()
  let new_jump_list = getjumplist()[0]

  silent clearjumps

  if !empty(new_jump_list)
    if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
      call remove(w:BrowserJumpList, w:BrowserJumpNowIndex + 1, -1)
    endif

    let w:BrowserJumpList += new_jump_list

    let w:BrowserJumpNowIndex = len(w:BrowserJumpList)
    " この時点では、w:BrowserJumpNowIndexは、リストの範囲外を指している。
    " Backから呼ばれているなら、Back()内ですぐに是正される。
  endif
endfunction


function! s:exe_jump(n)
  " カーソルをsetpos()するときは、バッファ指定は無視されるので、先にバッファを変更しておく。
  silent exe 'buffer ' . w:BrowserJumpList[a:n]['bufnr']

  " getjumplist()で取得できる桁は、なぜか1小さいので+1する。
  call setpos('.', [0, w:BrowserJumpList[a:n]['lnum'], w:BrowserJumpList[a:n]['col'] + 1, w:BrowserJumpList[a:n]['coladd']])

  " 今回のジャンプを忘れる (バッファ移動を伴うと、jumplistへ記録されてしまう。)
  clearjumps
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
