"" Author: DuckAfire
"" Version: v0.0.2
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

highlight! link Identifier Normal

highlight! link Boolean Constant

highlight! link Float     Number
highlight! link Character Number

highlight! link Keyword     Statement
highlight! link Conditional Statement
highlight! link Operator    Statement
highlight! link Label       Statement
highlight! link Repeat      Statement
highlight! link SpecialChar Statement
highlight! link Exception   Statement
highlight! link Delimiter   Statement

highlight! link PreProCondit PreProc
highlight! link Define       PreProc
highlight! link Inclue       PreProc
highlight! link Macro        PreProc

highlight! link StorageClass Structure
highlight! link Typedef      Structure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function IsActive(name)
	let var="g:no_ancient_pattern"

	if a:name != ""
		let l:var = "g:no_ancient_" . a:name . "_pattern"
	endif

	return !(exists(l:var) && eval(l:var) == 1)
endfunction

if !IsActive("")
	finish
endif

if IsActive("functions") " it MUST be before `constants`
	syntax match Function "\v<[a-zA-Z_]\w*\ze\("
	syntax match Function "\v\.\zs[a-zA-Z_]\w*\ze>[^.(]"
endif

if IsActive("constants") " it MUST be before `functions`
	syntax match Constant "\v<[A-Z_][A-Z_0-9]*>"
endif

if IsActive("numbers")
	syntax match Number "\v\d+\.\d*"
	syntax match Number "\v\d*\.\d+"
	syntax match Number "\v0[bB][0-1]*"
	syntax match Number "\v0[oO][0-8]*"
	syntax match Number "\v0[xX][0-9a-fA-F]*"
	syntax match Number "\v\d+[eE]\d*"
	syntax match Number "\v\d+\.\d+[eE]\d*"
endif
