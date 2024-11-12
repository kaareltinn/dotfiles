M = {}

M.map = function(kind, mapping, command, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(kind, mapping, command, options)
end

local map = M.map

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

return M
