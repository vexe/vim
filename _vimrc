"Windo('one') endifo('one') endifs compatibility
behave mswin
		autocmd CursorMoved * call StoreCurrentPosition() | call TryMarkLastPos()
source $VIMRUNTIME/mswin.vim
let $PATH .= ';C:\Windows\SysWOW64'

""{{{ -- AutoCommands --
	" Start maximized
	augroup OnEnter
		autocmd!
		autocmd GUIEnter * simalt ~x
		"autocmd VimEnter * Nyancat
	augroup END
	" Auto set working directory
	augroup UpdateCWD
		autocmd!
		autocmd BufEnter * silent! lcd %:p:h
		autocmd BufEnter * call StoreCurrentPosition()
	augroup END
	augroup FileTypes
		autocmd!
		" C# semi colin
		autocmd FileType cs
	   		\set foldmethod=syntax |
			\inoremap <cr> <esc>:call InsertReturn()<cr>
		autocmd FileType vim set foldmethod=marker

		"autocmd FileType cs
			"\ set foldmethod=syntax |
			"\ inoremap <expr> ; ';' . (IsEOL() ? '<esc>:OmniSharpCodeFormat<cr>A<cr>' : '')
	augroup END
	"Cursor Change"
	"augroup CursorChange
		"autocmd!
		"autocmd CursorMoved * call StoreCurrentPosition() | call TryMarkLastPos()
		"autocmd CursorMoved * call TryMarkLastPos() | call StoreCurrentPosition()
	"augroup END
	"nnoremap <silent><leader>nb :call NavigateBackward()<cr>
	"nnoremap <silent><leader>nf :call NavigateForward()<cr>
""}}}

""{{{ -- Misc Settings --
	set nocompatible
	set shellslash
	set backspace=2
	set guifont=Consolas:h12:cANSI	"Font
	set number relativenumber		"line numbers"
	"color gold
	"color badwolf
	"color sexyblues
	"color molokai
	"color darkspectrum
	"color codeblocks_dark
	color neon
	syntax on
	set nowrap
	set smartindent
	set tabstop=4
	set shiftwidth=4
	set textwidth=100
	set guioptions =brL
	"set guioptions =e 				" tab bar
	"set showtabline =1 			" show tabbar if there's at least 2 tabs
	set laststatus=2				" always display statusline
	set cursorline					" highlights current line
	filetype plugin indent on
	set noswapfile
	set nobackup
	set hlsearch					" highlights all the found instances in a search
	set ignorecase					" Ignore case when searching
	set smartcase					" Ignore case if search is all lowercase, case-sensitive otherwise.
	set incsearch					" Show search matches as you type.
	scriptencoding utf-8			" UTF-8 encoding
	let mouse="a"					" Enable mouse
	"set guioptions=b 				" Bottom scroll-bar
	set guioptions=

	" Invisible chars
	set list
	set listchars=tab:\»\ ,eol:\¬,trail:.
	nmap <leader>l :set list!<CR>
""}}}

""{{{ -- Plugins --

	"Tagbar
	nnoremap <leader>tb :TagbarToggle<cr>

	"Tabularize
	nnoremap <leader>t= :Tabularize /=<cr>
	nnoremap <leader>t{ :Tabularize /{<cr>
	nnoremap <leader>t: :Tabularize /:<cr>

	"easytags
		let g:easytags_auto_highlight = 0
		let g:easytags_async = 1

	"autoformat"
		let g:formatprg_args_cs = "--mode=cs --style=ansi
					\ --keep-one-line-blocks
					\ --close-templates
					\ --break-closing-brackets
					\ --align-pointer=type
					\ --unpad-paren
					\ --pad-oper
					\ --indent-col1-comments
					\ --indent-preproc-cond
					\ --indent-labels
					\ --indent-namespaces
					\ --indent-switches
					\ --indent-modifiers
					\ --indent-classes
					\ -pcHs4"

	"TrailingWhitespaces"
		nnoremap <leader>fw :FixWhitespace<cr>

	"CtrlP"
		set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.meta
		nnoremap <C-m><c-p> :CtrlPMRU<cr>

		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll|meta)$',
		  \ 'link': 'some_bad_symbolic_links',
		  \ }

	"NeoComplCache"
		" Disable AutoComplPop.
		"let g:acp_enableAtStartup = 0
		"" Use neocomplcache.
		"let g:neocomplcache_enable_at_startup = 1
		"" Use smartcase.
		"let g:neocomplcache_enable_smart_case = 1
		"" Set minimum syntax keyword length.
		"let g:neocomplcache_min_syntax_length = 3
		"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

		"" Enable heavy features.
		"" Use camel case completion.
		""let g:neocomplcache_enable_camel_case_completion = 1
		"" Use underbar completion.
		""let g:neocomplcache_enable_underbar_completion = 1

		"" Define dictionary.
		"let g:neocomplcache_dictionary_filetype_lists = {
			"\ 'default' : '',
			"\ 'vimshell' : $HOME.'/.vimshell_hist',
			"\ 'scheme' : $HOME.'/.gosh_completions'
				"\ }

		"" Define keyword.
		"if !exists('g:neocomplcache_keyword_patterns')
			"let g:neocomplcache_keyword_patterns = {}
		"endif
		"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

		"" Plugin key-mappings.
		""inoremap <expr><C-g>     neocomplcache#undo_completion()
		""inoremap <expr><C-l>     neocomplcache#complete_common_string()

		"" Recommended key-mappings.
		"" <CR>: close popup and save indent.
		"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		"function! s:my_cr_function()
		  "return neocomplcache#smart_close_popup() . "\<CR>"
		  "" For no inserting <CR> key.
		  ""return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
		"endfunction
		"" <TAB>: completion.
		"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
		"" <C-h>, <BS>: close popup and delete backword char.
		"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
		"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
		"inoremap <expr><C-y>  neocomplcache#close_popup()
		"inoremap <expr><C-e>  neocomplcache#cancel_popup()
		"" Close popup by <Space>.
		""inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

		"" Enable omni completion.
		"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
		"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
		"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

		"" Enable heavy omni completion.
		"if !exists('g:neocomplcache_omni_patterns')
		  "let g:neocomplcache_omni_patterns = {}
		"endif
		"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
		"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
		"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

		"" For perlomni.vim setting.
		"" https://github.com/c9s/perlomni.vim
		"let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

	"Vim-shell"
		"let g:shell_fullscreen_items = "mT"
		let g:shell_fullscreen_always_on_top = 0

	"BufSurf"
		" Move [for|back]ward in buffer editing history
		nnoremap <leader>ba :BufSurfBack<cr>
		nnoremap <leader>bd :BufSurfForward<cr>
		nnoremap <leader>bs :BufSurfList<cr>

	"UltiSnips"
		" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
		let g:UltiSnipsExpandTrigger="<s-tab>"
		let g:UltiSnipsJumpForwardTrigger="<c-k>"
		let g:UltiSnipsJumpBackwardTrigger="<c-i>"

		" If you want :UltiSnipsEdit to split your window.
		let g:UltiSnipsEditSplit="vertical"

	"Smooth scroll"
		noremap <silent> <c-f> m':call smooth_scroll#down(&scroll * 1, 1, 1)<CR>
		noremap <silent> <c-b> m':call smooth_scroll#up(&scroll * 1, 1, 1)<CR>
"
	"bufferline"
  		let g:bufferline_modified = '*'
  		let g:bufferline_echo = 1

	"Airline"
		" Enable the list of buffers
		let g:airline#extensions#tabline#enabled = 1

		" Show just the filename
		let g:airline#extensions#tabline#fnamemod=':t'

		" enable/disable displaying buffers with a single tab
		let g:airline#extensions#tabline#show_buffers = 1

		" buffer numbers
    	let g:airline#extensions#tabline#buffer_nr_show = 1

	""OmniSharp"
		""This is the default value, setting it isn't actually necessary
		"let g:OmniSharp_host = "http://localhost:2000"

		""Set the type lookup function to use the preview window instead of the status line
		""let g:OmniSharp_typeLookupInPreview = 1

		""Timeout in seconds to wait for a response from the server
		"let g:OmniSharp_timeout = 1

		""Showmatch significantly slows down omnicomplete when the first match contains parentheses.
		"set noshowmatch

		""Super tab settings
		"let g:SuperTabDefaultCompletionType = 'context'
		"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
		"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
		"let g:SuperTabClosePreviewOnPopupClose = 1

		""don't autoselect first item in omnicomplete, show if only one item (for preview)
		""remove preview if you don't want to see any documentation whatsoever.
		"set completeopt=longest,menuone,preview
		""
		"" Fetch full documentation during omnicomplete requests.
		"" There is a performance penalty with this (especially on Mono)
		"" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
		"" you need it with the :OmniSharpDocumentation command.
		"" let g:omnicomplete_fetch_documentation=1

		""Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
		""You might also want to look at the echodoc plugin
		"set splitbelow

		"nnoremap <leader>fi :OmniSharpFindImplementations<cr>
		"nnoremap <leader>ft :OmniSharpFindType<cr>
		"nnoremap <A-t>      :OmniSharpFindType<cr>
		"nnoremap <leader>fs :OmniSharpFindSymbol<cr>
		"nnoremap <A-g>      :OmniSharpFindSymbol<cr>
		"nnoremap <leader>fu :OmniSharpFindUsages<cr>
		"nnoremap <A-u>      :OmniSharpFindUsages<cr>
		"nnoremap <leader>fm :OmniSharpFindMembers<cr>

		"" cursor can be anywhere on the line containing an issue for this one
		"nnoremap <leader>x  :OmniSharpFixIssue<cr>
		"nnoremap <leader>fx :OmniSharpFixUsings<cr>
		"nnoremap <leader>tt :OmniSharpTypeLookup<cr>
		"nnoremap <leader>dc :OmniSharpDocumentation<cr>

		"" Get Code Issues and syntax errors
		"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
		""autocmd BufEnter,TextChanbed,InsertLeave *.cs SyntasticCheck

		"" this setting controls how long to pause (in ms) before fetching type / symbol information.
		"set updatetime=500
		"" Remove 'Press Enter to continue' message when type information is longer than one line.
		"set cmdheight=2

		"" Contextual code actions (requires CtrlP)
		"nnoremap <leader><cr> :OmniSharpGetCodeActions<cr>
		"" Run code actions with text selected in visual mode to extract method
		"vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

		"" rename with dialog
		"nnoremap <leader>rn :OmniSharpRename<cr>
		"nnoremap <A-r> :OmniSharpRename<cr>
		"nnoremap <F2> :OmniSharpRename<cr>
		"" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
		"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

		"" Force OmniSharp to reload the solution. Useful when switching branches etc.
		"nnoremap <leader>rl :OmniSharpReloadSolution<cr>
		"nnoremap <leader>cf :OmniSharpCodeFormat<cr>
		"" Load the current .cs file to the nearest project
		"nnoremap <leader>tp :OmniSharpAddToProject<cr>

		"augroup OmniSharp
			"autocmd!

			"autocmd BufWritePost *.cs SyntasticCheck

			"autocmd BufWinEnter *.cs OmniSharpHighlightTypes

			""Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
			"autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

			"" Synchronous build (blocks Vim)
			""autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
			"" Builds can also run asynchronously with vim-dispatch installed
			"autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>

			""The following commands are contextual, based on the current cursor position.
			"autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>

			"" Automatically add new cs files to the nearest project on save
			"autocmd BufWritePost *.cs call OmniSharp#AddToProject()

			""show type information automatically when the cursor stops moving
			"autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
		"augroup END

		"" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
		"nnoremap <leader>ss :OmniSharpStartServer<cr>
		"nnoremap <leader>sp :OmniSharpStopServer<cr>
		"nnoremap <leader>sr :OmniSharpStopServer<cr>:OmniSharpStartServer<cr>

		"" Add syntax highlighting for types and interfaces
		"nnoremap <silent><leader>th :OmniSharpHighlightTypes<cr>
		""Don't ask to save when changing buffers (i.e. when jumping to a type definition)
		"set hidden

	"Syntastic"
		" C# checker
		let $Path .= ';C:\Program Files (x86)\Mono-3.2.3\bin'
		" Error line
    	highlight SyntasticErrorLine guibg=#2f0000
		let g:syntastic_cursor_column = 0

	"Pathogen"
		let g:pathogen_disabled = ['GoldenView', 'minibufexpl', 'vim-bufferline', 'OmniSharp', 'vim-session', 'syntastic', 'mru', 'vim-autoformat', 'vim-dispatch', 'unite.vim', 'restore_view.vim, neocomplcache.vim']
		execute pathogen#infect()

	" MRU
		nnoremap <leader>mr :MRU<cr>
""}}}

""{{{ -- Mappings
	"Essential"
		" Leader
		let mapleader = ","
		" Quick vimrc edit
		nnoremap <leader>ev :vsplit $MYVIMRC <cr>
		" Quick vimrc reload (sourcing)
		nnoremap <leader>so :source $MYVIMRC <Bar>nohlsearch<cr>
		" Clean search
		nnoremap <silent><A-c> :nohlsearch<Return>
		inoremap <silent><A-c> <esc>:nohlsearch<Return>a
		" Quick insert/normal modes toggle
		nnoremap <A-e> i
		inoremap <silent><A-e> <esc>:call GoRightIfNotBOL()<cr>
		inoremap <expr><A-e> "<esc>".(IsBOL()?'':'l')

	"Mouse"
		" Middle mouse pasting
		nnoremap <MiddleMouse> <Nop>
		inoremap <MiddleMouse> <Nop>

		" Make mouse clicks leave jump marks
		nnoremap <LeftMouse> m'<LeftMouse>
		inoremap <LeftMouse> <c-o>m'<LeftMouse>

	"Movement"
		" Basic navigation - Leave marks when moving vertically
		"noremap <silent> k :<c-u>call VerticalMarks("j")<cr>
		"noremap <silent> i :<c-u>call VerticalMarks("k")<cr>

		noremap k gj
		noremap i gk

		noremap j h
		"noremap k j
		"noremap i k

		inoremap <C-l> <esc>ea
		inoremap <C-j> <esc>bi
		" Jump to matching braket
		nnoremap <A-m> %
		inoremap <A-m> <esc>%i
		" Jump to last cursor position
		nnoremap <A--> ``
		" Quick jump
		nmap <Space> G
		vmap <Space> G
		" Quick navigation, home, end, etc.
		inoremap <A-j> <Esc>^i
		inoremap <A-k> <Esc>o
		inoremap <A-l> <Esc>$a
		inoremap <A-i> <Esc>O
		nnoremap <A-j> ^i
		nnoremap <A-k> o
		nnoremap <A-l> $a
		nnoremap <A-i> O
		nnoremap <A-S-j> ^
		nnoremap <A-S-l> $
		vnoremap <A-j> ^
		vnoremap <A-l> $
		" Jump to next { or  }
		vnoremap <silent> <A-,> ?{<CR>
		vnoremap <silent> <A-.> /{<CR>
		nnoremap <silent> <A-,> ?{<CR>
		nnoremap <silent> <A-.> /{<CR>

		"Scroll screen 'without' moving cursor
		nnoremap <C-i> <C-y>
		nnoremap <C-k> <C-e>

	"Clipboard"
		" Undoing
		nnoremap <C-z> u
		inoremap <C-z> <C-[>ui
		" This is due to the fact that in VS, Ctrl-V is reserved for paste
		noremap <A-v> <C-v>

	"Other"
		" This A-f's a BITCH! I don't know what it does but it always fucks things up for me!
		nnoremap <A-f> <Nop>
		" For recording purposes, fast repeating.
		nnoremap <A-q> @a
		" Change inside
		nnoremap I ci
		nnoremap A ca
		" Duplicate current line
		nnoremap <A-d> yyp
		vnoremap <A-d> yP

		" Jumps cursor inside braces http://stackoverflow.com/questions/9621173/vim-and-indentation-with-brackets-braces
		inoremap {<CR> {<CR>}<C-o>O

	"Visual/Select"
		" Visually select the current word
		nnoremap v<space> viw
		" Select everything
		nnoremap <C-a> ggvGl
		inoremap <C-a> <C-[>ggvGl

	"Numerics"
		" [de-in]crement
		nnoremap <A-a> <C-a>
		nnoremap <A-x> <C-x>

	"Nops"
		" Tab in normal mode acts weird sometimes
		"nnoremap <Tab> <nop>

	"String/Text ops"
		" To lower:
		nnoremap <leader><c-u> ebveu
		" To upper:
		nnoremap <leader><s-u> ebveU
		"Text swapping (bubbling)"
			" Single line
			nnoremap <C-Up> VdkP
			nnoremap <C-Down> Vdp
			" Multiple line
			vnoremap <C-Up> xkP`[V `]
			vnoremap <C-Down> xp`[V`]
			" Word swapping
			" nnoremap <C-Right> bdwf pjj
			" nnoremap <C-Left> bdwbhp

	"Deletion"
		" Delete word under cursor
		nnoremap d<space> diw
		nnoremap c<space> ciw
		" Delete all empty lines
		nnoremap <A-S-d> :g/^$/d <Return>
		" delete word to the left of cursor.
		inoremap <C-BS> <C-W>
		" Enhanced change line
		nnoremap <silent>cc :call ChangeCurrentLine()<cr>a

	"GUI"
		" Toggle menu bar
		nnoremap <silent><leader>tm :call ToggleMenuBar()<cr>

		" Zoom in/out
		nnoremap <leader>z=   :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)+1)', '')<CR>
		nnoremap <leader>z-   :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', '')<CR>

	"Buffers"
		" Show a menu to complete buffer and file names
		set wildchar=<Tab> wildmenu wildmode=full"

		" Writing/saving
		inoremap <C-s> <C-[>:w <Enter>a
		nnoremap <C-s> :w <Enter>

		" To open a new empty buffer
		nnoremap <leader>T :enew<cr>

		" Move to the next buffer
		nnoremap <leader>l :bnext<CR>

		" Move to the previous buffer
		nnoremap <leader>j :bprevious<CR>

		" Close the current buffer and move to the previous one
		" This replicates the idea of closing a tab
		nnoremap <leader>bq :bp <BAR> bd #<CR>

		" Show all open buffers and their status
		nnoremap <leader>bl :ls<CR>

	"Tabs"
		" Next/Previous tab
		"nnoremap ) :tabnext<CR>
		"nnoremap ~ :tabprevious<CR>
		" Tab Navigation
		"noremap <C-t>  :tabnew
		"noremap <C-q>  :close!   <Enter>
		"noremap <A-1>  :tabnext1 <Enter>
		"noremap <A-2>  :tabnext2 <Enter>
		"noremap <A-3>  :tabnext3 <Enter>
		"noremap <A-4>  :tabnext4 <Enter>
		"noremap <A-5>  :tabnext5 <Enter>
		"noremap <A-6>  :tabnext6 <Enter>
		"noremap <A-7>  :tabnext7 <Enter>
		"noremap <A-8>  :tabnext8 <Enter>
		"noremap <A-9>  :tabnext9 <Enter>

	"Windows"
		" Switching windows
		nnoremap <silent> <leader>wi :wincmd k<CR>
		nnoremap <silent> <leader>wk :wincmd j<CR>
		nnoremap <silent> <leader>wj :wincmd h<CR>
		nnoremap <silent> <leader>wl :wincmd l<CR>
		" Resizing
		nnoremap <C-Right> :15winc ><CR>
		nnoremap <C-Left> :15winc <<CR>
		nnoremap <C-Up> <C-w>5-
		nnoremap <C-Down> <C-w>5+
		" Veritcal/Horizontal Splits
		nnoremap <leader>sv <C-w>v
		nnoremap <leader>sh <C-w>s
	"Auto completion"
		"inoremap <C-o> <C-p>
		"inoremap <C-Space> <C-x><C-o>
	" Folding
		" Toggle current fold
		"nnoremap zf za
		"vnoremap zf za
		nnoremap <A-f> za
		vnoremap <A-f> za
		" Fold everything
		nnoremap <A-a> zM
		" Unfold everything
		nnoremap <A-u> zR
""}}}

""{{{ -- Functions --
nnoremap <silent> z. :call NextClosedFold('j')<cr>
nnoremap <silent> z, :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

	"define a list to hold the positions stack"
	"the ability to traverse the list back and forth"
	let CursorPositions  = []
	let PrevPos = []
	"let PrevJump = []
	let CurIndex = 0

	"function! OnCursorMoved()
		""echo "Cursor moved to: " . line('.') . ':' . col('.')
		""echo 'index: ' . g:CurIndex . ' list: ' . string (g:CursorPositions)
		"let l:current = [line('.'), col('.')]
		"if (l:current != g:PrevJump)
			""echo "adding: " . string(l:current)
			"let g:CursorPositions = add(g:CursorPositions, l:current)
			"let g:CurIndex = len(g:CursorPositions) - 1
		"endif
	"endf

	"function! NavigateForward()
		"let l:toIndex = g:CurIndex + 1
		"if (l:toIndex < len(g:CursorPositions))
			"call NavigateTo(l:toIndex)
		"endif
	"endf

	"function! NavigateBackward()
		"let l:toIndex = g:CurIndex - 1
		"if (l:toIndex > 0)
			"call NavigateTo(l:toIndex)
		"endif
	"endf asdlkfj

	"function! NavigateTo(index)
		"let l:newJump = g:CursorPositions[a:index]
		"let g:CurIndex = a:index
		"let g:PrevJump = l:newJump
		"call cursor(l:newJump[0], l:newJump[1])
	"endf

	"function! ResetCursorPositions()
		"let g:CursorPositions = [[line('.'), col('.')]]
	"endf

	fun! InsertSemiColin()
		if (!IsEOL()) | exec "normal! a;" | return | endif
		exec "normal! a;\<cr>"
		"exec "normal! \<esc>:OmniSharpCodeFormat\<cr>A;\<cr>"
	endf

	fun! IsEOL()
		" col number == length of current line?
		return col('.') >= strlen(getline('.'))
	endf

	function! ToggleStringValue(input, value)
		let l:result = a:input
		if l:result =~ a:value
			let l:result = substitute(l:result, a:value, "", "")
		else
			let l:result .= a:value
		endif
		return l:result
	endfu

	" Make j and k leave jump marks when used with counts
	function! VerticalMarks(motion)
		" The adding of 'g' is so that when a line is wrapped, going down won't go to the very
		" last line, but will go to the next row.
		" Basically gj takes you down, and gk up (single line)
		"execute 'normal! ' . (v:count1 > 1 ? "m'" . v:count1 : '') . 'g' . a:motion
		execute 'normal! ' . (v:count1 > 1 ? "m'" . v:count1 : '') . 'g' . a:motion
	endfunction

	fun! StoreCurrentPosition()
		let g:PrevPos = GetCurrentCursorPos()
		"let g:CursorPositions = add(g:CursorPositions, GetCurrentCursorPos())
		"let g:CurIndex += 1
	endf

	fun! GetCurrentCursorPos()
		return [line('.'), col('.')]
	endf

	fun! SetCursor(pos)
		call cursor(a:pos[0], a:pos[1])
	endf

	fun! TryMarkLastPos()
		if v:count1 <= 1 | return | endif
		"let l:lastPos = g:CursorPositions[-1]
		let l:currentPos = GetCurrentCursorPos()
		call SetCursor(g:PrevPos)
		exec "normal! m'"
		call SetCursor(l:currentPos)
	endf

	function! ToggleMenuBar()
		let &g:guioptions = ToggleStringValue(&g:guioptions, "m")
	endfu

	function! IsLineEmpty(line)
		return match(a:line, '^\s*$') == -1 ? 0 : 1
	endfu

	function! ChangeCurrentLine()
		execute "normal! " . (IsCurrentLineEmpty() ? "0" : "^") . "C"
	endfu

	function! IsCurrentLineEmpty()
		return IsLineEmpty(getline('.'))
	endfu

	" Returns 1 if the cursor is at the beginning of a line "
	function! IsBOL()
		return col('.') == 1
	endfu

	function! GoRightIfNotBOL()
		if !IsBOL()
			execute "normal l"
		endif
	endfu
""}}}

" CUSTOM COMMANDS
"command! TT NERDTreeToggle | TlistToggle

" AUTOCMD EVENTS
"autocmd BufRead,BufNewFile * :normal gg=G

" Start NERDTree and Tlist on vim startup
" autocmd VimEnter * TT
"
" Just to jump the cursor back to the opened buffer to the left.
" use 'l' instead of 'h' if you wanna take it to the right, instead.
" autocmd VimEnter * wincmd h
"
" Automatically change to the current working directory
" autocmd BufEnter * silent! lcd %:p:h

" Autoreload .vimrc when changing it if it's open (current buffer) after
" saving/writing it.
" if has("autocmd")
" autocmd! bufWritePost .vimrc source $MYVIMRC
" endif

" Running, compiling ...
" map <C-F5> :!gnome-terminal -e 'run2.sh %'<CR>
" imap <C-F5> <C-[> :!gnome-terminal -e 'run2.sh %'<CR>
" map <F5> :!gnome-terminal -e 'run2.sh % -d' <Enter>
" imap <F5> <C-[> :!gnome-terminal -e 'run2.sh % -d' <Enter>
" map <C-A-b> :!compile.sh % <CR>
" imap <C-A-b> <esc>:!compile.sh % <CR>
" map <F4> :w <bar> !./%
" imap <F4> <esc>:w <bar> !./%
" map <F5> :w <bar> !./binary
" imap <F5> <esc>:w <bar> !./binary
" map <C-F5>  :w <bar> !xterm -e run_script.sh %
" imap <C-F5> <esc>:w <bar> !xterm -e run_script.sh %
" map <C-F4>  :w <bar> !xterm -e run_script.sh %
" imap <C-F4> <esc>:w <bar> !xterm -e run_script.sh %

" NERDTree
"map <F3> :TT <Enter>:wincmd h<Enter>
"imap <F3> <C-[>:TT <Enter>:wincmd h<Enter>
"let NERDTreeMapOpenSplit='h'
" starting it at the right...
"let g:NERDTreeWinPos = "right"

" Tlist
"map <F2> :TlistToggle <Enter>
"imap <F2> <C-[>:TlistToggle <Enter>
"let Tlist_Use_Horiz_Window = 0
"let Tlist_Use_Right_Window = 1
" This will let it run with NERDTree split in half.
"let Tlist_Use_Split_Window = 1

""let g:is_bash=1
""let g:sh_fold_enabled=3

"Function for commenting a block of Visually selected text
"function Comment(fl, ll)
"let i=a:fl
"let comment="//"
"while i<=a:ll
"let cl=getline(i)
"let cl2=comment.cl
"call setline(i, cl2)
"let i=i+1
"endwhile
"endfunction

"Function for Un-Commenting a block of Visually selected text
"function UnComment(fl, ll)
"let i=a:fl
"let comment="//"
"while i<=a:ll
"let cl=getline(i)
"let cl2=substitute(cl, "//", "", "")
"call setline(i, cl2)
"let i=i+1
"endwhile
"endfunction
