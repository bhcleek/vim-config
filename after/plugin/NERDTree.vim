" open NERDTree by default
if exists("loaded_nerd_tree")
	" let g:NERDTreeChDirMode=2

	let startInDir=0
	if argc() == 1 
		if isdirectory(argv(0))
			let startInDir=1
		endif
		cd `=fnamemodify(argv(0), ":p:h")`
	endif

	autocmd StdinReadPre * let s:std_in=1
	" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	" autocmd VimEnter * NERDTree
	" autocmd BufEnter * NERDTreeMirror
	autocmd VimEnter * if !exists("s:std_in") | NERDTree | endif

	" put the cursor in the file to be edited (i.e. not the NERDTree window)
	"autocmd VimEnter * wincmd w
	autocmd VimEnter * if !exists("s:std_in") | if startInDir == 1 | enew | endif | wincmd w | endif

	" quit if NERDTree is the only window open
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
