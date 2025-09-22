return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local caps = require('cmp_nvim_lsp').default_capabilities()

      for _, lsp in ipairs({
        "asm_lsp", "clangd", "gopls",
        "openscad_lsp", "tinymist", "vale_ls"
      }) do
        vim.lsp.config(lsp, {
          capabilities = caps,
        })
      end

      -- Use Ruff for linting, formatting and import sorting
      -- and Pyright for other LSP features
      vim.lsp.enable('ruff')
      vim.lsp.config('pyright', {
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = { ignore = { '*' } },
          }
        },
      })
    end,
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      { 'mrcjkb/rustaceanvim' },
      {
        'saecki/crates.nvim',
        opts = {
          lsp = {
            enabled = true,
            actions = true,
            completion = true,
            hover = true,
          },
        },
      },
      {
        "mrxiaozhuox/dioxus.nvim",
        opts = {
          format = {
            split_line_attributes = true,
          },
        },
        ft = "rust",
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
              icons = {
                package_installed   = "✓",
                package_pending     = "➜",
                package_uninstalled = "✗",
              },
            },
          },
        },
      },
    },
  },
}
