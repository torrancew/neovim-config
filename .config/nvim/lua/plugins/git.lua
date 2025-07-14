return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  {
    'harrisoncramer/gitlab.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'stevearc/dressing.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    build = function() return('gitlab.server').build(true) end,
    config = function()
      require('gitlab').setup({
        popup = {
          temp_registers = {'"', "+", "g"},
        },
      })

      vim.api.nvim_create_user_command(
        'GitlabApprove',
        function(opts)
          require('gitlab').approve()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabComment',
        function(opts)
          require('gitlab').create_comment()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabDiscussions',
        function(opts)
          require('gitlab').toggle_discussions()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabDoMerge',
        function(opts)
          require('gitlab').merge()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabMergeRequest',
        function(opts)
          require('gitlab').create_mr()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabNote',
        function(opts)
          require('gitlab').create_note()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabPipeline',
        function(opts)
          require('gitlab').pipeline()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabReview',
        function(opts)
          require('gitlab').review()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabSuggestion',
        function(opts)
          require('gitlab').create_comment_suggestion()
        end,
        { nargs = 0 }
      )
      vim.api.nvim_create_user_command(
        'GitlabSummary',
        function(opts)
          require('gitlab').summary()
        end,
        { nargs = 0 }
      )
    end,
  },
  {
    'swaits/lazyjj.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      mapping = '<leader>jj'
    }
  }
}
