"" Author: DuckAfire
"" Version: v0.0.3
"" License: MIT
"" Repository: https://github.com/duckafire/ancient-vim

" `:h cterm`: see colors names
" `:h group`: see generic highlight groups

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" x256 colors terminais
let s:normal_fg  = "white"
let s:normal_bg  = "black"
let s:func_fg    = "white"
let s:const_fg   = "red"
let s:num_fg     = "cyan"
let s:comment_fg = "darkgray"
let s:specCom_fg = "white"
let s:specCom_bg = "black"
let s:todo_fg    = "blue"
let s:error_fg   = "red"
let s:debug_fg   = "yellow"
let s:statem_fg  = "yellow"
let s:special_fg = "blue"
let s:spChar_fg  = "cyan"
let s:preProc_fg = "cyan"
let s:type_fg    = "green"
let s:struct_fg  = "blue"
let s:string_fg  = "magenta"
let s:tag_fg     = "magenta"
let s:under_fg   = "cyan"

if &t_Co == 8
	let s:normal_fg  = "gray"
	let s:comment_fg = "red"
	let s:specCom_fg = "gray"
	let s:todo_fg    = "red"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" execute; highlight
exe "hi! Normal         ctermfg=" . s:normal_fg  . " ctermbg=" . s:normal_bg . " cterm=none"
exe "hi! Function       ctermfg=" . s:func_fg    . " ctermbg=none  cterm=bold"
exe "hi! Constant       ctermfg=" . s:const_fg   . " ctermbg=none  cterm=none"
exe "hi! Number         ctermfg=" . s:num_fg     . " ctermbg=none  cterm=none"
exe "hi! Comment        ctermfg=" . s:comment_fg . " ctermbg=none  cterm=italic"
exe "hi! SpecialComment ctermfg=" . s:specCom_fg . " ctermbg=" . s:specCom_bg . " cterm=standout,italic"
exe "hi! Todo           ctermfg=" . s:todo_fg    . " ctermbg=none  cterm=standout"
exe "hi! Error          ctermfg=" . s:error_fg   . " ctermbg=none  cterm=standout"
exe "hi! Debug          ctermfg=" . s:debug_fg   . " ctermbg=none  cterm=standout"
exe "hi! Statement      ctermfg=" . s:statem_fg  . " ctermbg=none  cterm=none"
exe "hi! Special        ctermfg=" . s:special_fg . " ctermbg=none  cterm=none"
exe "hi! SpecialChar    ctermfg=" . s:spChar_fg  . " ctermbg=none  cterm=none"
exe "hi! PreProc        ctermfg=" . s:preProc_fg . " ctermbg=none  cterm=italic"
exe "hi! Type           ctermfg=" . s:type_fg    . " ctermbg=none  cterm=none"
exe "hi! Structure      ctermfg=" . s:struct_fg  . " ctermbg=none  cterm=bold"
exe "hi! String         ctermfg=" . s:string_fg  . " ctermbg=none  cterm=none"
exe "hi! Tag            ctermfg=" . s:tag_fg     . " ctermbg=none  cterm=none"
exe "hi! Underlined     ctermfg=" . s:under_fg   . " ctermbg=none  cterm=none"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi! link Identifier Normal

hi! link Boolean Constant

hi! link Float     Number
hi! link Character Number

hi! link Keyword     Statement
hi! link Conditional Statement
hi! link Operator    Statement
hi! link Label       Statement
hi! link Repeat      Statement
hi! link SpecialChar Statement
hi! link Exception   Statement
hi! link Delimiter   Statement

hi! link PreProCondit PreProc
hi! link Define       PreProc
hi! link Include      PreProc
hi! link Macro        PreProc

hi! link StorageClass Structure
hi! link Typedef      Structure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! InheritHighlight(lang)
	exec 'hi! link ' . a:lang . 'Identifier Normal'

	exec 'hi! link ' . a:lang . 'Boolean Constant'

	exec 'hi! link ' . a:lang . 'Float     Number'
	exec 'hi! link ' . a:lang . 'Character Number'

	for group in ["Keyword", "Conditional", "Operator", "Label", "Repeat", "SpecialChar", "Exception", "Delimiter"]
		exec 'hi! link ' . a:lang . l:group . ' Statement'
	endfor

	exec 'hi! link ' . a:lang . 'PreProCondit PreProc'
	exec 'hi! link ' . a:lang . 'Define       PreProc'
	exec 'hi! link ' . a:lang . 'Include      PreProc'
	exec 'hi! link ' . a:lang . 'Macro        PreProc'

	exec 'hi! link ' . a:lang . 'StorageClass Structure'
	exec 'hi! link ' . a:lang . 'Typedef      Structure'
endfunction

function! SyntaxMatches(lang)
	exec 'syn match ' . a:lang . 'Function "\v<[a-zA-Z_]\w*\ze\("'
	exec 'syn match ' . a:lang . 'Function "\v\.\zs[a-zA-Z_]\w*\ze>[^.(]"'

	exec 'syn match ' . a:lang . 'Constant "\v<[A-Z_][A-Z_0-9]*>"'

	for pattern in ['"\v\d+\.\d*"', '"\v\d*\.\d+"', '"\v0[bB][0-1]*"', '"\v0[oO][0-8]*"', '"\v0[xX][0-9a-fA-F]*"', '"\v\d+[eE]\d*"', '"\v\d+\.\d+[eE]\d*"']
		exec 'syn match ' . a:lang . 'Number ' . l:pattern
	endfor
endfunction

function! SetAll(lang)
	augroup foo
		exec 'autocmd FileType ' . a:lang . ' :call InheritHighlight("' . a:lang . '")'
		exec 'autocmd FileType ' . a:lang . ' :call SyntaxMatches("'    . a:lang . '")'
	augroup END
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call SetAll("c")
call SetAll("cpp")
call SetAll("lua")
call SetAll("javascript")
call SetAll("typescript")
call SetAll("java")
call SetAll("python")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
