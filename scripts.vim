if did_filetype()
  finish
endif

if getline(1) =~ '$ANSIBLE_VAULT;'
  setfiletype ansiblevault
endif

" vim: sw=2 ts=2 et
