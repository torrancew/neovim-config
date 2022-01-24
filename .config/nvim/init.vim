let g:ale_disable_lsp = 1

execute 'source' stdpath('config') . '/plugins.vim'

colorscheme selenized
set termguicolors
set bg=dark

set completeopt = "menuone,noselect"
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

lua require('nvim-autopairs').setup()
execute 'source' stdpath('config') . '/telescope.lua'
execute 'source' stdpath('config') . '/lsp_client.lua'
execute 'source' stdpath('config') . '/auto_completion.lua'

let g:airline_powerline_fonts = 1

let g:hy_enable_conceal = 1
let g:hy_conceal_fancy  = 1

let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:pad#dir = '~/share/annex/notes'
let g:pad#default_format = 'pandoc'
let g:pad#window_height = 24

let g:rainbow_active = 1

let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

call ale#linter#Define('pandoc', {
\   'name': 'vale',
\   'executable': 'vale',
\   'command': 'vale --output=JSON %t',
\   'callback': 'ale#handlers#vale#Handle',
\})

au FocusGained,BufEnter,BufWinEnter term://* nmap <buffer> <C-d> <cmd>bdelete!<CR>
au BufNew,BufEnter *.rs nmap <leader>d <cmd>RustDebuggables<CR>
au BufNew,BufEnter *.rs nmap <leader>r <cmd>RustRunnables<CR>
au BufNew,BufEnter *.rs nmap <leader>t <cmd>RustTest<CR>
au BufNew,BufEnter *.rs nmap <leader>T <cmd>RustTest!<CR>
au BufNew,BufEnter *.md setlocal spell spelllang=en
