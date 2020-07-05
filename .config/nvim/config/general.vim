""""""""""""""""""""""""""""
" Global configuration      "
"""""""""""""""""""""""""""""

set autoindent
set cmdheight=2
set cot+=preview
set encoding=utf-8
set expandtab
set foldlevel=99
set foldmethod=indent
set hidden
set mouse=a
set number
set nobackup
set nowritebackup
set path+=**
set shell=/bin/sh
set shiftwidth=4
set shortmess+=c
set showmatch
set softtabstop=4
set spell spelllang=en_us
set splitbelow
set splitright
set tabstop=4
set termguicolors
set textwidth=79
set updatetime=300
set wildmenu

syntax enable

filetype plugin on

" Close preveiw after completion.
autocmd CompleteDone * silent! pclose

" use ripgrep with Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


