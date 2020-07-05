"""""""""""""""""""""""""""""
" Key bindings              "
"""""""""""""""""""""""""""""

let mapleader =  " "

" Insert a new line above cursor in normal mode.
nnoremap <M-Enter> O<esc>j

" Move between split with ctrl-{h,j,k,l}.
nnoremap <M-h> <C-W>h
nnoremap <M-l> <C-W>l
nnoremap <M-j> <C-W>j
nnoremap <M-k> <C-W>k

" Vertical split resize.
nnoremap + 5<C-W><
nnoremap - 5<C-W>>

" Horizontal split resize.
nnoremap < 5<C-W>+
nnoremap > 5<C-W>-

" buffers navigation with Tab key
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <C-W> :bdelete<CR>

" New 'tab' buffer.
nnoremap <C-T> :enew<CR>

" go to end of line in insert mode
imap <C-l> <Esc>A

" Tab completion.
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Fuzzy find any file in cwd.
nnoremap <M-p> :Files<Enter>

" Fuzzy find a term in cwd
nnoremap <M-r> :Find<Enter>

" Fuzzy find a line in current file
nnoremap <M-s> :Lines<Enter>

" Fuzzy find a buffer
nnoremap <M-b> :Buffers<Enter>

" git
nnoremap <M-g> :G<Enter>

" Toggle directory tree.
" nnoremap <M-n> :NERDTreeToggle<CR>

" NERDcommenter
" let g:NERDSpaceDelims = 1
" let g:NerdCompactSexyComs = 1
" let g:NERDDefaultAligh = 'left'

nnoremap <M-n> :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>

let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''

