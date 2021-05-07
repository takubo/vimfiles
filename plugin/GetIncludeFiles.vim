scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab:


" -----------------------------------------------------------------------------
" Get Include Files
"

function! GetIncludeFiles(file)
  let inclist = execute('checkpath!')

  let incs = split(inclist, '\n')
  call remove(incs, 0)
  call filter(incs, { idx, val -> val !~ '-->$' })
  call filter(incs, { idx, val -> val !~ ')$' })  " '(既に列挙)'行を削除
  call filter(incs, { idx, val -> val !~ '"\f\+"' })  " '見つかりません'行を削除

  return incs
endfunction

com! GetIncludeFiles call GetIncludeFiles(expand('%f'))
