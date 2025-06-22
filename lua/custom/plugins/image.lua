return {
  {
    '3rd/image.nvim',
    ft = { 'quarto', 'markdown', 'vimwiki' },
    opts = {
      backend = 'kitty', -- whatever backend you would like to use
      processor = 'magick_rock', -- or "magick_cli"
      -- max_width = 100,
      -- max_height = 12,
      -- max_height_window_percentage = math.huge,
      -- max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
      -- window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          floating_windows = false, -- if true, images will be rendered in floating markdown windows
          filetypes = { 'markdown', 'vimwiki', 'quarto' },
        },
      },
    },
    -- config = function()
    -- end,
  },
}
