" Vim color file
"
" Author: Brian Mock <mock.brian@gmail.com>
"
" Note: Based on Oblivion color scheme for gedit (gtk-source-view)
"
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="darkspectrum"

hi Normal guifg=#efefef guibg=#2A2A2A

" highlight groups
hi Cursor		guibg=#ffffff guifg=#000000
hi CursorLine	guibg=#111111
"hi CursorLine	guibg=#3e4446
hi CursorColumn	guibg=#464646

"hi DiffText     guibg=#4e9a06 guifg=#FFFFFF gui=bold
"hi DiffChange   guibg=#4e9a06 guifg=#FFFFFF gui=bold
"hi DiffAdd      guibg=#204a87 guifg=#FFFFFF gui=bold
"hi DiffDelete   guibg=#5c3566 guifg=#FFFFFF gui=bold

hi DiffAdd         guifg=#ffcc7f guibg=#a67429 gui=none
hi DiffChange      guifg=#7fbdff guibg=#425c78 gui=none
hi DiffText        guifg=#8ae234 guibg=#4e9a06 gui=none
"hi DiffDelete      guifg=#252723 guibg=#000000 gui=none
hi DiffDelete      guifg=#000000 guibg=#000000 gui=none
"hi ErrorMsg

hi Number		guifg=#fce94f

hi Folded		guibg=#000000 guifg=#8a8a8a gui=bold
hi vimFold		guibg=#000000 guifg=#8a8a8a gui=bold
hi FoldColumn	guibg=#000000 guifg=#8a8a8a gui=bold

hi LineNr		guifg=#99ff66 guibg=#202020
hi NonText		guifg=#555555
hi Folded		guifg=#99ccff guibg=#202020 
hi FoldeColumn  guifg=#CCFF00 guibg=#202020 gui=bold
"hi VertSplit	guibg=#ffffff guifg=#ffffff gui=none

" hi VertSplit	guibg=#3C3C3C guifg=#3C3C3C gui=none
" hi StatusLine   guifg=#FFFFFF guibg=#3C3C3C gui=none
" hi StatusLineNC guifg=#808080 guibg=#66ff00 gui=none
hi VertSplit	guibg=#3C3C3C guifg=#66ff44  gui=none
hi StatusLine   guifg=#000000 guibg=#66ff44  gui=none
hi StatusLineNC guifg=#000000 guibg=#66ff44  gui=none


hi ModeMsg		guifg=#fce94f
hi MoreMsg		guifg=#fce94f
" hi Visual		guifg=#FFFFFF guibg=#3465a4 gui=none
hi Visual		guifg=#FFFFFF guibg=#000000 gui=none
hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none
hi IncSearch	guibg=#000000 guifg=#99ff66
hi Search		guibg=#99ff66 guifg=#000000
hi SpecialKey	guifg=#555555 guibg=#202020

hi Title		guifg=#ef5939
hi WarningMsg	guifg=#ef5939
hi Number		guifg=#00ffcc

hi MatchParen	guibg=#ad7fa8 guifg=#FFFFFF
" hi Comment		guifg=#8a8a8a
hi Comment		guifg=#99ff66
" hi Comment		guifg=#00ffcc
hi Constant		guifg=#ef5939 gui=none
" hi String		guifg=#fce94f
hi String		guifg=#99ffff
hi Identifier	guifg=#729fcf
hi Statement	guifg=#66ff00 gui=bold
hi PreProc		guifg=#ffffff gui=bold
hi Type			guifg=#ff88ff 
" hi Type			guifg=#00ffcc gui=bold
hi Special		guifg=#cccc00
hi Underlined	guifg=#ad7fa8 gui=underline
hi Directory	guifg=#99ffff
hi Ignore		guifg=#555753
hi Todo			guifg=#FFFFFF guibg=#ef5939 gui=bold
hi Function		guifg=#33ffff

"hi WildMenu     guibg=#2e3436 guifg=#ffffff gui=bold
"hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none
hi WildMenu     guifg=#ffffff guibg=#3465a4 gui=none

hi Pmenu        guibg=#000000 guifg=#c0c0c0
hi PmenuSel     guibg=#66ff00 guifg=#000000
hi PmenuSbar    guibg=#444444 guifg=#444444
hi PmenuThumb   guibg=#888888 guifg=#888888 

hi cppSTLType   guifg=#729fcf gui=bold

hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#ad7fa8
hi spellLocal   guisp=#729fcf

hi link cppSTL          Function
hi link Error			Todo
hi link Character		Number
hi link rubySymbol		Number
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
" hi link shDeref			Identifier
hi shDeref 		guifg=#99ffff
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant

" tabs (non gui)
hi TabLine		guifg=#A3A3A3 guibg=#202020 gui=none
hi TabLineFill	guifg=#535353 guibg=#202020 gui=none
hi TabLineSel	guifg=#FFFFFF gui=bold
"hi TabLineSel	guifg=#FFFFFF guibg=#000000 gui=bold
" vim: sw=4 ts=4
