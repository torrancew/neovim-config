execute 'source' stdpath('config') . '/plugins.vim'

colorscheme NeoSolarized

set expandtab hidden number laststatus=2 softtabstop=2 shiftwidth=2 tabstop=2

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

set wildignore+=*.swp,*.swo,*/.git/*,*/tmp/*,*/log/*

let mapleader=','

execute 'source' stdpath('config') . '/functions.vim'
execute 'source' stdpath('config') . '/commands.vim'
execute 'source' stdpath('config') . '/keymap.vim'

let g:airline_powerline_fonts = 1

let g:deoplete#enable_at_startup = 1

let g:hy_enable_conceal = 1
let g:hy_conceal_fancy  = 1

let g:LanguageClient_rootMarkers = {
  \ 'go': ['.git', 'go.mod'],
  \ }

let g:LanguageClient_serverCommands = {
  \ 'go': ['/usr/bin/bingo'],
  \ 'python': ['/usr/bin/pyls'],
  \ 'racket': ['/usr/bin/racket', '--lib', 'racket-language-server'],
  \ 'rust': ['/usr/bin/rustup', 'run', 'nightly', 'rls'],
  \ }

call neomake#configure#automake('rw')

let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:pad#dir = '~/share/annex/notes'
let g:pad#default_format = 'pandoc'
let g:pad#window_height = 24

let g:rainbow_active = 1

let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'
