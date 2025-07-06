function! functions#set_syntax_match(lang)
	exec 'syn match ' . a:lang . 'Function "\v<[a-zA-Z_]\w*\ze\("'
	exec 'syn match ' . a:lang . 'Function "\v\.\zs[a-zA-Z_]\w*\ze>[^.(]"'

	exec 'syn match ' . a:lang . 'Constant "\v<[A-Z_][A-Z_0-9]*>"'

	for pattern in [
		\ "\v\d+\.\d*",
		\ "\v\d*\.\d+",
		\ "\v0[bB][0-1]*",
		\ "\v0[oO][0-8]*",
		\ "\v0[xX][0-9a-fA-F]*",
		\ "\v\d+[eE]\d*",
		\ "\v\d+\.\d+[eE]\d*",
		]

		exec 'syn match ' . a:lang 'Number ' . l:pattern
	endfor
endfunction
