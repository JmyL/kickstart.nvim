return {
  {
    'HakonHarnes/img-clip.nvim',
    ft = { 'markdown', 'codecompanion', 'quarto' },
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = '[Image]($FILE_PATH)',
          use_absolute_path = true,
        },
        markdown = {
          dir_path = 'assets/images',
          use_absolute_path = false,
          relative_to_current_file = false,
          template = '![]($FILE_PATH)',
        },
        quarto = {
          dir_path = 'assets/images',
          use_absolute_path = false,
          relative_to_current_file = false,
          template = '![]($FILE_PATH)',
        },
      },
    },
    init = function()
      vim.keymap.set({ 'n', 'i' }, '<M-i>', '<cmd>PasteImage<cr>', { desc = 'insert [i]mage from clipboard' })
    end,
  },
}
