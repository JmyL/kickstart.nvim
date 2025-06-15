return {
  {
    'mbbill/undotree',
    event = 'BufEnter',
    config = function()
      -- require("core.utils").load_mappings "undotree"
      vim.keymap.set('n', '<leader>wu', vim.cmd.UndotreeToggle)
    end,
  },
}
