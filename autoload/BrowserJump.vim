scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if !exists('loaded_JumpStack')
  finish
endif
let loaded_JumpStack = v:true

let s:save_cpo = &cpo
set cpo&vim


function! JumpStack#Back()
  call s:update_jumplist()

  if w:JumpStackNowIndex > 0
    " 既に最古の履歴箇所に居るときは、何もしない。

    if w:JumpStackNowIndex == len(w:JumpStack)
      " 現在位置を登録するために、要素を1つ追加しておく。
      " 上のupdate_jump()で新規登録があった場合、この時点で、Indexはlen(JumpList)となっている。 (つまり、Indexは1大きい。)
      " バッファ番号はここで登録しておく。行桁は仮の番号であり、下のs:update_curpos()で正しい値が登録される。
      call add(w:JumpStack, {'bufnr':bufnr(), 'lnum':0, 'col':0, 'coladd':0})
    endif

    " 現在位置に戻って来れるように履歴を更新しておく。
    " 今回、最新の現在位置を追加したときは、ここが行桁を登録する場所となる。
    " 現在位置に戻って来れるように履歴を更新しておく。
    call s:update_curpos()

    " Back動作実行
    let w:JumpStackNowIndex -= 1
    call s:exe_jump(w:JumpStackNowIndex)
  endif
endfunction


function! JumpStack#Foward()
  if w:JumpStackNowIndex < (len(w:JumpStack) - 1)
    " 既に最新の履歴箇所に居るときは、何もしない。

    " 現在位置に戻って来れるように履歴を更新しておく。
    call s:update_curpos()

    " Forward動作実行
    let w:JumpStackNowIndex += 1
    call s:exe_jump(w:JumpStackNowIndex)
  endif
endfunction


function! JumpStack#History()
  call s:update_jumplist()

  for i in range(0, len(w:JumpStack) - 1)
    let jump_list = w:JumpStack[i]
    echo printf('%3d %s %5d %3d %s',
              \ i,
              \ w:JumpStackNowIndex == i ? '>' : ' ',
              \ jump_list['lnum'],
              \ jump_list['bufnr'],
              \ bufname(jump_list['bufnr'])
         \ )
  endfor

  " 上のupdate_jump()で新規登録があった場合、この時点で、IndexはJumpListの範囲外を指している。
  " この場合、現在位置が最新の履歴になる可能性がある。
  if w:JumpStackNowIndex == len(w:JumpStack)
    echo '    >'
  endif
endfunction


function! s:update_curpos()
  let now_idx = w:JumpStackNowIndex

  if !has_key(w:JumpStack[now_idx], 'org_lnum')
    let w:JumpStack[now_idx]['org_lnum']   = w:JumpStack[now_idx]['lnum']
    let w:JumpStack[now_idx]['org_col']    = w:JumpStack[now_idx]['col']
    let w:JumpStack[now_idx]['org_coladd'] = w:JumpStack[now_idx]['coladd']
  endif

  let cur_pos = getpos('.')

  let w:JumpStack[now_idx]['lnum'] = cur_pos[1]
  let w:JumpStack[now_idx]['col'] = cur_pos[2]
  let w:JumpStack[now_idx]['coladd'] = cur_pos[3]
endfunction


function! s:update_jumplist()
  let new_jump_list = getjumplist()[0]

  silent clearjumps

  if !empty(new_jump_list)
    if w:JumpStackNowIndex < (len(w:JumpStack) - 1)
      call remove(w:JumpStack, w:JumpStackNowIndex + 1, -1)
    endif

    let w:JumpStack += new_jump_list

    let w:JumpStackNowIndex = len(w:JumpStack)
    " この時点では、w:JumpStackNowIndexは、リストの範囲外を指している。
    " Backから呼ばれているなら、Back()内ですぐに是正される。
  endif
endfunction


function! s:exe_jump(n)
  " カーソルをsetpos()するときは、バッファ指定は無視されるので、先にバッファを変更しておく。
  silent exe 'buffer ' . w:JumpStack[a:n]['bufnr']

  " getjumplist()で取得できる桁は、なぜか1小さいので+1する。
  call setpos('.', [0, w:JumpStack[a:n]['lnum'], w:JumpStack[a:n]['col'] + 1, w:JumpStack[a:n]['coladd']])

  " 今回のジャンプを忘れる (バッファ移動を伴うと、jumplistへ記録されてしまう。)
  clearjumps
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
