return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      ui = {
        enable = false, -- set to false to disable all additional syntax features
      },

      workspaces = {
        {
          name = 'personal',
          path = '~/Documents/Obsidian',
        },
      },
      -- other fields ...

      templates = {
        folder = 'Templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
      },
      -- see below for full list of options 👇
    },
    init = function()
      local Snacks = require 'snacks'

      local function snack_input_and_execute(prompt_text, command_prefix)
        Snacks.input({
          prompt = prompt_text,
        }, function(input)
          if input and input ~= '' then
            vim.cmd(command_prefix .. ' ' .. vim.fn.shellescape(input))
          end
        end)
      end
      vim.keymap.set({ 'n', 'v' }, '<leader>oo', '<cmd>cd ~/Documents/Obsidian<CR> <cmd>ObsidianOpen<CR>', { desc = 'Open Obsidian' })
      vim.keymap.set({ 'n', 'v' }, '<leader>oq', '<cmd>cd -<CR>', { desc = 'Quit Obsidian' })

      vim.keymap.set({ 'n', 'v' }, '<leader>ox', '<cmd>ObsidianToggleCheckbox<CR>', { desc = 'Toggle Checkbox' })
      vim.keymap.set({ 'n', 'v' }, '<leader>oc', function()
        snack_input_and_execute('Enter title for new note:', 'ObsidianNew')
      end, { desc = 'Create New Note' })
      vim.keymap.set({ 'n', 'v' }, '<leader>oa', '<cmd>ObsidianTemplate<CR>', { desc = 'Apply Template' })
      vim.keymap.set({ 'n', 'v' }, '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Switch Note' })
      vim.keymap.set({ 'n', 'v' }, '<leader>of', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Quick Switch Note' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ol', '<cmd>ObsidianFollowLink<CR>', { desc = 'Follow Link' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Backlinks' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ot', '<cmd>ObsidianTags<CR>', { desc = 'Tags Picker' })
      vim.keymap.set({ 'n', 'v' }, '<leader>od', '<cmd>ObsidianToday<CR>', { desc = "Open Today's Note" })
      vim.keymap.set({ 'n', 'v' }, '<leader>oy', '<cmd>ObsidianYesterday<CR>', { desc = "Open Yesterday's Note" })
      vim.keymap.set({ 'n', 'v' }, '<leader>om', '<cmd>ObsidianTomorrow<CR>', { desc = "Open Tomorrow's Note" })
      vim.keymap.set({ 'n', 'v' }, '<leader>oi', function()
        snack_input_and_execute('Enter image name:', 'ObsidianPasteImg')
      end, { desc = 'Paste Image' })
      vim.keymap.set({ 'n', 'v' }, '<leader>or', function()
        snack_input_and_execute('Enter new name or --dry-run:', 'ObsidianRename')
      end, { desc = 'Rename Note' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ow', function()
        snack_input_and_execute('Enter workspace name:', 'ObsidianWorkspace')
      end, { desc = 'Switch Workspace' })
      vim.keymap.set({ 'n', 'v' }, '<leader>oe', function()
        snack_input_and_execute('Enter title for extracted note:', 'ObsidianExtractNote')
      end, { desc = 'Extract Note' })
    end,
  },
}
