scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_Emergency_Search')
  finish
endif
let g:loaded_Emergency_Search = 1

let s:save_cpo = &cpo
set cpo&vim


"----------------------------------------------------------------------------------------
" search.vimがないとき用
"
"  " 単語   新規 動く	*
"  " 単語   追加 動く	&
"  " 非単語 新規 動く	#
"  " 非単語 追加 動く	@
"  nnoremap <expr> *  (match(expand("<cword>"), '_') == 0) ? ('/\<_\?' . substitute(expand("<cword>"), '^_', '', '') . '\><CR>') : ('/\<_\?<C-r><C-w>\><CR>')
"  nnoremap <expr> #  (match(expand("<cword>"), '_') == 0) ? ('/_\?' . substitute(expand("<cword>"), '^_', '', '') . '<CR>') : ('/_\?<C-r><C-w><CR>')
"  nnoremap <expr> &  '/<C-p>\\|\<' . ((match(expand("<cword>"), '_') == 0) ? ('_\?' . substitute(expand("<cword>"), '^_', '', '')) : ('_\?<C-r><C-w>')) . '\><CR>'
"  nnoremap <expr> @  '/<C-p>\\|' . ((match(expand("<cword>"), '_') == 0) ? ('_\?' . substitute(expand("<cword>"), '^_', '', '')) : ('_\?<C-r><C-w>')) . '<CR>'
"----------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------
" Anzu.vimがないとき用
"
"function! s:search_str_num()
"  let g:save_lang=$LANG
"  let $LANG='C'
"  PushPos
"  let num = CmdOut("silent exe '%s!' . @/ . '!!gn'")
"  PopPos
"  echo '/' . @/ num
"  let $LANG=g:save_lang
"endfunction
"com! SearchStrNum call <SID>search_str_num()
"
"nnoremap <silent> n n:SearchStrNum<CR>
"nnoremap <silent> N N:SearchStrNum<CR>
"----------------------------------------------------------------------------------------


let &cpo = s:save_cpo
unlet s:save_cpo
