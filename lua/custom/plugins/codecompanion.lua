return {
  {
    'olimorris/codecompanion.nvim',
    cmd = { 'CodeCompanionChat' },
    keys = {
      { '<leader>ao', ':CodeCompanionChat Toggle<CR>', desc = '[a]i - [o]pen chat' },
      { '<leader>aO', ':CodeCompanionChat<CR>', desc = '[a]i - [O]pen new chat' },
      { '<leader>ah', ':CodeCompanionHistory<CR>', desc = '[a]i - [h]istory' },
    },
    opts = {
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = 'gh',
            save_chat_keymap = 'sc',
            auto_save = true,
            expiration_days = 0,
            picker = 'telescope', --- ("telescope", "snacks", "fzf-lua", or "default")
            auto_generate_title = true,
            title_generation_opts = {
              adapter = nil,
              model = nil,
              refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
              max_refreshes = 3,
            },
            continue_last_chat = true,
            ---When chat is cleared with `gx` delete the chat from history
            delete_on_clearing_chat = false,
            dir_to_save = vim.fn.stdpath 'data' .. '/codecompanion-history',
            enable_logging = false,
          },
        },
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
      'ravitemer/codecompanion-history.nvim',
    },
    init = function()
      require('config.fidget-spinner'):init()
    end,
  },
}
