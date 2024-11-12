map = require('config.mappings').map

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      pickers = {
        find_files = {
          hidden = true
        }
      },
      extensions = {
        aerial = {
          show_columns = 'both',
        },
      },
    },
    init = function()
      local builtin = require('telescope.builtin')
      map('n', '<leader>fs', builtin.find_files)
      map('n', '<leader>fg', builtin.live_grep)
      map('n', '<leader>fb', builtin.buffers)
    end,
  },
}
