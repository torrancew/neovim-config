require("config.lazy")
require("config.options")

vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.cmd.colorscheme 'nightfox'
vim.keymap.set('n', '<localleader>ff', ':Telescope find_files<CR>', {silent=true})

vim.notify = require('notify')

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
let g:rustfmt_autosave = 1
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

set nu
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Meta
nmap <localleader>ht :Hardtime toggle<CR>
nmap <localleader>G  :Neogit<CR>
nmap <localleader>L  :Lazy<CR>
nmap <localleader>M  :Mason<CR>
nmap <localleader>T  :Neotest output<CR>

" Terminal mode
tnoremap <Esc> <C-\><C-n>

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-n>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-n>'
smap <expr> <C-n>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-n>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Terraform
nmap <leader>tfi :!terraform init<CR>
nmap <leader>tfp :!terraform plan<CR>

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
"nmap        s   <Plug>(vsnip-select-text)
"xmap        s   <Plug>(vsnip-select-text)
"nmap        S   <Plug>(vsnip-cut-text)
"xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
]])

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true }

        keymap.set("n", "gr", lsp.buf.references, bufopts)
        keymap.set("n", "gd", lsp.buf.definition, bufopts)
        keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)
        keymap.set("n", "<space>ca", lsp.buf.code_action, bufopts)
        keymap.set("n", "K", lsp.buf.hover, bufopts)
        keymap.set("n", "<space>f", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, bufopts)
    end
})

require("neotest").setup({
  adapters = {
    require('rustaceanvim.neotest'),
  },
})
