return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {'<leader>obn', ':ObsidianNew<CR>'},
      {'<leader>obs', ':ObsidianSearch<CR>'},
      {'<leader>obt', ':ObsidianToday<CR>'},
      {'<leader>oby', ':ObsidianYesterday<CR>'},
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
        },
      },
    },
  },
}
