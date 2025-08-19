" Author: DuckAfire
" Version: v1.0.0
" Repository: https://github.com/duckafire/ancient-vim
" License:
"
" MIT License
"
" Copyright (c) 2025 DuckAfire <duckafire.github.io/nest>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" `:h cterm`: see colors names
" `:h group`: see generic highlight groups

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("g:languages_to_ancient_vim") && !empty(g:languages_to_ancient_vim) && type(g:languages_to_ancient_vim) == type([])
	let g:syntax_matches_languages_to_ancient_vim = g:languages_to_ancient_vim
endif

if !exists("g:syntax_matches_languages_to_ancient_vim") || empty(g:syntax_matches_languages_to_ancient_vim) || type(g:syntax_matches_languages_to_ancient_vim) != type([])
	finish
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" from generic to specific
for lang in g:syntax_matches_languages_to_ancient_vim
	exec 'syn match ' . lang . 'Function "\v(\.|\-\>)?\zs<[a-zA-Z_]\w*\ze\("'
	exec 'syn match ' . lang . 'Function "\v(\.|\-\>)\zs<[a-zA-Z_]\w*\ze(\.|\-\>)?"'

	exec 'syn match ' . lang . 'Constant "\v<[A-Z_][A-Z_0-9]*>"'

	for pattern in ['"\v\d+\.\d*"', '"\v\d*\.\d+"', '"\v0[bB][0-1]*"', '"\v0[oO][0-8]*"', '"\v0[xX][0-9a-fA-F]*"', '"\v\d+[eE]\d*"', '"\v\d+\.\d+[eE]\d*"']
		exec 'syn match ' . lang . 'Number ' . pattern
	endfor
endfor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
