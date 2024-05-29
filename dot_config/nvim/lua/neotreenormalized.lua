-- lua/neotreenormalized.lua
M = {}

function M.resize()
  -- Get our current buffer number
  local tn = vim.api.nvim_get_current_tabpage()
  local tree_win_handle = nil
  for _, window_handle in ipairs(vim.api.nvim_tabpage_list_wins(tn)) do
    local buffer_handle = vim.api.nvim_win_get_buf(window_handle)
    local buf_name = vim.fn.bufname(buffer_handle)
    if buf_name == "neo-tree filesystem [1]" then
      tree_win_handle = window_handle
      break
    end
  end
  if tree_win_handle == nil then
    -- Did not find window for neo-tree, could not reset size.
    return
  end
  local configured_width = require("neo-tree").config.filesystem.window.width or 40
  if vim.api.nvim_win_get_width(tree_win_handle) > configured_width then
    -- Reset neo-tree window size to proper value.
    vim.api.nvim_win_set_width(tree_win_handle, configured_width)
    return
  end
  -- Did not find window in tabpage, could not reset size.
end

return M
