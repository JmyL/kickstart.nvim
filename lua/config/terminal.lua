local paths = {}
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then
    local name = vim.api.nvim_buf_get_name(buf)
    if name:find '^term://' then
      print 'terminal'
    end
    if name ~= '' then
      table.insert(paths, name)
    end
  end
end
