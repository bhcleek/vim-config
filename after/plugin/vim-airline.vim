function! s:normal_statusline()
  if exists('g:loaded_fugitive')
    let s:statusline = &statusline
    if strlen(s:statusline) == 0
      let s:statusline = '%<%f %h%w%m%r%=%-14.(%l,%c%V%) %P' " emulate 'ruler'
    endif
    let &statusline = '%{fugitive#statusline()} ' . s:statusline
  endif
endfunction

autocmd User AirlineToggledOff call s:normal_statusline()

" vim:ts=2:sw=2:et
