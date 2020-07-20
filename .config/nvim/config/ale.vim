"let g:deoplete#enable_at_startup = 1

"call deoplete#custom#option('source', {
"\   '_': ['ale'],
"\})

let g:ale_completion_enabled = 1

" Display functions signatures while writing their parameters
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = "floating"
highlight link EchoDocFloat Pmenu

let g:ale_sign_warning = ""
let g:ale_sign_error = ""
let g:ale_echo_msg_format = '[%linter%] %s'

let g:airline#extensions#ale#enabled = 1

" Ale shortcuts
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nmap <silent> K <Plug>(ale_hover)
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> fr <Plug>(ale_find_references)
nmap <silent> fx <Plug>(ale_fix)
nmap <silent> <F2> <Plug>(ale_rename)

" linter (lsp)
let g:ale_linters = {
    \ 'python': ['falke8', 'pylint', 'pyls']
    \ }

" fixers
let g:ale_fixers = {
    \ 'cpp': ['clang-format'],
    \ 'python': ['autopep8']
    \ }

