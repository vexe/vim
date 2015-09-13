" Vim color file
" Maintainer:	Mikel Ward <mikel@mikelward.com>
" Last Change:	2008 Jan 16

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
"if exists("syntax_on")
"	syntax reset
"endif

let colors_name = "basic"

" Remove all hiing
hi clear Constant
hi clear Number
hi clear Statement
hi clear PreProc
hi clear Type
hi clear Special
hi clear Identifier

hi clear String
hi clear Comment
hi clear Error
hi clear LineNr
hi clear NonText
hi clear SpecialKey

" Set up some simple non-intrusive colors
hi String term=underline cterm=NONE ctermfg=Magenta
hi Comment term=bold cterm=NONE ctermfg=Cyan
hi Error term=reverse cterm=NONE ctermbg=Red
hi LineNr term=bold cterm=NONE ctermfg=Yellow
hi NonText term=bold cterm=NONE ctermfg=Yellow
hi SpecialKey term=bold cterm=NONE ctermfg=Yellow
hi Cursor gui=NONE guifg=#121212 guibg=#afd700
hi MatchParen gui=NONE guifg=NONE guibg=NONE
"hi VertSplit gui=NONE guifg=#81EB86 guibg=#212121
