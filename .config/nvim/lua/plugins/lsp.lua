return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local caps = require('cmp_nvim_lsp').default_capabilities()

      for _, lsp in ipairs({
        "asm_lsp", "clangd", "gopls",
        "openscad_lsp", "tinymist", "vale_ls"
      }) do
        require('lspconfig')[lsp].setup {
          capabilities = caps,
        }
      end

      -- Use Ruff for linting, formatting and import sorting
      -- and Pyright for other LSP features
      require('lspconfig').ruff.setup {
      }
      require('lspconfig').pyright.setup {
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = { ignore = { '*' } },
          }
        },
      }
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
