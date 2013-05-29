" open NERDTree by default
if exists("loaded_nerd_tree")
	" let g:NERDTreeChDirMode=2

	let startInDir=0
	if argc() == 1 
		if isdirectory(fnameescape(argv(0)))
			let startInDir=1
		endif
		cd `=fnamemodify(fnameescape(argv(0)), ":p:h")`
	endif

	autocmd VimEnter * NERDTree
	" autocmd BufEnter * NERDTreeMirror

	" put the cursor in the file to be edited (i.e. not the NERDTree window)
	autocmd VimEnter * wincmd w
	autocmd VimEnter * if startInDir == 1 | enew | endif

	" quit if NERDTree is the only window open
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif
