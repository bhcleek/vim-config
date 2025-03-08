let g:go_fmt_command = 'gopls'
let g:go_imports_mode = 'gopls'
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_metalinter_command = 'gopls'
let g:go_metalinter_autosave_enabled=['golint', 'govet', 'typecheck']
let g:go_echo_command_info = 0
let g:go_imports_autosave = 1
let g:go_test_show_name = 1

let g:go_auto_sameids = 0 " disabled until https://github.com/vim/vim/issues/5533 is resolved.
let g:go_auto_type_info = 1

let g:go_highlight_fields = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1

let g:go_fmt_options = {'goimports': '-local do'}

let g:go_gopls_use_placeholders = 1
let g:go_gopls_staticcheck = 1
let g:go_diagnostics_level = 2
let g:go_gopls_matcher = 'fuzzy'
let g:go_gopls_local = "do"

let g:go_doc_balloon = 1

let g:go_gopls_options = ['-remote=auto']

" vim: ts=2 sw=2 et
