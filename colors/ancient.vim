" Author: DuckAfire
" Version: v1.0.1
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
