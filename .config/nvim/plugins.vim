" Bootstrap vim-plug
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/site/plug')

" Selenized Colorscheme
Plug 'jan-warchol/selenized', {'rtp': 'editors/vim'}

" Improved Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language Server Protocol Support
Plug 'neovim/nvim-lspconfig'

" Debugger Integration
Plug 'mfussenegger/nvim-dap'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy Finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Improved Grepping
Plug 'mhinz/vim-grepper'

" Completion Framework
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" QuickFix/LocationList Improvements
Plug 'romainl/vim-qf'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Asynchronous Linter
Plug 'dense-analysis/ale'

" Clojure/JVM Integrations
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'

" Rust Integrations
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

" Language Integrations
Plug 'fatih/vim-go'
Plug 'hylang/vim-hy'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'wlangstroth/vim-racket'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/scribble.vim'
Plug 'hashivim/vim-terraform'
Plug 'vala-lang/vala.vim'

Plug 'lotabout/skim.vim'

" Wrangle Surrounding Pairs
Plug 'windwp/nvim-autopairs'
Plug 'luochen1990/rainbow'
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

" OpenSCAD Integration
Plug 'salkin-mada/openscad.nvim'

" PanDoc Integration
Plug 'vim-pandoc/vim-pandoc'

" vim-devicons extends other plugins, and should load last
Plug 'ryanoasis/vim-devicons'

" Personal Wiki
Plug 'vimwiki/vimwiki'

" eww config
Plug 'elkowar/yuck.vim'

call plug#end()
