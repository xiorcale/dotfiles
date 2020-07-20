""""""""""""""""""""""""""""""
" Package manager           "
"""""""""""""""""""""""""""""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif


"""""""""""""""""""""""""""""
" Packages list             "
"""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" IDE like packages
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

" languages support
Plug 'andys8/vim-elm-syntax'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lnl7/vim-nix'

" syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-python/python-syntax'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ui
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

"
" Should be loaded as the very last one
Plug 'ryanoasis/vim-devicons'

call plug#end()

