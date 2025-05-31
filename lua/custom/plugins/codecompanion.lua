return {
  {
    'olimorris/codecompanion.nvim',
    cmd = { 'CodeCompanionChat' },
    keys = {
      { '<leader>wc', ':CodeCompanionChat Toggle<CR>', desc = 'Toggle [W]indow - CodeCompanion [C]hat' },
      { '<leader>wC', ':CodeCompanionChat<CR>', desc = 'Open [W]indow - CodeCompanion [C]hat' },
    },
    opts = {
      extensions = {
        -- mcphub = {
        --   callback = 'mcphub.extensions.codecompanion',
        --   opts = {
        --     make_vars = true,
        --     make_slash_commands = true,
        --     show_result_in_chat = true,
        --   },
        -- },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- 'ravitemer/mcphub.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
      'j-hui/fidget.nvim',
    },
    init = function()
      require('config.fidget-spinner'):init()
    end,
  },
}
