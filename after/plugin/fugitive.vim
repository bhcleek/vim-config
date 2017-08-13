if exists('g:loaded_fugitive')
	" delete fugitive buffers when they're hidden
	autocmd BufReadPost fugitive://* set bufhidden=delete
endif
