" Load defaults for text files
if !exists("b:textfile")
  runtime after/ftplugin/textfile.vim
endif
" insert mode shortcuts
inoremap <C-e> \emph{}<left>
inoremap <C-b> \textbf{}<left>
" Add $ to autopairs
"let b:autopairs_enabled = 0
let b:AutoPairs = {'(':')', '[':']', '{':'}','|':'|'}

syntax on
set conceallevel=0
" set concealcursor=nv
" highlight! link Conceal texMathArg
highlight SpellBad gui=undercurl guifg=#FF3333 guisp=Red
" highlight SpellBad gui=undercurl guisp=Red

set norelativenumber

lua vim.b.miniindentscope_disable=true

" make completion only after 3-letter words
lua require('cmp').setup.buffer({completion = {keyword_length = 3}})
call vimtex#init()
highlight link texTodo TodoBgTODO

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = false,
    },
  },
}
EOF
