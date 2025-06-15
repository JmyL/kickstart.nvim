return {
  {
    'olimorris/codecompanion.nvim',
    cmd = { 'CodeCompanionChat' },
    lazy = false,
    -- check https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
    opts = {
      prompt_library = require 'config.codecompanion.prompt_library',
      display = {
        window = {
          layout = 'vertical',
        },
        action_palette = {
          width = 95,
          height = 10,
          prompt = 'Prompt ', -- Prompt used for interactive LLM calls
          provider = 'telescope', -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
        chat = {
          auto_scroll = false,
        },
      },
      keymaps = {
        show_shortcuts = 'g?',
      },
      strategies = {
        chat = {
          slash_commands = {
            ['buffer'] = {
              keymaps = {
                modes = {
                  i = '<A-b>',
                  n = { '<A-b>' },
                },
              },
            },
            ['fetch'] = {
              keymaps = {
                modes = {
                  i = '<A-g>',
                  n = { '<A-g>' },
                },
              },
            },
            ['file'] = {
              keymaps = {
                modes = {
                  i = '<A-f>',
                  n = { '<A-f>' },
                },
              },
            },
            ['image'] = {
              keymaps = {
                modes = {
                  i = '<A-i>',
                  n = { '<A-i>' },
                },
              },
            },
            ['now'] = {
              keymaps = {
                modes = {
                  i = '<A-n>',
                  n = { '<A-n>' },
                },
              },
            },
            ['help'] = {
              keymaps = {
                modes = {
                  i = '<A-h>',
                  n = { '<A-h>' },
                },
              },
            },
            ['symbols'] = {
              keymaps = {
                modes = {
                  i = '<A-o>',
                  n = { '<A-o>' },
                },
              },
            },
            ['terminal'] = {
              keymaps = {
                modes = {
                  i = '<A-t>',
                  n = { '<A-t>' },
                },
              },
            },
            ['workspace'] = {
              keymaps = {
                modes = {
                  i = '<A-p>',
                  n = { '<A-p>' },
                },
              },
            },
            ['quickfix'] = {
              keymaps = {
                modes = {
                  i = '<A-q>',
                  n = { '<A-q>' },
                },
              },
            },
          },
          keymaps = {
            options = {
              modes = {
                n = 'g?',
              },
            },
            send = {
              modes = { n = '<C-s>', i = '<C-s>' },
              opts = {},
            },
            close = {
              modes = { n = '<C-c>', i = '<C-c>' },
              opts = {},
            },
            completion = {
              modes = { i = '<C-l>' },
              opts = {},
            },
          },
        },
      },
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
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      language = 'Korean',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- 'ravitemer/mcphub.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
      'j-hui/fidget.nvim',
      'ravitemer/codecompanion-history.nvim',
      {
        'ravitemer/mcphub.nvim',
        build = 'npm install -g mcp-hub@latest',
        config = function()
          require('mcphub').setup()
        end,
      },
    },
    init = function()
      require('config.codecompanion.fidget-spinner'):init()
      vim.api.nvim_create_user_command('C', 'CodeCompanion', {})
      vim.api.nvim_create_user_command('CC', 'CodeCompanionChat', {})
      vim.keymap.set('n', '<leader>ao', ':CodeCompanionChat Toggle<CR>', { desc = '[a]i - t[o]ggle chat' })
      vim.keymap.set('n', '<leader>aO', ':CodeCompanionChat<CR>', { desc = '[a]i - [O]pen new chat' })
      vim.keymap.set('n', '<leader>ah', ':CodeCompanionHistory<CR>', { desc = '[a]i - [h]istory' })
      vim.keymap.set('v', '<leader>ad', ':CodeCompanionChat Add<CR>', { desc = '[a]i - ad[d] to chat' })
      vim.keymap.set({ 'n', 'v' }, '<leader>al', ':CodeCompanionAction<CR>', { desc = '[a]i - action [l]ist' })
      vim.keymap.set({ 'n', 'v' }, '<leader>aL', function()
        vim.api.nvim_feedkeys('V', 'n', false)
        vim.schedule(function()
          vim.cmd 'CodeCompanionAction'
        end)
      end, { desc = '[a]i - action [L]ist for a file' })
      vim.keymap.set('n', '<leader>ad', function()
        vim.api.nvim_feedkeys('V', 'n', false)
        vim.schedule(function()
          vim.cmd 'CodeCompanionChat Add'
        end)
      end, { desc = '[a]i - ad[d] to chat' })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'codecompanion',
        callback = function()
          vim.keymap.set('n', '[a', '?^## CodeCompanion<CR>', { buffer = true })
          vim.keymap.set('n', ']a', '/^## CodeCompanion<CR>', { buffer = true })
        end,
      })
      -- vim.g.codecompanion_auto_tool_mode = true
    end,
  },
}
