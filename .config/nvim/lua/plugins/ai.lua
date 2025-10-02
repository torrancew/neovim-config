return {
  {
    'torrancew/avante.nvim',
    branch = 'fix/vertex-project-from-env',
    build = 'make',
    event = 'VeryLazy',
    keys = { },
    version = false,
    -- @module 'avante'
    -- @type avante.Config
    opts = {
      instructions_files = "CONTEXT.md",
      behavior = { enable_fastapply = true },
      selector = { exclude_auto_select = { 'NvimTree' } },
      provider = 'claude',
      providers = {
        claude = {},
        gemini = { model = 'gemini-2.5-pro' },
        openai = {},
        vertex = { model = 'gemini-2.5-pro' },
        vertexai = {
          __inherited_from = 'vertex',
          endpoint = 'https://openrouter.ai/api/v1',
          api_key_name = 'OPENROUTER_API_KEY',
          model = 'deepseek/deepseek-r1',
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
  },
  {
    'ravitemer/mcphub.nvim',
    -- build = 'npm install -g mcp-hub@latest',  -- Installs `mcp-hub` node binary globally
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('mcphub').setup()
    end
  },
}
