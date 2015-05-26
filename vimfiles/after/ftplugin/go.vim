"if !exists("env_path")
"    let g:env_path = $GOPATH
"endif

"let $GOPATH = system("echo -n $(sed -n -e 's/^.\\{1,\\}/&:/p' <(godep path 2>/dev/null || echo -n ''))") . g:env_path

"let g:go_bin_path = g:env_path

let g:go_fmt_command = "goimports"

let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim:ts=4:sw=4:et
