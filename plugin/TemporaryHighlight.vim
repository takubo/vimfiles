scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab:
" (この行に関しては:help modelineを参照)


" -----------------------------------------------------------------------------
" Temporary Highlight
"


if exists('loaded_TemporaryHighlight')
  finish
endif
let loaded_TemporaryHighlight = v:true


let s:save_cpo = &cpo
set cpo&vim


let g:TemporaryHighlightTime = 1500  " [ms]

let g:TemporaryHighlightFg = 'white'
let g:TemporaryHighlightBg = '#c0504d'


let s:TemporaryHighlightTime = exists('g:TemporaryHighlightTime') ? g:TemporaryHighlightTime : 1500  " [ms]

let s:TemporaryHighlightFg = exists('g:TemporaryHighlightFg') ? g:TemporaryHighlightFg : 'white'
let s:TemporaryHighlightBg = exists('g:TemporaryHighlightBg') ? g:TemporaryHighlightBg : '#c0504d'


exe 'hi HlTemporaryHighlight guifg=' . s:TemporaryHighlightFg . ' guibg=' . s:TemporaryHighlightBg
augroup TemporaryHighlight_ColorScheme
  au!
  "au ColorScheme * hi HlTemporaryHighlight	guibg=#c0504d	guifg=white
  au ColorScheme * exe 'hi HlTemporaryHighlight guifg=' . s:TemporaryHighlightFg . ' guibg=' . s:TemporaryHighlightBg
augroup end


let g:TimerId = {}
let s:MatchId = {}

function! TemporaryHighlightWord(word, req_redraw)
  return TemporaryHighlight('\<' . a:word . '\>', a:req_redraw)
endfunction

function! TemporaryHighlight(str, req_redraw)
  let match_id = matchadd('HlTemporaryHighlight', '\<' . a:str . '\>', 1)
  let timer_id = timer_start(s:TemporaryHighlightTime, 'TemporaryHighlightDelete')

  let g:TimerId[timer_id . ''] = timer_id

  let s:MatchId[timer_id . ''] = match_id

  exe 'augroup TemporaryHighlightDelete' . timer_id
  exe 'au  TemporaryHighlightDelete' . timer_id . ' WinLeave * call TemporaryHighlightDelete(g:TimerId["' . timer_id . '"])'
  if a:req_redraw
    redraw
  endif
endfunction

function! TemporaryHighlightDelete(timer_id)
  call timer_stop(a:timer_id)

  call matchdelete(s:MatchId[a:timer_id . ''])
  call remove(s:MatchId, a:timer_id . '')

  exe 'au! TemporaryHighlightDelete' . a:timer_id

  call remove(g:TimerId, a:timer_id . '')
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
