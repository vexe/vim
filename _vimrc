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
""}}}

""{{{ -- Misc Settings --

    " fixes scrolling/rendering issues
    set ttyscroll=0
    set nocursorline
    set nocursorcolumn

    " switch cases indentation
    set cinoptions=1

    " global search/replace by default
    set gdefault

    " cursor shape
    set guicursor+=i:ver10
    set guicursor+=v:ver10
    set guicursor+=n:hor10

    " disable blinking
    set guicursor=a:blinkon0

    " these four speed things up when syn high is enabled and browsing huge amount of text
    syntax sync minlines=256

    set norelativenumber
	set expandtab
    set nocompatible
	set shellslash
	set backspace=2
	set guifont=Courier:h15:cANSI
	"set guifont=Consolas:b:h12:cANSI "use _ for spaces
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
    "set noignorecase
    set ignorecase					" Ignore case when searching
    set smartcase					" Ignore case if search is all lowercase, case-sensitive otherwise.
	set incsearch					" Show search matches as you type.
	scriptencoding utf-8			" UTF-8 encoding
	set guioptions=                 " no gui, whatsoever
    set autoread                    " auto read files after they're modified without displaying a prompt
""}}}

""{{{ -- Plugins --

    " Fullscreen
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

	"Tabularize
	nnoremap <leader>t= :Tabularize /=<cr>
	nnoremap <leader>t{ :Tabularize /{<cr>
	nnoremap <leader>t: :Tabularize /:<cr>

	"CtrlP"
        let g:ctrlp_root_markers = ['Source']

		set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.meta,*.mat,*.suo,*.csproj,*.sln,*.dwlt,
                        \*.asset,*.unity,*.db,*.xml,*.cache,*.prefab,*.fbx,*.max,*.lxo,*.blend,
                        \*.obj,*.3DS,*.smd,*.mp3,*.ogg,*.wav,*.png,*.jpg,*.prefs,*.anim,*.unityproj,
                        \*.config,*.log,*.rsp,
                        \*UnityTempFile*

		nnoremap <C-m><c-p> :CtrlPMRU<cr>

		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll|meta)$',
		  \ 'link': 'some_bad_symbolic_links',
		  \ }

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
		let g:pathogen_disabled = []
		execute pathogen#infect()
""}}}

""{{{ -- Mappings

    "simple for loop template
    inoremap ,for <C-O>m'for(; ;)<CR>{<CR>}<CR><C-O>''<Esc>f(a

    "double toggle fullscreen
    nmap <leader>ff <F11><F11>

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
    nnoremap <A-r><A-r> :s/\<<c-r>=expand("<cword>")<cr>\>//I<left><left>
    "current function scope
    nmap <A-r><A-l> Y[mV%:s/\<<C-R>"\>//cI<left><left><left>
    "global
    nnoremap <A-r><A-g> :%s/\<<c-r>=expand("<cword>")<cr>\>//cI<left><left><left>

	nnoremap gr gd[{V%::s/<C-R>///cI<left><left><left>
	nnoremap gR gD:%s/<C-R>///cI<left><left><left>

	"Essential"
		" Leader
		let mapleader = ","
		" Quick vimrc edit
		nnoremap <leader>ev :vsplit $MYVIMRC <cr>
		" Quick vimrc reload (sourcing)
		nnoremap <leader>so :source $MYVIMRC <Bar>nohlsearch<cr>
		" Clear search
		nnoremap <silent><A-c> :nohlsearch<Return>
		inoremap <silent><A-c> <esc>:nohlsearch<Return>a
		" Quick insert/normal modes toggle (Caps is mapped to F2 via ahk)
		nnoremap <F2> i
		inoremap <silent><F2> <Esc>:call GoRightIfNotBOL()<CR>

    "Misc Nops
        nnoremap <S-k> <Nop>
		nnoremap <A-f> <Nop>
		" mouse nops
		map <MiddleMouse> <Nop>
        map <LeftMouse> <Nop>
        map <RightMouse> <Nop>
        map <LeftDrag> <Nop>
        map <RightDrag> <Nop>
        imap <LeftMouse> <Nop>
        imap <RightMouse> <Nop>
        imap <LeftDrag> <Nop>

	"Movement"
		noremap k gj
		noremap i gk
		noremap j h
        " Next/prev word (insert mode)
		inoremap <C-l> <esc>ea
		inoremap <C-j> <esc>bi
		" Jump to last cursor position
		nnoremap <A--> ``
		" Quick navigation
        nnoremap H {
        nnoremap L }
        vnoremap H {
        vnoremap L }
		nnoremap h ^i
        nnoremap m o
		nnoremap ' $a
		nnoremap o O
		vnoremap h ^
		vnoremap ' $

        " jump to match
        nnoremap <S-m> %
        vnoremap <S-m> %

		"Scroll screen 'without' moving cursor
		nnoremap <C-i> <C-y>
		nnoremap <C-k> <C-e>
		nnoremap <C-j> zh
		nnoremap <C-l> zl
		vnoremap <C-i> <C-y>
		vnoremap <C-k> <C-e>
		vnoremap <C-j> zh
		vnoremap <C-l> zl

	"Clipboard"
		" Undoing
		nnoremap <C-z> u
		inoremap <C-z> <C-[>ui
		" This is due to the fact that in VS, Ctrl-V is reserved for paste
		nnoremap <A-v> <C-v>

	"Other"
        " yank current word
        nnoremap Y yiw

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

	"Deletion"
		" Delete word under cursor
		nnoremap d<space> diw
		nnoremap c<space> ciw
		" delete word to the left of cursor.
		inoremap <C-BS> <C-W>
		" Enhanced change line
		nnoremap <silent>cc :call ChangeCurrentLine()<cr>a

	"GUI"
		" Toggle menu bar
		nnoremap <silent><leader>tm :call ToggleMenuBar()<cr>

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

	"Windows"
		" Switching windows
		nnoremap <silent> <A-i> :wincmd k<CR>
		nnoremap <silent> <A-k> :wincmd j<CR>
		nnoremap <silent> <A-j> :wincmd h<CR>
		nnoremap <silent> <A-l> :wincmd l<CR>
		nnoremap <silent> <leader>wi :wincmd k<CR>
		nnoremap <silent> <leader>wk :wincmd j<CR>
		nnoremap <silent> <leader>wj :wincmd h<CR>
		nnoremap <silent> <leader>wl :wincmd l<CR>
		" Resizing
		nnoremap <silent><A-S-l> :15winc ><CR>
		nnoremap <silent><A-S-j> :15winc <<CR>
		nnoremap <silent><A-S-i> <C-w>5+
		nnoremap <silent><A-S-k> <C-w>5-
		" Veritcal Split
		nnoremap <leader>sv <C-w>v
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
