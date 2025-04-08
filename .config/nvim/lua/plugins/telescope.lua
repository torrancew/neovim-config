return {
  {
    'nvim-telescope/telescope.nvim',
    opts = {
      extensions = {
        'fzf',
        'lazy',
        'lazy_plugins',
        'egrepify',
      },
    },
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'tsakirist/telescope-lazy.nvim'},
      {'polirritmico/telescope-lazy-plugins.nvim'},
      {'fdschmidt93/telescope-egrepify.nvim'},
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
  },
}
