let g:asyncomplete_auto_popup = 1
let g:lsp_highlight_references_enabled = 1
let g:lsp_diagnostics_float_cursor = 1
" no annoying diagnostics all over my buffer
let g:lsp_virtual_text_enabled = 0
let g:lsp_ignorecase = 1
let g:lsp_semantic_enabled = 1

" close the popup when done with the completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"

" refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" lsp actions
nnoremap <silent> K :LspHover<Cr>
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> <F2> :LspRename<CR>


"""""
" Completion sources
"""""

" buffer completion
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

" filenames and directories completion
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

if executable('ccls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ccls',
        \ 'cmd': {server_info->['ccls']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact'],
      \ })
endif

if executable('elm-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'elm support using elm-language-server',
        \ 'cmd': { server_info->['elm-language-server']},
        \ 'whitelist': ['elm'],
        \ })
endif

if executable('terraform-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform support using terraform-lsp',
        \ 'cmd': { server_info->['terraform-lsp']},
        \ 'whitelist': ['tf'],
        \ })
endif

