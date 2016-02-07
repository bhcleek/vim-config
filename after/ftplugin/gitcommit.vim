setlocal autoindent

"setlocal comments=fb:-,fb:*,fb:+,n:>
setlocal comments=:#
setlocal formatoptions+=n " recognize numbered lists to indent at the level of the text after the number
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*\\\|^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+ " the default formatlistpat and markdown lists, too.
