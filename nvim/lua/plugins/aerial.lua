return {
  {
    'stevearc/aerial.nvim',
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    opts = {
      backends = { 'treesitter', 'lsp' },
    },
    keys = {
      {'<leader>ae', '<cmd>AerialToggle!<CR>'},
      {'<leader>fa', '<cmd>:Telescope aerial<CR>'},
    },
    init = function()
      require('telescope').load_extension('aerial')
    end
  },
}
