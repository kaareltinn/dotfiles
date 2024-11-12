map = require('config.mappings').map
return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "eex",
          "heex",
          "ruby",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "scss",
          "dockerfile",
          "diff",
          "gitattributes",
          "gitcommit",
          "git_config",
          "gitignore",
          "graphql",
          "json",
          "yaml",
          "embedded_template",
          "markdown",
          "markdown_inline",
        },
        sync_install = false,
        highlight = { enable = true, additional_vim_regex_highlighting = true },
        indent = { enable = true },
      })
    end
  },
  {'nvim-treesitter/playground'},
}
