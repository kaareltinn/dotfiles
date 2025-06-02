map = require('config.mappings').map

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'Myzel394/jsonfly.nvim',
    },
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
    keys = {
      {
          "<leader>fj",
          "<cmd>Telescope jsonfly<cr>",
          desc = "Open json(fly)",
          ft = { "json", "xml", "yaml" },
          mode = "n"
      }
    },
    init = function()
      local builtin = require('telescope.builtin')
      map('n', '<leader>fs', builtin.find_files)
      map('n', '<leader>fg', builtin.live_grep)
      map('n', '<leader>fb', builtin.buffers)
    end,
  },
}
