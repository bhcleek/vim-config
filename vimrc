" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

scriptencoding utf-8
set encoding=utf-8

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

if has("autocmd")
		" remove all auto commands in the default group
		augroup END
		au!
endif

if !(has("win64") || has("win32") || has("win16"))
	" prepend XDG directories to relevant paths
	if empty($XDG_CACHE_HOME)
		let $XDG_CACHE_HOME = expand('~/.cache')
	endif
	if empty($XDG_CONFIG_HOME)
		let $XDG_CONFIG_HOME = expand('~/.config')
	endif

	" directory is the list of directory names for swap files
	if !isdirectory($XDG_CACHE_HOME . '/vim/swap')
		call mkdir($XDG_CACHE_HOME . '/vim/swap', 'p', 0700)
	endif
	" use // to replace path separators in the full file path with %.
	set directory-=~/tmp
	set directory-=/var/tmp
	set directory-=/tmp
	set directory+=~/tmp//
	set directory+=/var/tmp//
	set directory+=/tmp//
	set directory^=$XDG_CACHE_HOME/vim/swap//

	if !isdirectory($XDG_CACHE_HOME . '/vim/backup')
		call mkdir($XDG_CACHE_HOME . '/vim/backup', 'p', 0700)
	endif
	set backupdir^=./.backup
	set backupdir^=$XDG_CACHE_HOME/vim/backup

	if has("autocmd")
		augroup vimrcXDG
		au!

		" Double slash does not work for backupdir (see:
		" https://github.com/vim/vim/issues/179).  Here's a workaround (%:p:h
		" expands the current file's name to its full path and then removes the last
		" component, the actual file name).
		au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')

		augroup END
	endif

	if !isdirectory($XDG_CACHE_HOME . '/vim/undo')
		call mkdir($XDG_CACHE_HOME . '/vim/undo', 'p', 0700)
	endif
	set undodir^=$XDG_CACHE_HOME/vim/undo

	set viminfo+=n$XDG_CACHE_HOME/vim/viminfo

	set runtimepath-=~/.vim
	set runtimepath^=$XDG_CONFIG_HOME/vim
	set runtimepath-=~/.vim/after
	set runtimepath+=$XDG_CONFIG_HOME/vim/after
endif

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags " generate documentation from each directory in runtimepath. Tim Pope says this is crazy. 

" Most of what vim-sensible does has been incorporated already, but
" vim-sensible sets several other options that should be considered:
" set complete-=i
" set smarttab
"
" set nrformats-=octal
"
" set ttimeout
" set ttimeoutlen=100
"
" " Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif
"
" if has('path_extra')
"   setglobal tags-=./tags tags-=./tags; tags^=./tags;
" endif
"
" " Load matchit.vim, but only if the user hasn't installed a newer version.
" if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"   runtime! macros/matchit.vim
" endif

" don't store global options in sessions.
set sessionoptions-=options

" save and restore all global variables, regardless of casing
if !empty(&viminfo)
  set viminfo^=!
endif

set autoindent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set showmatch

set tabstop=2
set shiftwidth=0 	" TODO(bc): skip this in compatible mode.
set shiftround 		" shift to the next multiple of shiftwidth column instead of shifting absolutely.

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup			" keep a backup file (restore to previous version)
	set undofile		" keep an undo file (undo changes after closing)
endif
set backupskip+=bzr_log*

set autowrite 		" automatically save before commands like :make and :next

if &history < 1000
	set history=1000
endif

set number 				" show line numbers
set laststatus=2	" always show status line
set ruler					" show the cursor position all the time
set showcmd				" display incomplete commands
set incsearch			" do incremental searching
set wildmenu 			" enhance command line completion

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j " Delete comment character when joining commented lines
endif

set display=lastline,uhex " display as much of the last line as possible, and display unprintable characters as hex.
if exists('+breakindent')
	set breakindent showbreak=>\ 
	" set cpoptions+=n " use the column used for line numbers for text of wrapped lines, too
endif
set linebreak " break lines at a character in breakat instead of at the last character that fits on the screen

" Enter the middle-dot by pressing Ctrl-k then .M
" " Enter the right-angle-quote by pressing Ctrl-k then >>
" " Enter the Pilcrow mark by pressing Ctrl-k then PI
" " Enter the ¬ by pressing Ctrl-k then NO
" " Enter the … by pressing Ctrl-V then u2026
" :set list listchars=tab:>-,eol:¶
" " The command :dig displays other digraphs you can use.
set listchars=tab:\|»,trail:·,extends:…,precedes:…,nbsp:¬,eol:¶ " highlight whitespace

set ssop=blank,curdir,folds,options,tabpages,winsize
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" if &tabpagemax < 50
"   set tabpagemax=50
" endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

set background=dark
colorscheme solarized

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
 set t_Co=16
endif

" Switch syntax highlighting on, when the terminal has colors
if has('syntax') && !exists('g:syntax_on')
	if &t_Co > 2 || has("gui_running")
		syntax enable
	endif
endif

if has("gui_running")
	set guifont=Consolas
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	autocmd BufReadPost *
		\ if line("'\"") >= 1 && line("'\"") <= line("$") |
		\		exe "normal! g`\"" |
		\ endif

	autocmd BufNewFile,BufRead *.json set ft=javascript

	augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
			\ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
	" Prevent that the langmap option applies to characters that result from a
	" mapping.	If unset (default), this may break plugins (but it's backward
	" compatible).
	set langnoremap
endif

if has("win64") || has("win32") || has("win16")
	source $VIMRUNTIME/mswin.vim
	behave mswin

	set diffexpr=MyDiff()
	function! MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let eq = ''
		if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
				let cmd = '""' . $VIMRUNTIME . '\diff"'
				let eq = '"'
			else
				let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		else
			let cmd = $VIMRUNTIME . '\diff'
		endif
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction

	cd ~\Documents
endif
" vim:set ft=vim noet:
