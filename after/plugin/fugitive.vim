if exists('g:loaded_fugitive')
	call NormalStatusline()
	let &statusline='%{fugitive#statusline()} ' . &statusline

	" delete fugitive buffers when they're hidden
	autocmd BufReadPost fugitive://* set bufhidden=delete
endif
