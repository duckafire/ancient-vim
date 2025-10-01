" Author: DuckAfire
" Version: v1.y.z
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

function! s:IsEnable(strIdent)
	if !exists(a:strIdent)
		return 1 " true
	endif

	return eval(a:strIdent) <= 0
endfunction

if s:IsEnable("g:disable_ancient_vim_syntax")
	hi! Normal           ctermfg=white       ctermbg=black    cterm=none

	hi! Comment          ctermfg=darkgray    ctermbg=none     cterm=italic
	hi! Constant         ctermfg=red         ctermbg=none     cterm=none
	hi! Special          ctermfg=blue        ctermbg=none     cterm=none
	hi! link             Identifier          Normal
	hi! Statement        ctermfg=yellow      ctermbg=none     cterm=none
	hi! PreProc          ctermfg=cyan        ctermbg=none     cterm=italic
	hi! Type             ctermfg=green       ctermbg=none     cterm=none
	hi! Underlined       ctermfg=cyan        ctermbg=none     cterm=none
	hi! Ignore           ctermfg=black       ctermbg=darkgray cterm=none
	hi! Error            ctermfg=red         ctermbg=none     cterm=standout
	hi! Todo             ctermfg=blue        ctermbg=none     cterm=standout
	hi! String           ctermfg=magenta     ctermbg=none     cterm=none
	hi! link             Character           Number
	hi! Number           ctermfg=cyan        ctermbg=none     cterm=none
	hi! link             Boolean             Constant
	hi! link             Float               Number
	hi! Function         ctermfg=white       ctermbg=none     cterm=bold
	hi! link             Conditional         Statement
	hi! link             Repeat              Statement
	hi! link             Label               Statement
	hi! link             Operator            Statement
	hi! link             Keyword             Statement
	hi! link             Exception           Statement
	hi! link             Include             PreProc
	hi! link             Define              PreProc
	hi! link             Macro               PreProc
	hi! link             PreCondit           PreProc
	hi! link             StorageClass        Structure
	hi! Structure        ctermfg=blue        ctermbg=none     cterm=bold
	hi! link             Typedef             Structure
	hi! Tag              ctermfg=magenta     ctermbg=none     cterm=none
	hi! SpecialChar      ctermfg=cyan        ctermbg=none     cterm=none
	hi! link             Delimiter           Statement
	hi! SpecialComment   ctermfg=white       ctermbg=black    cterm=standout,italic
	hi! Debug            ctermfg=yellow      ctermbg=none     cterm=standout
	hi! link             PreProCondit        PreProc
endif

if s:IsEnable("g:disable_ancient_vim_ui")
	hi! SpecialKey       ctermfg=darkgray    ctermbg=black    cterm=none
	hi! EndOfBuffer      ctermfg=darkgray    ctermbg=none     cterm=none
	hi! link             NonText             EndOfBuffer
	hi! Directory        ctermfg=blue        ctermbg=none     cterm=bold
	hi! ErrorMsg         ctermfg=red         ctermbg=none     cterm=standout
	hi! IncSearch        ctermfg=yellow      ctermbg=none     cterm=standout
	hi! Search           ctermfg=brown       ctermbg=none     cterm=standout
	hi! MoreMsg          ctermfg=yellow      ctermbg=none     cterm=none
	hi! link             ModeMsg             MoreMsg
	hi! LineNr           ctermfg=darkgray    ctermbg=none     cterm=none
	hi! CursorLineNr     ctermfg=gray        ctermbg=none     cterm=bold
	hi! Question         ctermfg=gray        ctermbg=none     cterm=none
	hi! StatusLine       ctermfg=white       ctermbg=blue     cterm=bold
	hi! StatusLineNC     ctermfg=black       ctermbg=white    cterm=none
	hi! VertSplit        ctermfg=none        ctermbg=white    cterm=none
	hi! Title            ctermfg=darkgray    ctermbg=white    cterm=standout,bold
	hi! Visual           ctermfg=gray        ctermbg=black    cterm=standout,bold
	hi! link             VisualNOS           Visual
	hi! WarningMsg       ctermfg=brown       ctermbg=black    cterm=standout,bold
	hi! WildMenu         ctermfg=white       ctermbg=black    cterm=standout,bold
	hi! Folded           ctermfg=cyan        ctermbg=none     cterm=italic
	hi! link             FoldedColumn        Folded
	hi! DiffAdd          ctermfg=darkgreen   ctermbg=black    cterm=standout
	hi! DiffChange       ctermfg=darkmagenta ctermbg=black    cterm=standout
	hi! DiffDelete       ctermfg=darkred     ctermbg=black    cterm=standout
	hi! DiffText         ctermfg=darkcyan    ctermbg=black    cterm=standout
	hi! SpellBad         ctermfg=darkred     ctermbg=black    cterm=standout
	hi! SpellCap         ctermfg=darkgray    ctermbg=black    cterm=standout
	hi! SpellRare        ctermfg=darkmagenta ctermbg=black    cterm=standout
	hi! SpellLocal       ctermfg=brown       ctermbg=black    cterm=standout
	hi! Pmenu            ctermfg=white       ctermbg=darkgray cterm=none
	hi! PmenuSel         ctermfg=yellow      ctermbg=black    cterm=bold,standout
	hi! link             PmenuSbar           Pmenu
	hi! PmenuThumb       ctermfg=none        ctermbg=gray     cterm=none
	hi! TabLine          ctermfg=black       ctermbg=gray     cterm=none
	hi! TabLineSel       ctermfg=white       ctermbg=black    cterm=bold
	hi! TabLineFill      ctermfg=none        ctermbg=white    cterm=none
	hi! CursorColumn     ctermfg=none        ctermbg=234      cterm=none
	hi! link             CursorLine          CursorColumn
	hi! ColorColumn      ctermfg=none        ctermbg=darkgray cterm=none
	hi! QuickFixLine     ctermfg=yellow      ctermbg=black    cterm=bold,standout
	hi! StatusLineTerm   ctermfg=black       ctermbg=green    cterm=bold
	hi! StatusLineTermNC ctermfg=white       ctermbg=darkgray cterm=italic
	hi! Cursor           ctermfg=white       ctermbg=black    cterm=none
	hi! link             lCursor             Cursor
	hi! MatchParen       ctermfg=black       ctermbg=yellow   cterm=bold
	" Normal
	hi! ToolbarLine      ctermfg=white       ctermbg=black    cterm=bold
	hi! link             ToolbarButton       ToolbarLine
endif

" 'if support only eight colors'
if &t_Co == 8
	if s:IsEnable("g:disable_ancient_vim_syntax")
		hi! Normal  ctermfg=gray
		hi! Comment cterm=italic,bold
	endif

	if s:IsEnable("g:disable_ancient_vim_ui")
		" NOTE: (about the '234')
		" The x16 Palette was not thought to overlap between
		" its shades, so it becomes hard to choose one of its
		" color to the cursor column/line background without
		" difficulty the reading of the files content. Because
		" of this, I have decided to use a color from out of
		" the x16 palette. Terminals that do not support this
		" color will use the style below (UNDERLINE IS BAD
		hi! CursorColumn ctermfg=none ctermbg=none cterm=underline
	endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
