behave mswin
source $VIMRUNTIME/mswin.vim
let $PATH .= ';C:\Windows\SysWOW64'

""{{{ -- AutoCommands --

augroup FormatOptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=cro
augroup END

" Auto set working directory
augroup UpdateCWD
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END
""}}}

""{{{ -- Misc Settings --

    " split chars
    set fillchars=stl:\ 
    set fillchars+=vert:\|

    "" switch cases indentation
    set cinoptions==0

    "" global search/replace by default
    set gdefault
    
    "" cursor shape
    set guicursor+=i:ver11
    set guicursor+=v:ver11
    set guicursor+=n:block

    "" disable blinking
    set guicursor=a:blinkon0

    "" fixes some scrolling/rendering issues
    syntax sync minlines=256
    set ttyscroll=0 
    set nocursorline
    set nocursorcolumn

    set norelativenumber
    set expandtab
    set nocompatible
    set shellslash
    set backspace=2
    color black
    syntax on
    set nowrap
    set autoindent
    set smartindent
    set tabstop=4
    set shiftwidth=4
    set textwidth=65
    set laststatus=1 "setting this to 0 will cause an extra empty line when doing horizontal splits!
    set statusline=\ 
    filetype plugin indent on
    set noswapfile
    set nobackup
    set hlsearch					" highlights all the found instances in a search
    set ignorecase					" Ignore case when searching
    set smartcase					" Ignore case if search is all lowercase, case-sensitive otherwise.
    set incsearch					" Show search matches as you type.
    scriptencoding utf-8			" UTF-8 encoding
    set autoread                    " auto read files after they're modified without displaying a prompt
    set mouse=a

    " hides --INSERT--
    set noshowmode

"""}}}

""{{{ -- Plugins --

    " Ensure the buffer for building code opens in a new view
    set switchbuf=useopen,split

    " error message formats
    " Microsoft MSBuild
    set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
    " Microsoft compiler: cl.exe
    set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
    " Microsoft HLSL compiler: fxc.exe
    set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m

    function! DoBuild()
        set makeprg=build.bat
        AsyncMake
    endfunction

    function! ToggleQuickFix()
        if exists("g:qwindow")
            cclose
            unlet g:qwindow
        else
            try
                "open quickfix window
                vert copen
                "give it a decent size
                vert resize 50
                let g:qwindow = 1
            catch 
                echo "No Errors found!"
            endtry
        endif
    endfunction

    
    " toggle quickfix window
    nnoremap <A-3> :copen<CR>
    
    " navigate errors
    nnoremap <A-.> :cn<CR>
    nnoremap <A-,> :cp<CR>

    " do build
    nnoremap <silent> <F5>    :w<CR>:call DoBuild()<CR>
    nnoremap <silent> <A-S-r> :w<CR>:call DoBuild()<CR>

    " Fullscreen
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

	"Tabularize
	nnoremap <leader>t= :Tabularize /=<cr>
	nnoremap <leader>t{ :Tabularize /{<cr>
	nnoremap <leader>t: :Tabularize /:<cr>
	vnoremap <leader>t= :Tabularize /=<cr>
	vnoremap <leader>t{ :Tabularize /{<cr>
	vnoremap <leader>t: :Tabularize /:<cr>

    "CtrlP"
        "let g:ctrlp_buffer_func = {
                    "\ 'enter': 'HideStatusLine',
                    "\ 'exit':  'ShowStatusLine',
                    "\ }

        "func! HideStatusLine()
            "set laststatus=0
        "endfunc

        "func! ShowStatusLine()
            "set laststatus=1
        "endfunc

        let g:ctrlp_root_markers = ['Source', 'src']

        set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.meta,*.mat,*.suo,*.csproj,*.sln,*.dwlt,
                        \*.asset,*.unity,*.db,*.xml,*.cache,*.prefab,*.fbx,*.max,*.lxo,*.blend,
                        \*.obj,*.3DS,*.smd,*.mp3,*.ogg,*.wav,*.png,*.jpg,*.prefs,*.anim,*.unityproj,
                        \*.config,*.log,*.rsp,
                        \*UnityTempFile*,*.pdb,*.dll,*.ilk,*.lnk,*.ini

        nnoremap <C-r><C-u> :CtrlPMRU<CR>
        nnoremap <A-r><A-u> :CtrlPMRU<CR>

		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll|meta)$'
		  \ }

	"Smooth scroll"
		noremap <silent> <c-f> m':call smooth_scroll#down(&scroll * 1, 1, 2)<CR>
		noremap <silent> <c-a> m':call smooth_scroll#up(&scroll * 1, 1, 2)<CR>

	"Pathogen"
		let g:pathogen_disabled = []
		execute pathogen#infect()
""}}}

""{{{ -- Mappings

    "quick edit
    nnoremap E :edit 
    
    "collapse blocks of empty lines into a single one
    nnoremap <silent> <leader>re ma:%s/^\_s\+\n/\r<CR>'azz
    
    "unicode insertion
    inoremap <C-k> <C-v>
    cnoremap <C-k> <C-v>

    "member search (works only when lines start with member names)
    nnoremap <A-/> /^

    "indent block
    nnoremap + =}
    nnoremap =i =i{

    "find variable/function declaration (works when their name is the start of the line)
    nnoremap <A-d> yiw/^\<<C-R>"\><CR>zz
    "find struct/class/enum
    nnoremap <A-f><A-s> yiw/^\<struct <C-R>"\><CR>zz
    nnoremap <A-f><A-c> yiw/^\<class <C-R>"\><CR>zz
    nnoremap <A-f><A-e> yiw/^\<enum <C-R>"\><CR>zz

    "simple for loop template
    "inoremap ,for <C-O>m'for(; ;)<CR>{<CR>}<C-O>''<Esc>m'=i{''f(a

    "double toggle fullscreen
    nmap <leader>ff <F11><F11>

    "jump to end of file
    nnoremap <Space> G
    vnoremap <Space> G

    "serach for visually selected text
    vnoremap * y/<C-R>"<CR>
    vnoremap # y?<C-R>"<CR>

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
        vnoremap <F2> <Esc>
        cnoremap <F2> <Esc>

    "Misc Nops
		nnoremap <A-f> <Nop>
		" mouse nops
		map <MiddleMouse> <Nop>

	"Movement"   
		noremap k gj
		noremap i gk
		noremap j h
        " Next/prev word (insert mode)
		inoremap <C-l> <esc>ea
		inoremap <C-j> <esc>bi
        nnoremap <A-h> ^
        nnoremap <A-'> $

        "nnoremap / :set hlsearch<CR>:nohlsearch<CR>/
        "nnoremap ? :set hlsearch<CR>:nohlsearch<CR>?

        "nnoremap <silent> I :set nohlsearch<CR>?^\s*$<CR>:nohlsearch<CR>
        "nnoremap <silent> K :set nohlsearch<CR>/^\s*$<CR>:nohlsearch<CR>
        "vnoremap <silent> I ?^\s*$<CR>
        "vnoremap <silent> K /^\s*$<CR>
        
        nnoremap J b
        nnoremap L w
        vnoremap J b
        vnoremap L w

        nnoremap I {
        nnoremap K }
        vnoremap I {
        vnoremap K }

        "next/prev method/function'
        nnoremap <silent>} /^{<CR>:nohlsearch<CR>
        nnoremap <silent>{ ?^{<CR>:nohlsearch<CR>

        "beginning/end of line
        "nnoremap m ox<BS>
        "nnoremap o Ox<BS>
        nnoremap m o
        nnoremap o O
        nnoremap h ^i
        nnoremap ' $a
        vnoremap h ^
        vnoremap ' $

        "jump to top/middle/bottom of the screen
        nnoremap <S-h> M
        nnoremap <S-t> H
        nnoremap <S-b> L
        vnoremap <S-h> M
        vnoremap <S-t> H
        vnoremap <S-b> L

        " jump to match
        nnoremap <S-m> %
        vnoremap <S-m> %

		"Scroll screen 'without' moving cursor
        "one char
		nnoremap <C-i> <C-y>
		nnoremap <C-k> <C-e>
		nnoremap <C-j> zh
		nnoremap <C-l> zl
		vnoremap <C-i> <C-y>
		vnoremap <C-k> <C-e>
		vnoremap <C-j> zh
		vnoremap <C-l> zl

        "screen
        nnoremap <C-h> zz
        nnoremap <C-t> zt
        nnoremap <C-b> zb
        vnoremap <C-h> zz
        vnoremap <C-t> zt
        vnoremap <C-b> zb

	"Clipboard"
		" Undoing
		nnoremap <C-z> u
		inoremap <C-z> <C-[>ui
        
		nnoremap <A-v> <C-v>

	"Other"
        " yank current word
        nnoremap y<space> yiw

		" For recording purposes, fast repeating.
		nnoremap <A-2> @a

		" Change inside
        nnoremap <A-i> ci
        nnoremap <A-i><A-9> ci(
        nnoremap <A-i><A-'> ci"
        nnoremap <A-i><A-,> ci<
        nnoremap <A-i><A-[> ci[

        " Join
        nnoremap <A-j> J
        vnoremap <A-j> J

        " Visual->insert
        vnoremap <A-i> I
        vnoremap <A-a> A

		" Jumps cursor inside braces http://stackoverflow.com/questions/9621173/vim-and-indentation-with-brackets-braces
		inoremap <S-CR> <Esc>A<CR>{<CR>}<C-o>O

	"Visual/Select"
		" Visually select the current word
		nnoremap v<space> viw

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

	"Buffers"
        " previous buffer
        nnoremap <silent> B :buf! #<CR>

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
        " close
        nnoremap <silent> Q :q!<CR>
        "close all windows except current
        nnoremap <silent> O :only!<CR>
		" Switching windows
        nnoremap W <C-w><C-w>
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
    
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
""}}}
