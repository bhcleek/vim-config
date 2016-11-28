function s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction

function s:goStatusline()
	if !exists('*go#statusline#Show')
		return ''
	endif

	return go#statusline#Show()
endfunction

let s:gsl = '<SNR>' . s:SID() . '_goStatusline'
call airline#parts#define_function('go', s:gsl)
call airline#parts#define_condition('go', '&filetype=="go"')
let g:airline_section_gutter = airline#section#create(['go', '%='])

" vim:ts=2:sw=2:et
