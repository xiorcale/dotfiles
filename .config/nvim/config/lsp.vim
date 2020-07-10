"""""""""""""""""""""""""""""
" Language Server Protocol  "
"""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

let g:echodoc_enable_at_startup = 1
let g:echodoc#type = "floating"
highlight link EchoDocFloat Pmenu

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['ccls'],
    \ 'elm': ['elm-language-server'],
    \ 'go': ['gopls'],
    \ 'javascript': [
        \ '/run/current-system/sw/bin/typescript-language-server',
        \ '--stdio',
        \ '--tsserver-path',
        \ '/run/current-system/sw/bin/tsserver'
        \ ],
    \ 'python': ['pyls'],
    \ 'rust': ['rls'],
    \ 'tf': ['terraform-lsp'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'elm': ['elm.json'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

