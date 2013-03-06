" open NERDTree by default
if exists("loaded_nerd_tree")
	autocmd VimEnter * NERDTree
	autocmd BufEnter * NERDTreeMirror

	" put the cursor in the file to be edited (i.e. not the NERDTree window)
	autocmd VimEnter * wincmd w
	" quit if NERDTree is the only window open
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif
