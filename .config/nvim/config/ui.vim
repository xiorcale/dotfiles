"""""""""""""""""""""""""""""
" UI                        "
"""""""""""""""""""""""""""""

colorscheme gruvbox

set guifont=FiraCode\ Nerd\ Font\ Mono\ 12

" always show signcolumns
set signcolumn=yes

" highlight current line
set cursorline

set rnu

" Status line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='gruvbox'

let g:airline_powerline_fonts=1

" fzf inside a popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Characters after the 80th column are displayed as errors
" match ErrorMsg '\%>80v.\+'

" better highlight for python
let g:python_highlight_all = 1

