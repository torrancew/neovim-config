return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local caps = require('cmp_nvim_lsp').default_capabilities()

      for _, lsp in ipairs({
        "asm_lsp", "clangd", "gopls", "pylsp", "pyright", 
        "openscad_lsp", "tinymist", "vale_ls"
      }) do
        require('lspconfig')[lsp].setup {
          capabilities = caps,
        }
      end
    end,
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      {
        'simrat39/rust-tools.nvim',
        opts = {
          server = {
            on_attach = function(_, bufnr)
              vim.keymap.set("n", "<C-space>", rt.hover_action.hover_actions, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
          },
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          automatic_installation = true,
        },
        dependencies = {
          'williamboman/mason.nvim',
          opts = {
            ui = {
              icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
            },
          },
        },
      },
    },
  },
}
