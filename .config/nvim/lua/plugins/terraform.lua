return {
  {'hashivim/vim-terraform'},
  {
    'mvaldes14/terraform.nvim',
    ft = 'terraform',
    opts = {
      cmd = 'rg',
      program = 'terraform',
    },
    dependencies = {
      {'MunifTanjim/nui.nvim'}
    },
  }
}
