" Author: DuckAfire
" Version: v1.0.3
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

" execute; highlight
hi! Function       ctermfg=white    ctermbg=none  cterm=bold
hi! Constant       ctermfg=red      ctermbg=none  cterm=none
hi! Number         ctermfg=cyan     ctermbg=none  cterm=none
hi! Comment        ctermfg=darkgray ctermbg=none  cterm=italic
hi! SpecialComment ctermfg=white    ctermbg=black cterm=standout,italic
hi! Todo           ctermfg=blue     ctermbg=none  cterm=standout
hi! Error          ctermfg=red      ctermbg=none  cterm=standout
hi! Debug          ctermfg=yellow   ctermbg=none  cterm=standout
hi! Statement      ctermfg=yellow   ctermbg=none  cterm=none
hi! Special        ctermfg=blue     ctermbg=none  cterm=none
hi! SpecialChar    ctermfg=cyan     ctermbg=none  cterm=none
hi! PreProc        ctermfg=cyan     ctermbg=none  cterm=italic
hi! Type           ctermfg=green    ctermbg=none  cterm=none
hi! Structure      ctermfg=blue     ctermbg=none  cterm=bold
hi! String         ctermfg=magenta  ctermbg=none  cterm=none
hi! Tag            ctermfg=magenta  ctermbg=none  cterm=none
hi! Underlined     ctermfg=cyan     ctermbg=none  cterm=none

" 'if support only eight colors'
if &t_Co == 8
	hi! Comment cterm=italic,bold
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight
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
