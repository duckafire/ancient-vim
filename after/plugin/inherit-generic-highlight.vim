" Author: DuckAfire
" Version: v1.0.2
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:languages = v:null

if __is_valid_array__("g:highlight_languages_to_ancient_vim")
	let s:languages =  g:highlight_languages_to_ancient_vim
endif

if __is_valid_array__("g:languages_to_ancient_vim")
	if __is_null_array__(s:languages)
		let s:languages =  g:languages_to_ancient_vim
	else
		let s:languages += g:languages_to_ancient_vim
	endif
endif

if __is_null_array__(s:languages)
	finish
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:bases = ['Normal', 'Constant', 'Number', 'Statement', 'PreProc', 'Structure']
let s:groups = [['Identifier'], ['Boolean'], ['Float', 'Character'], ["Keyword", "Conditional", "Operator", "Label", "Repeat", "SpecialChar", "Exception", "Delimiter"], ['PreProCondit', 'Define', 'Include', 'Macro'], ['StorageClass', 'Typedef']]

" from generic to specific
for lang in s:languages
	for i in range( 0, len(s:bases) - 1 )
		for group in s:groups[i]

			exec 'hi! link ' . lang . group . ' ' . s:bases[i]

		endfor
	endfor
endfor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
