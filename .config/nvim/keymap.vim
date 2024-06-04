nnoremap <C-l> <Cmd>nohls<CR><C-l>

" Copy/Cut/Paste
nmap <leader>p "+p
nmap <leader>P "+P
nmap <leader>x "+x
nmap <leader>y "+y

" Re-Tab Buffer
nmap <C-Tab> :retab!<CR>

" Strip Trailing Whitespace
nmap <leader>$ :PreserveCursor "%s/\\s\\+$//e"<CR>

" Fuzzy Finder
nmap <C-p>      <cmd>Telescope<CR>
nmap <leader>fb <cmd>Telescope buffers<CR>
nmap <leader>ff <cmd>Telescope find_files<CR>
nmap <leader>fg <cmd>Telescope git_files<CR>
nmap <leader>fs <cmd>Snippets<CR>
nmap <leader>ft <cmd>Telescope help_tags<CR>

" Toggle Non-Printable Characters
nmap <leader>l :set llist!<CR>

" Toggle Location List & QuickFix
nmap <leader>, <Plug>(qf_qf_toggle_stay)
nmap <leader>. <Plug>(qf_loc_toggle_stay)
"nmap <leader>ll :lopen<CR>
"nmap <leader>lc :lclose<CR>
"nmap <leader>qf :copen<CR>
"nmap <leader>qc :cclose<CR>

" Tabularize Key Mappings
vmap <leader>tt :Tabularize /
vmap <leader>t: :Tabularize /:/<CR>
vmap <leader>t= :Tabularize /=/<CR>
vmap <leader>t> :Tabularize /=>/<CR>

" Terminal Mode
"nnoremap <leader>s :bot sp \| term<CR>
"tnoremap <Esc> <C-\><C-n>
nnoremap <leader>s :bot 24sp \| term <CR>
"tnoremap <expr> <Esc> &ft == 'fzf' ? '<Esc>' : '<C-\><C-n>'
tnoremap <expr> <Esc> IsFzf() ? '<Esc>' : '<C-\><C-n>'
tnoremap <C-d> <C-\><C-n>:bd!<CR>

autocmd FileType rust nnoremap <buffer> <F5> :Cargo run<CR>
