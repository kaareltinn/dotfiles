M = {}

M.map = function(kind, mapping, command, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(kind, mapping, command, options)
end


-- Function to remove trailing whitespace
M.remove_trailing_whitespace = function ()
  -- Save cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  -- Execute the command to remove trailing whitespace
  vim.cmd([[%s/\s\+$//e]])

  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)

  -- Optional: Show a message
  vim.notify("Trailing whitespace removed", vim.log.levels.INFO)
end

-- Function to copy relative file path to clipboard
M.copy_relative_path = function()
  local relative_path = vim.fn.expand('%')
  if relative_path == '' then
    vim.notify("No file in buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg('+', relative_path)
  vim.notify("Copied to clipboard: " .. relative_path, vim.log.levels.INFO)
end

M.toggle_inlay_hints = function()
  local enabled = not vim.lsp.inlay_hint.is_enabled({})
  vim.lsp.inlay_hint.enable(enabled)
  vim.notify("Inlay hints: " .. (enabled and " on" or "off"))
end

-- Example of how to bind it to a key in your init.lua
-- vim.keymap.set('n', '<leader>w', remove_trailing_whitespace, { noremap = true, desc = "Remove trailing whitespace" })

local map = M.map

M.init = function() 
  -- General remappings
  map('n', 'n', 'nzzzv')
  map('n', 'N', 'Nzzzv')

  -- Tabs
  map('n', '<Tab>', 'gt')
  map('n', '<S-Tab>', 'gT')
  map('n', '<S-t>', ':tabnew<CR>')

  -- Window switching
  map('', '<C-j>', '<C-w>j')
  map('', '<C-k>', '<C-w>k')
  map('', '<C-l>', '<C-w>l')
  map('', '<C-h>', '<C-w>h')

  -- Buffer nav
  map('', '<leader>d', ':bd!<CR>')
  map('', '<leader>z', ':bp<CR>')
  map('', '<leader>x', ':bn<CR>')

  -- Buffer reloading
  map('', '<leader>rr', ':e!<CR>')

  -- Maintain visual mode after indenting
  map('v', '<', '<gv')
  map('v', '>', '>gv')

  -- Move visual block
  map('v', 'J', ':m \'>+1<CR>gv=gv')
  map('v', 'K', ':m \'<-2<CR>gv=gv')

  -- <Ctrl-c> redraws the screen and removes any search highlighting.
  map('n', '<C-c>', ':nohl<CR><C-l>')

  map('n', '<leader>h', ':<C-u>split<CR>')
  map('n', '<leader>v', ':<C-u>vsplit<CR>')

  map('n', '<leader>ww', M.remove_trailing_whitespace, { noremap = true, desc = "Remove trailing whitespace" })
  map('n', '<leader>cp', M.copy_relative_path, { noremap = true, desc = "Copy relative file path to clipboard" })
  map('n', '<leader>ih', M.toggle_inlay_hints, { noremap = true, desc = "Toggle inlay hints" })

  -- no one is really happy until you have this shortcuts
  vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
  ]])
end

return M
