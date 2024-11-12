map = require('config.mappings').map

return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/mysnippets"})

      local luasnip = require('luasnip')
      luasnip.filetype_extend("typescript", {"javascript"})
      luasnip.filetype_extend("javascriptreact", {"javascript"})
      luasnip.filetype_extend("typescriptreact", {"javascript"})
    end,
    init = function()
      local luasnip = require('luasnip')
      map('i', '<C-l>', luasnip.expand)
    end
  }
}
