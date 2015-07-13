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
        autocmd VimEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
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

    " switch cases indentation
    set cinoptions=1

    " global search/replace by default
    set gdefault

    " horizontal cursor
    set guicursor+=i:hor10

    " disable blinking
    set guicursor=a:blinkon0

    " these four speed things up when syn high is enabled and browsing huge number of text
    "syntax sync minlines=256
    set norelativenumber
	set expandtab
    set nocompatible
	set shellslash
	set backspace=2
	"set guifont=Consolas:b:h12:cANSI "use _ for spaces
	set guifont=DOSLike:h14:cANSI "use _ for spaces
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
    "color up
    "color twilight
    "color mustang
    "color matrix2
    "color jammy
    "color matrix
    color black
    syntax on
	set nowrap
    set smartindent
	set tabstop=4
	set shiftwidth=4
	set textwidth=100
	set laststatus=0				" status line
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

    " Fullscreen
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

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
		"let g:shell_fullscreen_always_on_top = 0

	"UltiSnips"
		" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
		let g:UltiSnipsExpandTrigger="<s-tab>"
		let g:UltiSnipsJumpForwardTrigger="<c-k>"
		let g:UltiSnipsJumpBackwardTrigger="<c-i>"

		" If you want :UltiSnipsEdit to split your window.
		let g:UltiSnipsEditSplit="vertical"

	"Smooth scroll"
		noremap <silent> <c-f> m':call smooth_scroll#down(&scroll * 1, 1, 2)<CR>
		noremap <silent> <c-b> m':call smooth_scroll#up(&scroll * 1, 1, 2)<CR>

	"Pathogen"
		let g:pathogen_disabled = ['vim-easytags', 'tagbar', 'vim-airline', 'vim-bufsurf', 'GoldenView', 'minibufexpl', 'vim-bufferline', 'OmniSharp', 'vim-session', 'syntastic', 'mru', 'vim-autoformat', 'vim-dispatch', 'unite.vim', 'restore_view.vim', 'neocomplcache.vim', 'supertab',  'matchit', 'vim-autoclose', 'vim-csharp']
		execute pathogen#infect()
""}}}

""{{{ -- Mappings

    "jump to end of file
    nnoremap <Space> G
    vnoremap <Space> G

    "serach for visually selected text
    vnoremap * y/<C-R>"<CR>
    vnoremap # y?<C-R>"<CR>

	"Jump list
	"forward
	nnoremap <S-o> <C-I>

	"Rename" (whole word)
    "current line
    nnoremap <A-r><A-r> :s/\<<c-r>=expand("<cword>")<cr>\>/
    "current function scope
	nmap <A-r><A-l> Y[mV%:s/\<<C-R>"\>//c<left><left>
    "global
    nnoremap <A-r><A-g> :%s/\<<c-r>=expand("<cword>")<cr>\>//c<left><left>

	"nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
	"nnoremap gR gD:%s/<C-R>///gc<left><left><left>

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

    "Misc Nops
        nnoremap <S-k> <nop>
        imap<A-j> <nop>
        imap<A-i> <nop>
        imap<A-l> <nop>
        imap<A-k> <nop>

	"Movement"
		noremap k gj
		noremap i gk
		noremap j h

		inoremap <C-l> <esc>ea
		inoremap <C-j> <esc>bi
		" Jump to last cursor position
		nnoremap <A--> ``
		" Quick navigation, home, end, etc.
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

        " jump to match
        nnoremap <S-m> %
        vnoremap <S-m> %

        " Next/previous 'f' finds
        nnoremap <leader>a ,

		"Scroll screen 'without' moving cursor
		nnoremap <C-i> <C-y>
		nnoremap <C-k> <C-e>
		vnoremap <C-i> <C-y>
		vnoremap <C-k> <C-e>

	"Clipboard"
		" Undoing
		nnoremap <C-z> u
		inoremap <C-z> <C-[>ui
		" This is due to the fact that in VS, Ctrl-V is reserved for paste
		noremap <A-v> <C-v>

	"Other"
        " yank current word
        nnoremap Y yiw

		" This A-f's a BITCH! I don't know what it does but it always fucks things up for me!
		nnoremap <A-f> <Nop>

		" For recording purposes, fast repeating.
		nnoremap <A-2> @a

		" Change inside
		nnoremap I ci
		nnoremap A ca

		" Duplicate current line/highlighted word
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

    function! ToggleStringValue(input, value)
    	let l:result = a:input
    	if l:result =~ a:value
    		let l:result = substitute(l:result, a:value, "", "")
    	else
    		let l:result .= a:value
    	endif
    	return l:result
    endfu

    function! GotoDefinition()
      let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
    endfunction
    nnoremap <silent><A-d> m':call GotoDefinition()<CR>

    nnoremap ]m :<c-u>call <SID>JumpMethod('{', 'W',  'n')<cr>
    nnoremap [m :<c-u>call <SID>JumpMethod('{', 'Wb', 'n')<cr>
    nnoremap ]M :<c-u>call <SID>JumpMethod('}', 'W',  'n')<cr>
    nnoremap [M :<c-u>call <SID>JumpMethod('}', 'Wb', 'n')<cr>

    function! s:JumpMethod(char, flags, mode)
        let original_cursor = getpos('.')

        if a:mode == 'v'
            normal! gv
        elseif a:mode == 'o'
            normal! v
        endif

        while search(a:char, a:flags) > 0
            if a:char == '}'
                " jump to the opening one to analyze the definition
                normal! %
            endif

            let current_line = line('.')

            if getline(current_line) =~ '^\s*{'
                " it's alone on the line, check the above one
                let method_line = current_line - 1
            else
                let method_line = current_line
            endif

            let method_line_body = getline(method_line)

            if method_line_body =~ '\k\+\s*(.*)' && method_line_body !~ '\<\(for\|foreach\|if\|while\|switch\|using\|catch\|get\|set\)\>'
                " it's probably a function call

                if a:char == '}'
                    " we need to go back to the closing bracket
                    normal! %
                endif

                echo
                return
            else
                if a:char == '}'
                    " we still need to go back to the closing bracket
                    normal! %
                endif
            endif
        endwhile

        " if we're here, the search has failed, restore cursor position
        echo
        call setpos('.', original_cursor)
    endfunction
""}}}
