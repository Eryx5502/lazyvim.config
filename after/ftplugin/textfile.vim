" Ensuring apply only once
let b:textfile = 1
" Spelling
setlocal spell
setlocal spelllang=en_gb,es_es
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" Soft wrap
setlocal wrap
setlocal linebreak
setlocal breakindent
setlocal textwidth=0
setlocal showbreak=
noremap <buffer> j gj
noremap <buffer> k gk
noremap <buffer> $ g$
noremap <buffer> _ g^
noremap <buffer> 0 g0
noremap <buffer> D dg$
noremap <buffer> C cg$
noremap <buffer> Y yg$
