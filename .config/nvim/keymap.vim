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
nmap <C-p>      :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>ff :Files<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fs :Snippets<CR>
nmap <leader>ft :Tags<CR>

" Toggle Non-Printable Characters
nmap <leader>l :set llist!<CR>

" Toggle Location List & QuickFix
nmap <leader>ll :lopen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>qf :copen<CR>
nmap <leader>qc :cclose<CR>

" Tabularize Key Mappings
vmap <leader>tt :Tabularize /
vmap <leader>t: :Tabularize /:/l0l1l0<CR>
vmap <leader>t= :Tabularize /=/<CR>
vmap <leader>t> :Tabularize /=>/<CR>

" LanguageClient Key Mappings
nnoremap          <F5> LanguageClient_contextMenu()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> K    :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd   :call LanguageClient#textDocument_definition()<CR>
