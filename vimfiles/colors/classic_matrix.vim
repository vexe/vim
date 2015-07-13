hi clear
syntax reset
let g:colors_name = "classic_matrix"
if &background == "light"
    hi Boolean gui=NONE guifg=#707070 guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#f5f5f5
    hi Comment gui=NONE guifg=#969696 guibg=NONE
    hi Conceal gui=NONE guifg=#707070 guibg=NONE
    hi Conditional gui=NONE guifg=#4a4a4a guibg=NONE
    hi Constant gui=NONE guifg=#707070 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#f5f5f5
    hi CursorLine gui=NONE guifg=NONE guibg=#f5f5f5
    hi CursorLineNr gui=NONE guifg=#969696 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#f0fff0
    hi DiffChange gui=NONE guifg=NONE guibg=#f5f5f5
    hi DiffDelete gui=NONE guifg=NONE guibg=#fff0f0
    hi DiffText gui=NONE guifg=NONE guibg=#e3e3e3
    hi Directory gui=NONE guifg=#4a4a4a guibg=NONE
    hi Error gui=NONE guifg=NONE guibg=#fff0f0
    hi ErrorMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi FoldColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Folded gui=NONE guifg=#969696 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#e3e3e3
    hi LineNr gui=NONE guifg=#c2c2c2 guibg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#e3e3e3
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Normal gui=NONE guifg=#000000 guibg=#ffffff
    hi Number gui=NONE guifg=#707070 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#f5f5f5
    hi PmenuSbar gui=NONE guifg=NONE guibg=#ededed
    hi PmenuSel gui=NONE guifg=NONE guibg=#e3e3e3
    hi PmenuThumb gui=NONE guifg=NONE guibg=#dbdbdb
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#ededed
    hi SignColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Special gui=NONE guifg=#707070 guibg=NONE
    hi SpecialKey gui=NONE guifg=#c2c2c2 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#fff0f0
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#f0fff0
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#ededed
    hi Statement gui=NONE guifg=#4a4a4a guibg=NONE
    hi StatusLine gui=NONE guifg=#262626 guibg=#ededed
    hi StatusLineNC gui=NONE guifg=#969696 guibg=#ededed
    hi StorageClass gui=NONE guifg=#4a4a4a guibg=NONE
    hi String gui=NONE guifg=#707070 guibg=NONE
    hi TabLine gui=NONE guifg=#969696 guibg=#ededed
    hi TabLineFill gui=NONE guifg=NONE guibg=#ededed
    hi TabLineSel gui=NONE guifg=#262626 guibg=#ededed
    hi Title gui=NONE guifg=#707070 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#4a4a4a guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#e3e3e3 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#e3e3e3
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi WildMenu gui=NONE guifg=NONE guibg=#d1d1d1
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
elseif &background == "dark"
    hi Boolean gui=NONE guifg=#88ed69 guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#171717
    hi Comment gui=NONE guifg=#88ed69 guibg=NONE
    hi Conceal gui=NONE guifg=#707070 guibg=NONE
    hi Conditional gui=NONE guifg=#76e953 guibg=NONE
    hi Constant gui=NONE guifg=#707070 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#171717
    hi CursorLine gui=NONE guifg=NONE guibg=#171717
    hi CursorLineNr gui=NONE guifg=#636363 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#091f09
    hi DiffChange gui=NONE guifg=NONE guibg=#171717
    hi DiffDelete gui=NONE guifg=NONE guibg=#1f0909
    hi DiffText gui=NONE guifg=NONE guibg=#2e2e2e
    hi Directory gui=NONE guifg=#7d7d7d guibg=NONE
    hi Error gui=NONE guifg=NONE guibg=#1f0909
    hi ErrorMsg gui=NONE guifg=NONE guibg=#1f0909
    hi FoldColumn gui=NONE guifg=#545454 guibg=NONE
    hi Folded gui=NONE guifg=#636363 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#2e2e2e
    hi LineNr gui=NONE guifg=#545454 guibg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#2e2e2e
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#545454 guibg=NONE
    hi Normal gui=NONE guifg=#88ed69 guibg=#232523
    hi Number gui=NONE guifg=#88ed69 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#171717
    hi PmenuSbar gui=NONE guifg=NONE guibg=#212121
    hi PmenuSel gui=NONE guifg=NONE guibg=#2e2e2e
    hi PmenuThumb gui=NONE guifg=NONE guibg=#3b3b3b
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#212121
    hi SignColumn gui=NONE guifg=#545454 guibg=NONE
    hi Special gui=NONE guifg=#39ac25 guibg=NONE
    hi SpecialKey gui=NONE guifg=#545454 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#1f0909
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#091f09
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#212121
    hi Statement gui=NONE guifg=#88ed69 guibg=NONE
    hi StatusLine gui=NONE guifg=#8a8a8a guibg=#212121
    hi StatusLineNC gui=NONE guifg=#636363 guibg=#212121
    hi StorageClass gui=NONE guifg=#88ed69 guibg=NONE
    hi String gui=NONE guifg=#88ed69 guibg=NONE
    hi TabLine gui=NONE guifg=#636363 guibg=#212121
    hi TabLineFill gui=NONE guifg=NONE guibg=#212121
    hi TabLineSel gui=NONE guifg=#8a8a8a guibg=#212121
    hi Title gui=NONE guifg=#707070 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#88ed69 guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#2e2e2e guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#2e2e2e
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#1f0909
    hi WildMenu gui=NONE guifg=NONE guibg=#474747
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
endif