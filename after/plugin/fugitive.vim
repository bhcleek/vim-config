if exists('g:loaded_fugitive')
	let s:status = &statusline
  if strlen(s:status) == 0
		let s:status = '%<%f %h%m%r%=%-14.(%l,%c%V%) %P' " emulate 'ruler'
	endif
	let &statusline = '%{fugitive#statusline()} ' . s:status
endif
