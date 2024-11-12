return {
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
    keys = {
      {'<leader>yav', '<cmd>:YAMLView<CR>'},
      {'<leader>yat', '<cmd>:YAMLTelescope<CR>'},
      {'<leader>yaq', '<cmd>:YAMLQuickfix<CR>'},
    }
  },
}
