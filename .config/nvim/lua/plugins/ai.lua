return {
  {
    'yetone/avante.nvim',
    build = 'make',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>a+',
        function()
          local tree_ext = require('avante.extensions.nvim_tree')
          tree_ext.add_file()
        end,
        desc = 'Select file in NvimTree',
        ft = 'NvimTree',
      },
      {
        '<leader>a-',
        function()
          local tree_ext = require('avante.extensions.nvim_tree')
          tree_ext.remove_file()
        end,
        desc = 'Deselect file in NvimTree',
        ft = 'NvimTree',
      },
    },
    version = false,
    -- @module 'avante'
    -- @type avante.Config
    opts = {
      instructions_files = "CONTEXT.md",
      behavior = { enable_fastapply = true },
      selector = { exclude_auto_select = { 'NvimTree' } },
      provider = 'gemini',
      providers = {
        gemini = {
          model = 'gemini-2.5-pro',
        }
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      -- Optional below here
      'echasnovski/mini.pick',
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'ibhagwan/fzf-lua',
      'stevearc/dressing.nvim',
      'folke/snacks.nvim',
      'nvim-tree/nvim-web-devicons',
      { -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  }
}
