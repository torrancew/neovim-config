" Bootstrap vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/site/plug')

" Solarized Colorscheme
Plug 'iCyMind/NeoSolarized'

" Improved Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language Server Protocol Support
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" Fuzzy Finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Improved Grepping
Plug 'mhinz/vim-grepper'

" Completion Framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Asynchronous Syntax Checker
Plug 'neomake/neomake'

" Language Integrations
Plug 'fatih/vim-go'
Plug 'hylang/vim-hy'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'wlangstroth/vim-racket'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'

" Wrangle Surrounding Pairs
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Alignment Tuning
Plug 'godlygeek/tabular'
Plug 'sickill/vim-pasta'

" Git Integration
Plug 'tpope/vim-fugitive'

" VCS Status in Gutter
Plug 'mhinz/vim-signify'

" ParInfer for LISPs & Schemes
Plug 'eraserhd/parinfer-rust', { 'do': 'cargo build --release' }

" Note Pad
Plug 'fmoralesc/vim-pad', { 'branch': 'devel' }

" TMux Integration
Plug 'edkolev/tmuxline.vim'

" PanDoc Integration
Plug 'vim-pandoc/vim-pandoc'

" vim-devicons extends other plugins, and should load last
Plug 'ryanoasis/vim-devicons'

call plug#end()
