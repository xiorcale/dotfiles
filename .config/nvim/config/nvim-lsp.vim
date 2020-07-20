" completion framework
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect
let g:completion_enable_fuzzy_match = 1

let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'mode': 'file'},
    \{'mode': 'keyn'}
\]

" keybindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader><leader> <cmd>lua vim.lsp.util.show_line_diagnostics()<cr>

nnoremap <c-j> :NextDiagnosticCycle<CR>
nnoremap <c-k> :PrevDiagnosticCycle<CR>


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()


" diagnostics
call sign_define("LspDiagnosticsErrorSign", {"text": "", "texthl": "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text": "", "texthl": "LspDiagnosticsWarning"})

" no virtual buffer which pop up everywhere
"lua << EOF
"function vim.lsp.util.buf_diagnostics_virtual_text() end
"EOF

" LSP configurations
lua << EOF

require'nvim_lsp'.ccls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.gopls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.rnix.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.pyls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.terraformls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.tsserver.setup{on_attach=require'diagnostic'.on_attach}

EOF
