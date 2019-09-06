let g:go_fmt_command = "goimports"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_metalinter_command = 'golangci-lint'
let g:go_echo_command_info = 0

"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1

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

if has('balloon_eval_term')
  set balloonevalterm
  set balloonexpr=go#tool#DescribeBalloon()
endif

" vim:ts=2:sw=2:et
