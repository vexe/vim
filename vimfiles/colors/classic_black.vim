hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

hi Normal                 ctermfg=green guifg=green  guibg=black


hi SpecialKey     term=bold ctermfg=4
hi NonText        term=bold cterm=bold ctermfg=4
hi Directory      term=bold ctermfg=4
hi ErrorMsg       term=standout cterm=bold ctermfg=7 ctermbg=1
hi IncSearch      term=reverse cterm=reverse
hi Search         term=reverse ctermfg=0 ctermbg=3
hi MoreMsg        term=bold ctermfg=2
hi ModeMsg        term=bold cterm=bold
hi LineNr         term=underline ctermfg=3
hi Question       term=standout ctermfg=2
hi StatusLine     term=bold,reverse cterm=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse
hi VertSplit      term=reverse cterm=reverse
hi Title          term=bold ctermfg=5
hi Visual         term=reverse cterm=reverse
hi WarningMsg     term=standout ctermfg=1
hi WildMenu       term=standout ctermfg=0 ctermbg=3
hi Folded         term=standout ctermfg=4 ctermbg=7
hi FoldColumn     term=standout ctermfg=4 ctermbg=7
hi DiffAdd        term=bold ctermbg=1
hi DiffChange     term=bold ctermbg=5
hi DiffDelete     term=bold cterm=bold ctermfg=4 ctermbg=6
hi DiffText       term=reverse cterm=bold ctermbg=1
hi SignColumn     term=standout ctermfg=4 ctermbg=7
hi SpellBad       term=reverse ctermbg=1
hi SpellCap       term=reverse ctermbg=4
hi SpellRare      term=reverse ctermbg=5
hi SpellLocal     term=underline ctermbg=6
hi Pmenu          ctermbg=5
hi PmenuSel       ctermbg=7
hi PmenuSbar      ctermbg=7
hi PmenuThumb     cterm=reverse
hi TabLine        term=underline cterm=underline ctermfg=0 ctermbg=7
hi TabLineSel     term=bold cterm=bold
hi TabLineFill    term=reverse cterm=reverse
hi CursorColumn   term=reverse ctermbg=7
hi CursorLine     term=underline cterm=underline gui=underline guibg=black
hi MatchParen     term=reverse ctermbg=6
hi Comment        term=bold ctermfg=4
hi Constant       term=underline ctermfg=1 guifg=red
hi Special        term=bold ctermfg=3
hi Identifier     term=underline ctermfg=6
hi Statement      term=bold ctermfg=3 guifg=darkyellow
hi PreProc        term=underline ctermfg=5 guifg=magenta
hi Type           term=underline ctermfg=2
hi Underlined     term=underline cterm=underline ctermfg=5
hi Ignore         cterm=bold ctermfg=7
hi Error          term=reverse cterm=bold ctermfg=7 ctermbg=1
hi Todo           term=standout ctermfg=0 ctermbg=3