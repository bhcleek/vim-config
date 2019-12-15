let g:go_fmt_command = "goimports"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_metalinter_command = 'gopls'
let g:go_metalinter_autosave_enabled=['golint', 'govet', 'typecheck']
let g:go_echo_command_info = 0

let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

let g:go_gocode_propose_source = 0

let g:go_highlight_fields = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1

let g:go_fmt_options = {'goimports': '-local do'}

let g:go_gopls_use_placeholders = 1
let g:go_gopls_staticcheck = 1

" let g:go_debug=['lsp'] ", 'shell-commands']

" vim:ts=2:sw=2:et
