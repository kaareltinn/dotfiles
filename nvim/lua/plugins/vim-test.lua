return {
  'vim-test/vim-test',
  keys = {
    {'<leader>t', '<cmd>TestFile<CR>'},
    {'<leader>s', '<cmd>TestNearest<CR>'},
    {'<leader>l', '<cmd>TestLast<CR>'},
    {'<leader>a', '<cmd>TestSuite<CR>'},
  },
  init = function()
    vim.g['test#strategy'] = 'neovim'
    vim.g['test#neovim#term_position'] = '20'
    vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
  end,
}
