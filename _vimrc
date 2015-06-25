behave mswin
source $VIMRUNTIME/mswin.vim
let $PATH .= ';C:\Windows\SysWOW64'

""{{{ -- AutoCommands --

augroup FormatOptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=cro
augroup END
    "Start maximized
    augroup OnEnter
        autocmd!
        autocmd VimEnter * Fullscreen
        autocmd GUIEnter * simalt ~x
    augroup END
    " Auto set working directory
    augroup UpdateCWD
        autocmd!
        autocmd BufEnter * silent! lcd %:p:h
    augroup END
    augroup FileTypes
        autocmd!
        autocmd FileType vim set foldmethod=marker
    augroup END
""}}}

""{{{ -- Misc Settings --
	set expandtab
    set nocompatible
	set shellslash
	set backspace=2
	set guifont=Consolas:b:h12:cANSI "use _ for spaces
	set number relativenumber
	"color gold
	"color badwolf
	"color sexyblues
	"color molokai
	"color darkspectrum
	"color codeblocks_dark
	"color neon
	"color darkburn
    "color jellybeans
    "color obsidian
    color mustang
    syntax on
	set nowrap
    set smartindent
	set tabstop=4
	set shiftwidth=4
	set textwidth=100
	set guioptions=brL
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
	set guioptions=                 " no gui, whatsoever
    set autoread                    " auto read files after they're modified without displaying a prompt
""}}}

""{{{ -- Plugins --

    "NERDTree
    let g:NERDTreeWinPos = "right"

	"Easytags
	"nnoremap <A-d> <C-]>
    "let g:easytags_auto_highlight = 0
    "let g:easytags_async = 1

	"Tabularize
	nnoremap <leader>t= :Tabularize /=<cr>
	nnoremap <leader>t{ :Tabularize /{<cr>
	nnoremap <leader>t: :Tabularize /:<cr>

	"TrailingWhitespaces"
    nnoremap <leader>fw :FixWhitespace<cr>

	"CtrlP"
		set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.meta,*.mat,*.suo,*.csproj,*.sln,*.dwlt,*.asset,*.unity,*.db,*.xml,*.cache,*.prefab,*.fbx,*.max,*.lxo,*.blend,*.obj,*.3DS,*.smd,*.mp3,*.ogg,*.wav,*.png,*.jpg,*.prefs,*.anim,*.unityproj
		nnoremap <C-m><c-p> :CtrlPMRU<cr>

		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll|meta)$',
		  \ 'link': 'some_bad_symbolic_links',
		  \ }

	"Vim-shell"
		"let g:shell_fullscreen_items = "mT"
		let g:shell_fullscreen_always_on_top = 0

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

	"Pathogen"
		let g:pathogen_disabled = ['vim-easytags', 'tagbar', 'vim-airline', 'vim-bufsurf', 'GoldenView', 'minibufexpl', 'vim-bufferline', 'OmniSharp', 'vim-session', 'syntastic', 'mru', 'vim-autoformat', 'vim-dispatch', 'unite.vim', 'restore_view.vim', 'neocomplcache.vim', 'supertab', 'transparency-windows-vim', 'matchit', 'vim-autoclose', 'vim-csharp']
		execute pathogen#infect()
""}}}

""{{{ -- Mappings

	"Jump list
	"forward
	nnoremap <S-o> <C-I>

	"Rename"
	"local
	nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

	"global
	nnoremap gR gD:%s/<C-R>///gc<left><left><left>

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
		" Quick insert/normal modes toggle (Caps is mapped to F2 via ahk)
		nnoremap <F2> i
		inoremap <silent><F2> <esc>:call GoRightIfNotBOL()<cr>
		"inoremap <expr><Esc> "<esc>".(IsBOL()?'':'l')

	"Mouse"
		" Middle mouse pasting
		nnoremap <MiddleMouse> <Nop>
		inoremap <MiddleMouse> <Nop>

		" Make mouse clicks leave jump marks
		nnoremap <LeftMouse> m'<LeftMouse>
		inoremap <LeftMouse> <c-o>m'<LeftMouse>

	"Movement"
		noremap k gj
		noremap i gk
		noremap j h

		inoremap <C-l> <esc>ea
		inoremap <C-j> <esc>bi
		" Jump to matching braket
		nnoremap <A-m> %
		vnoremap <A-m> %
		inoremap <A-m> <esc>%i
		" Jump to last cursor position
		nnoremap <A--> ``
		" Quick jump
		nmap <Space> G
		vmap <Space> G
		" Quick navigation, home, end, etc.
		"inoremap <A-j> <Esc>^i
		"inoremap <A-k> <Esc>o
		"inoremap <A-l> <Esc>$a
		"inoremap <A-i> <Esc>O
		"nnoremap <A-j> ^i
		"nnoremap <A-k> o
		"nnoremap <A-i> O
		"nnoremap <A-l> $a
        imap<A-j> <nop>
        imap<A-i> <nop>
        imap<A-l> <nop>
        imap<A-k> <nop>
		nnoremap h ^i
		nnoremap m o
		nnoremap ' $a
		nnoremap o O
		vnoremap h ^
		vnoremap ' $
		" Jump to next { or  }
		vnoremap <silent> <A-,> ?{\n<CR>
		vnoremap <silent> <A-.> /{\n<CR>
		nnoremap <silent> <A-,> ?{\n<CR>
		nnoremap <silent> <A-.> /{\n<CR>

        " Next/previous 'f' finds
        nnoremap <leader>a ,

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
		nnoremap <A-2> @a
		" Change inside
		nnoremap I ci
		nnoremap A ca
		" Duplicate current line
		nnoremap <C-d> yyp
		vnoremap <C-d> yP

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
		nnoremap <A-Space> za
		vnoremap <A-Space> za
		nnoremap <A-f> za
		vnoremap <A-f> za
		" Fold everything
		nnoremap <A-o> zM
		" Unfold everything
		nnoremap <A-u> zR

	" Browsing in insert mode
		inoremap <C-k> <esc><C-j>
""}}}

""{{{ -- Functions --
	function! ToggleMenuBar()
		let &g:guioptions = ToggleStringValue(&g:guioptions, "m")
	endfu

	function! IsLineEmpty(line)
		return match(a:line, '^\s*$') == -1 ? 0 : 1
	endfu

	function! IsCurrentLineEmpty()
		return IsLineEmpty(getline('.'))
	endfu

	function! ChangeCurrentLine()
		execute "normal! " . (IsCurrentLineEmpty() ? "0" : "^") . "C"
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
