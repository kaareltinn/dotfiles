M = require('../config/mappings')

M.map('n', '<leader>dvo', ':DiffviewOpen<CR>')
M.map('n', '<leader>dvh', ':DiffviewOpen origin/HEAD...HEAD<CR>')

local is_git_ignored = function(filepath)
  vim.fn.system('git check-ignore -q ' .. vim.fn.shellescape(filepath))
  return vim.v.shell_error == 0
end

local update_left_pane = function()
  pcall(function()
    local lib = require 'diffview.lib'
    local view = lib.get_current_view()
    if view then
      -- This updates the left panel with all the files, but doesn't update the buffers
      view:update_files()
    end
  end)
end

-- Register handler for file changes in watched directory
require('custom.directory-watcher').registerOnChangeHandler('diffview', function(filepath, events)
  local is_in_dot_git_dir = filepath:match '/%.git/' or filepath:match '^%.git/'

  if is_in_dot_git_dir or not is_git_ignored(filepath) then
    update_left_pane()
  end
end)

vim.api.nvim_create_autocmd('FocusGained', {
  callback = update_left_pane,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'DiffviewViewLeave',
  callback = function()
    vim.cmd ':DiffviewClose'
  end,
})


return {
  'sindrets/diffview.nvim',
  version = '*',
  config = function()
    local actions = require("diffview.actions")
    require('diffview').setup {
      disable_defaults = true,
      default_args = {
        DiffviewOpen = { '--imply-local' },
      },
      keymaps = {
        view = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close diffview' } },
          { "n", "<leader>ne", actions.select_next_entry, { desc = "Open the diff for the next file" } },
          { "n", "<leader>me", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        },
        file_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close diffview' } },
          { "n", "<leader>ne", actions.select_next_entry, { desc = "Open the diff for the next file" } },
          { "n", "<leader>me", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        },
        file_history_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close diffview' } },
          { "n", "<leader>ne", actions.select_next_entry, { desc = "Open the diff for the next file" } },
          { "n", "<leader>me", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        },
      },
    }
  end,
  lazy = false
}
