return {
  {
    'anuvyklack/windows.nvim',
    lazy = false,
    keys = {
      { '<leader>wm', '<cmd>WindowsMaximize<cr>', desc = '[w]indows [m]aximize' },
    },
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    config = function()
      vim.o.winwidth = 5
      vim.o.winminwidth = 5
      vim.o.equalalways = false
      require('windows').setup {
        autowidth = {
          enable = true,
          filetype = {
            help = false,
          },
        },
        ignore = {
          buftype = { 'quickfix' },
          filetype = { 'NvimTree', 'neo-tree', 'fugitiveblame', 'gundo' },
        },
        animation = {
          enable = true,
          duration = 150,
          fps = 30,
          easing = 'in_out_sine',
        },
      }
    end,
  },
}
