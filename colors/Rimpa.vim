scriptencoding utf-8
" vim:set ts=8 sts=8 sw=2 tw=0: (この行に関しては:help modelineを参照)

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "Rimpa"


" My favarite color  : #c0504d


" General colors
hi Normal	guifg=#f6f3f0	guibg=#202020	gui=none	ctermfg=254	ctermbg=235
hi Normal	guifg=#f6f3f0	guibg=#282828	gui=none	ctermfg=254	ctermbg=235
hi NonText	guifg=#808080	guibg=#303030	gui=none	ctermfg=242	ctermbg=237
hi Visual	guifg=#ffffd7	guibg=#444444	gui=none	ctermfg=186	ctermbg=238
hi FoldColumn	guifg=#ff5d28	guibg=#444444
hi Folded	guifg=#c0c0c0	guibg=#252525	gui=none
hi SignColumn	guifg=White	guibg=Red
hi SpecialKey	guifg=#2D2D2D	guibg=#222222	gui=none
hi SpecialKey	guifg=#343434	guibg=#282828	gui=none
hi Cursor	guifg=NONE	guibg=NONE	gui=reverse			ctermbg=0x241
hi CursorLine	guifg=NONE	guibg=NONE	gui=underline			ctermbg=NONE	cterm=underline
hi CursorColumn	guifg=NONE	guibg=#121212	gui=NONE			ctermbg=236
hi CursorColumn	guifg=NONE	guibg=#202020	gui=NONE			ctermbg=236
hi CursorColumn	guifg=NONE	guibg=#1A1A1A	gui=NONE			ctermbg=236
hi CursorLineNr	guifg=#ffffff	guibg=#000000	gui=NONE	ctermfg=yellow			cterm=bold,underline
hi LineNr	guifg=#5c5a4f	guibg=#121212	gui=none	ctermfg=239	ctermbg=232
hi Search	guifg=white	guibg=#b7282e
hi MatchParen	guifg=#f6f3e8	guibg=#857b6f	gui=bold	ctermbg=59
hi Title	guifg=#f6f3e8	guibg=NONE	gui=bold


" For Completion Menu
hi Pmenu	guifg=#dcda8f	guibg=black	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#000000	guibg=#c0504d	ctermfg=0	ctermbg=184
hi PmenuSbar 	guifg=#000000	guibg=black	ctermfg=0	ctermbg=184
hi PmenuThumb 	guifg=#000000	guibg=white	ctermfg=0	ctermbg=184


" For Statusline
hi StatusLine		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi StatusLineNC		guifg=#5c5a4f	guibg=#300a03	gui=none
hi StatusLineNC		guifg=#5c5a4f	guibg=#101010	gui=none
hi SLFileName		guifg=#cf302d	guibg=#000000

hi StatusLineTerm	guifg=#efd3b8	guibg=#d0330b	gui=none
hi StatusLineTermNC	guifg=#8f7368	guibg=#6d2006	gui=none

hi WildMenu		guifg=#ffffff	guibg=#000000

hi VertSplit		guifg=#121212	guibg=#300a03	gui=none
hi VertSplit		guifg=#7f1f1a	guibg=black	gui=none
hi VertSplit		guifg=#7f1f1a	guibg=#121212	gui=none
hi VertSplit		guifg=#121212	guibg=#121212	gui=none
hi VertSplit		guifg=#282828	guibg=#282828	gui=none	ctermfg=254	ctermbg=235

hi TabLine		guifg=#eeddcc	guibg=black	gui=none
hi TabLine		guifg=#eeddcc	guibg=black	gui=underline
hi TabLineSel		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=underline
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=none
hi TabLineFill		guifg=#343434	guibg=black
hi TabLineDate		guifg=#efd3b8	guibg=#7f1f1a	gui=none

" func_name
hi hl_func_name		guifg=#cdd129			gui=none	ctermfg=184
hi hl_func_name_stl	guifg=#85b0df	guibg=black	gui=none	ctermfg=184
hi hl_buf_name_stl	guifg=#ff5d28	guibg=black	gui=none	ctermfg=202

" Syntax highlighting
hi Comment 	guifg=#808080			ctermfg=244	| " gui=italic
hi Todo 	guifg=#8f8f8f	gui=italic	ctermfg=245
hi Constant 	guifg=#acf0f2	gui=none	ctermfg=159
hi String 	guifg=#ff5d28	gui=none	ctermfg=202
hi Identifier 	guifg=#ff5d28	gui=none	ctermfg=202
hi Function 	guifg=#cdd129	gui=none	ctermfg=184
hi Type 	guifg=#cdd129	gui=none	ctermfg=184
hi Statement 	guifg=#af5f5f	gui=none	ctermfg=131
hi Keyword	guifg=#cdd129	gui=none	ctermfg=184
hi PreProc 	guifg=#ede39e	gui=none	ctermfg=187
hi Number	guifg=#ede39e	gui=none	ctermfg=187
hi Special	guifg=#acf0f2	gui=none	ctermfg=159

if 1
  " COMMON COLORS AND SETTINGS
  highlight PreProc guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Function guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight Identifier guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
  highlight Statement guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Constant guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
  highlight Type guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
  highlight Label guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Special guifg=#af5f5f guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
  highlight Operator guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Title guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Conditional guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight StorageClass guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight htmlStatement guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight htmlItalic guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight htmlArg guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight cssIdentifier guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight cssClassName guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Structure guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight Typedef guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  "highlight Repeat guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Keyword guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Exception guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Number guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Character guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Boolean guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Float guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Include guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Define guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  "highlight Comment guifg=#87875f guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE
  highlight Statement guifg=#87875f guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE
  highlight Repeat guifg=#87875f guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE
  highlight Conditional guifg=#87875f guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE

  highlight String guifg=#ffdf87 guibg=#121212 gui=NONE ctermfg=222 ctermbg=233 cterm=NONE
  highlight String guifg=#ffdf87 guibg=#1c1c1c gui=NONE ctermfg=222 ctermbg=234 cterm=NONE
  highlight String guifg=#ffdf87 guibg=#262626 gui=NONE ctermfg=222 ctermbg=235 cterm=NONE
  highlight String guifg=#ffdf87 guibg=NONE ctermfg=222 ctermbg=NONE cterm=NONE gui=NONE
endif

" Diff
hi DiffAdd	guifg=NONE	guibg=#200a0a	gui=NONE	term=bold	ctermbg=1
hi DiffDelete	guifg=#1a1a4a	guibg=#111130	gui=NONE	term=bold	ctermbg=1
hi DiffChange	guifg=NONE	guibg=NONE	gui=NONE	term=NONE	ctermbg=NONE
hi DiffText	guifg=NONE	guibg=#303088	gui=NONE	term=reverse	ctermbg=12	cterm=bold


" supplemental
hi qfFileName	guifg=#c0504d
hi ErrorMsg	guifg=black	guibg=#ffd129




"""""""""""""""""""""""""""""""挿入モード時、ステータスラインの色を変更""""""""""""""""""""""""""""""

augroup InsertModeStlColor
  au!
  au InsertEnter * call s:SetStatusLineColor('Insert')
  au InsertLeave * call s:SetStatusLineColor('Normal')
augroup END

function! s:SetStatusLineColor(mode)
  if a:mode == 'Insert'
    silent highlight	StatusLine	guifg=white	guibg=#1a1f7f		gui=NONE	ctermfg=blue	ctermbg=yellow	cterm=NONE
  "elseif a:mode == 'Command'
    "silent highlight	StatusLine	guifg=darkblue	guibg=darkyellow	gui=NONE	ctermfg=blue	ctermbg=yellow	cterm=NONE
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')





" gui cursor
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:ver10-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0






" transparency
set transparency=244




"""""""""""""""""""""""""""""""フォントサイズ""""""""""""""""""""""""""""""

if has('win32') || has('win64')
  let s:FontName		= "MeiryoKe_Console"
  "let s:FontHeight	= 9.5
  "let s:FontWidth	= 4.5
  "let s:FontWidth	= 4.45
  let s:FontHeight	= 9.0
  let s:FontWidth		= 4.2
  let s:FontHeight	= 9.0
  let s:FontWidth		= 4.5
  let s:FontHeight	= 8.5
  let s:FontWidth		= 4.5
  let s:MinFontHeight	= 2.0
  let s:MinFontWidth	= 1.0
  let s:FontK		= 0.5
endif

com! Font echo '' &guifont

function! ResizeFont(r)
  if a:r != 0
    let s:CurFontHeight += a:r
    let s:CurFontWidth  += a:r * s:FontK
    "let s:CurFontWidth += a:r * (s:CurFontWidth / s:CurFontHeight)
    if s:CurFontHeight < s:MinFontHeight | let s:CurFontHeight = s:MinFontHeight | endif
    if s:CurFontWidth  < s:MinFontWidth  | let s:CurFontWidth  = s:MinFontWidth  | endif
  else	" デフォルトサイズに戻す
    let s:CurFontHeight = s:FontHeight
    let s:CurFontWidth  = s:FontWidth
  endif
  exe "set guifont=" . s:FontName . ":h" . printf("%.2f", s:CurFontHeight) . ":w" . printf("%.2f", s:CurFontWidth)
  let g:CurFontHeight=s:CurFontHeight
  let g:CurFontWidth=s:CurFontWidth
  simalt ~x

endfunction

" mapping
nnoremap <Home>		:<C-u>call ResizeFont(+0.5)<CR>:Font<CR>
nnoremap <End>		:<C-u>call ResizeFont(-0.5)<CR>:Font<CR>
nnoremap <C-Home>	:<C-u>call ResizeFont(0)<CR>:Font<CR>
nnoremap <C-End>	:<C-u>call ResizeFont(0)<CR>:Font<CR>
nnoremap <S-End>	:<C-u>call ResizeFont(-99999)<CR>:Font<CR>

" initialize
"exe 'set guifont=' . s:FontName . ':h' . s:FontHeight . ':w' s:FontWidth
if !exists('g:font_init_done')
  call ResizeFont(0)
endif
let g:font_init_done = v:true
