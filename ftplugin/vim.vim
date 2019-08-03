scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:


"nnoremap <buffer> <Leader>e :<C-u>so %<CR>
"nnoremap <buffer> <Leader>e :<C-u>w <Bar> so %<CR>
"nnoremap <buffer> <Leader>e :<C-u>w <Bar> exe match(getcwd(), '/colors$') == -1 ? 'so %' : ( 'colorscheme ' . expand('%:r') )<CR>
"nnoremap <buffer> <expr> <Leader>e ':<C-u>w <Bar> ' . ( match(getcwd(), '/colors$') == -1 ? 'so %' : 'colorscheme ' . expand('%:r') ) . '<CR>'
nnoremap <buffer> <expr> <Leader>e ':<C-u>w<CR>:' . ( match(getcwd(), '/colors$') == -1 ? 'so %' : 'colorscheme ' . expand('%:r') ) . '<CR>'
