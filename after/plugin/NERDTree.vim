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

	" put the cursor in the file to be edited (i.e. not the NERDTree window)
	autocmd VimEnter * if !exists("s:std_in") | NERDTree | wincmd w | if startInDir == 1 | enew | wincmd w | endif | endif

	" quit if NERDTree is the only window open
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
