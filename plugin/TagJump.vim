scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab:


" -----------------------------------------------------------------------------
" Tag Jump
"


" TODO
"   ラベルならf:b
"   変数なら、スクロールしない
"   引数のタグ
"   asmのタグ


" modeは、次の文字をから構成さされる文字列。
"   s:select
"   p:preview
"   w:別ウィンドウ
"
" Jumpに
"   成功したら、v:true
"   失敗したら、v:fals
" を返す。
function! TagJump(symbol, mode)
  if a:symbol !~ '\<\i\+\>'
    "return v:false
  endif

  let tag = a:symbol

  call TemporaryHighlightWord(tag, v:true)

  for i in range(2)
    try
      if ! s:maximum_likelihood_tagjump(tag, a:mode)
        " TODO 無理やり例外を発生させる
        throw ':E426:'
      endif

      " 表示範囲を最適化
      exe "normal! z\<CR>" . (winheight(0)/4) . "\<C-y>"

      " カーソル位置を調整 (C専用)
      call s:PostTagJump_AdjustCursor_C()

      call TemporaryHighlightWord(tag, v:false)

      return v:true
    catch /:E426:/
      if i == 0
        if a:symbol =~ '^_'
          " 元の検索語は"_"始まり
          let tag = substitute(a:symbol, '^_', '', '')
        else
          " 元の検索語は"_"始まりでない
          let tag = '_' . a:symbol
        endif
        " エラーメッセージ表示用にオリジナル単語でのエラー文字列を保存
        let err_msg = v:exception
      endif
    catch /:E433:/
      "  No tag file
      echohl ErrorMsg | echo matchstr(v:exception, 'E\d\+:.*') | echohl None
      return v:false
    endtry
  endfor
  echohl ErrorMsg | echo matchstr(err_msg, 'E\d\+:.*') | echohl None
  return v:false
endfunction


" 複数の候補がある場合に、最尤な候補へ飛ぶ。
"
" 呼び元で、try catch で囲んでいる想定。
"
" Jumpに
"   成功したら、v:true
"   失敗したら、v:fals
" を返す。
function! s:maximum_likelihood_tagjump(word, mode)
  let taglist = taglist('\<' . a:word . '\>')

  if len(taglist) == 0
    return v:false
  endif

  let cmd_tag     = (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . 'tag'
  let cmd_tselect = (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . 'tselect'
  if a:mode =~? 's'
    let cmd_tag = cmd_tselect
  endif

  " タグが1つならそれ

  if len(taglist) == 1
    exe cmd_tag a:word
    " 呼び元で、try catch で囲んでいる想定なので、タグジャンプに失敗したのに、trueを返すということはないはず。
    return v:true
  endif

  " 内部タグがあればそれ（内部タグは複数はない想定。）

  let cur_file = expand('%:p')
  " カレントディレクトリ相対にしないと、ctagsとDOSでパスの形式が異なる。
  let cur_file = fnamemodify(cur_file, ':.')

  for i in range(len(taglist))
    let tag_file = taglist[i]['filename']
    let tag_file = fnamemodify(tag_file, ':.')

    " 内部タグがあればそれ
    if tag_file == cur_file
      exe i + 1 cmd_tag a:word
      return v:true
    endif
  endfor

  " IncludeFilesに対して検索

  let include_files = GetIncludeFiles(expand('%f'))

  for i in range(len(taglist))
    let tag_file = taglist[i]['filename']

    for i_f in include_files
      " TODO Trim
      let inc_file = substitute(i_f, ' \+', '', 'g')

      if tag_file == inc_file
        exe i + 1 cmd_tag a:word
        return v:true
      endif
    endfor
  endfor

  " 通常のタグジャンプ
  exe cmd_tselect a:word
  " 呼び元で、try catch で囲んでいる想定なので、タグジャンプに失敗したのに、trueを返すということはないはず。
  return v:true
endfunction


" カーソル位置を調整 (C専用)
function! s:PostTagJump_AdjustCursor_C()
  if search('\%##define\s\+\k\+(', 'bcn')
  "関数形式マクロ
    normal! ww
  elseif search('\%##define\s\+\k\+\s\+', 'bcn')
  "定数マクロ
    normal! ww
  elseif search('\%#.\+;', 'bcn')
  "変数
    normal! f;b
  else
    "関数
    normal! $F(b
  endif
endfunction
