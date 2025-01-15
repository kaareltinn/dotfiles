return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {"<C-a>", ":CodeCompanionAction<CR>"},
      {"<C-a>", ":CodeCompanionAction<CR>", mode = "v"},
      {"<leader>cct", ":CodeCompanionChat Toggle<CR>"},
      {"<leader>cct", ":CodeCompanionChat Toggle<CR>", mode = "v"},
      {"<leader>cca", ":CodeCompanionChat Add<CR>", mode = "v"}
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "anthropic",
            -- Default config
            -- https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
            keymaps = {
              next_header = {
                modes = { n = "<C-;>", i = "<C-;>" },
              },
              previous_header = {
                modes = { n = "<C-:>", i = "<C-:>" },
              }
            }
          },
          inline = {
            adapter = "anthropic",
          },
        },
      })
    end,
    lazy = false,
  }
}
