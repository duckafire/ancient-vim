"" Author: DuckAfire
"" Version: v0.0.1
"" License: MIT
"" Repository: https://github.com/duckafire/ancient-vim

" `:h cterm`: see colors names
" `:h group`: see generic highlight groups

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Normal   ctermfg=white ctermbg=black cterm=none
highlight! Function ctermfg=white ctermbg=none  cterm=bold

highlight! link Identifier Normal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Constant ctermfg=red ctermbg=none cterm=none

highlight! link Boolean Constant

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Number ctermfg=cyan ctermbg=none cterm=none

highlight! link Float     Number
highlight! link Character Number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Comment        ctermfg=darkgray ctermbg=none  cterm=italic
highlight! SpecialComment ctermfg=white    ctermbg=black cterm=standout,italic
highlight! Todo           ctermfg=blue     ctermbg=none  cterm=standout
highlight! Error          ctermfg=red      ctermbg=none  cterm=standout
highlight! Debug          ctermfg=yellow   ctermbg=none  cterm=standout

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Statement ctermfg=yellow ctermbg=none cterm=none

highlight! link Keyword     Statement
highlight! link Conditional Statement
highlight! link Operator    Statement
highlight! link Label       Statement
highlight! link Repeat      Statement
highlight! link SpecialChar Statement
highlight! link Exception   Statement
highlight! link Delimiter   Statement

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Special     ctermfg=blue ctermbg=none cterm=none
highlight! SpecialChar ctermfg=cyan ctermbg=none cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! PreProc ctermfg=cyan ctermbg=none cterm=italic

highlight! link PreProCondit PreProc
highlight! link Define       PreProc
highlight! link Inclue       PreProc
highlight! link Macro        PreProc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Type ctermfg=green ctermbg=none cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Structure ctermfg=blue ctermbg=none cterm=bold

highlight! link StorageClass Structure
highlight! link Typedef      Structure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! String ctermfg=magenta ctermbg=none cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Tag ctermfg=magenta ctermbg=none cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight! Underlined ctermfg=cyan ctermbg=none cterm=none

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
