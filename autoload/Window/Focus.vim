scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab :

if !exists('loaded_Window')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim



"----------------------------------------------------------------------------------------
" Skip Terminal

function! Window#Focus#SkipTerm(direction)
  "Window番号を指定されていたら、そのWindowへ移動。
  if v:prevcount | return v:prevcount | endif

  "windowが2つしかないなら、もう一方へ移動することは自明なので、terminalであっても移動を許す。
  if winnr('$') == 2 | return winnr() == 1 ? 2 : 1 | endif

  let terms = term_list()
  let next_win = winnr()

  for i in range(winnr('$'))
    if a:direction >= 0
      let next_win = ( next_win == winnr('$') ? 1 : next_win + 1 )  "順方向
    else
      let next_win = ( next_win == 1 ? winnr('$') : next_win - 1 )  "逆方向
    endif
    let nr = winbufnr(next_win)
    if count(terms, nr) < 1 || term_getstatus(nr) =~# 'normal' | return next_win | endif
  endfor
endfunction



"----------------------------------------------------------------------------------------
" Wrap Move

function! Window#Focus#WinWrapMove(m)
  if winnr('$') < 3
    "Windowの数が3未満なら、もう一方へ移動することは自明。
    wincmd w
    return
  endif


  let org = winnr()


  "++++++++++++ 元々指定された方向に動く ++++++++++++

  let last_moved_win = org

  while 1
    " terminalを全てSkipする必要があるので、ループする。

    let old = winnr()
    exe 'wincmd ' . a:m
    let new = winnr()

    if new == old
      " もう動けないので、orgに戻って終了。
      exe org 'wincmd w'
      break
    endif

    if &l:buftype !~ 'terminal' || term_getstatus(winbufnr(new)) =~ 'normal'
      " terminalでないwindowを見つけたので、移動して終了。
      " 一旦戻って、直接移動にしないと、前Window(<C-w>p)が意図しないものとなる。
      exe org 'wincmd w'
      exe new 'wincmd w'
      return
    else
      " 移動できた最後のwindowを憶えておく。 (直交移動で使う。)
      let last_moved_win = new
    endif
  endwhile


  "++++++++++++ 元々指定されのと反対方向に動く ++++++++++++

  let rev = {'h' : 'l', 'j' : 'k', 'k' : 'j', 'l' : 'h'}

  " ここでorgで初期化しておかないと、terminal windowへしか動けなったときに変数未定義になる。
  let last_not_term_win = org

  while 1
    " 逆端まで動く必要があるのでループする。

    let old = winnr()
    exe 'wincmd ' . rev[a:m]
    let new = winnr()

    if &l:buftype !~ 'terminal' || term_getstatus(winbufnr(new)) =~ 'normal'
      " 移動できた最後のterminalでないwindowを憶えておく。
      let last_not_term_win = winnr()
    endif

    if new == old
      " もう動けない。つまり、逆端まで動ききったということ。

      if org != last_not_term_win
	" 逆方向にterminalでないwindowがあったので、移動して終了。
	" 一旦戻って、直接移動にしないと、前Window(<C-w>p)が意図しないものとなる。
	exe org 'wincmd w'
	exe last_not_term_win 'wincmd w'
	return
      else
	if last_moved_win == org
	  " 移動できた最後のwindowを憶えておく。 (直交移動で使う。)
	  let last_moved_win = new
	endif
	break
      endif
    endif
  endwhile


  "++++++++++++ 直交移動 (水平、垂直を入れ替えて動く。) ++++++++++++
  " 適当に押しても、なるべく移動するため。

  " 以降の処理は、terminalでないwindowが2個以上ないと、無限再起に陥る。
  if (winnr('$') - s:get_num_of_not_normal_terminal()) > 2
    if last_moved_win != org
      " 移動できた最後のwindowに移動してから、直交移動を行う方が、本来意図に近い。
      exe last_moved_win 'wincmd w'
      call WinWrapFocus({'h' : 'k', 'j' : 'l', 'k' : 'h', 'l' : 'j'}[a:m])
      if org != winnr()
	return
      endif
      " それがダメなら、orgに戻ってから、直交移動を行う。
      exe org 'wincmd w'
    endif

    " orgを起点とした直交移動
    call WinWrapFocus({'h' : 'k', 'j' : 'l', 'k' : 'h', 'l' : 'j'}[a:m])
  endif
endfunction


" normal mode になっていない terminal window の数を返す。
function! s:get_num_of_not_normal_terminal()
  let n = 0

  let terms = term_list()

  for win in range(1, winnr('$'))
    let nr = winbufnr(win)
    if count(terms, nr) > 1 && term_getstatus(nr) =~# 'normal'
      let n += 1
    endif
  endfor
  return n
endfunction



let &cpo = s:save_cpo
unlet s:save_cpo
