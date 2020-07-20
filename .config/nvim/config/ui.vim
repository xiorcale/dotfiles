"""""""""""""""""""""""""""""
" UI                        "
"""""""""""""""""""""""""""""

colorscheme gruvbox

set guifont=DroidSansMono\ Nerd\ Font\ 12

" always show signcolumns
set signcolumn=yes

" highlight current line
set cursorline

" relative line numbers
set rnu

" Status line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='gruvbox'

" fzf inside a popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Characters after the 80th column are displayed as errors
" match ErrorMsg '\%>80v.\+'

" better highlight for python
let g:python_highlight_all = 1
