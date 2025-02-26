-- Create symlinks in ~/.config/nvim to this file and the rest of the files in this directory:
-- ln -sv ~/work/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
-- ln -sv ~/work/dotfiles/nvim/lua ~/.config/nvim/lua

require('config.options')
require('config.mappings').init()
map = require('config.mappings').map
require('config.lazy')

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- List of mason supported language servers:
-- https://github.com/williamboman/mason-lspconfig.nvim
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'vls',
    -- 'solargraph',
    'elixirls',
    'terraformls',
    'ruff',
    -- 'gopls',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
local lspconfig = require("lspconfig")

lspconfig.solargraph.setup({
  settings = {
    solargraph = {
      diagnostics = true
    }
  }
})
lspconfig.gleam.setup({})

-- GO
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

require('go').setup()

-- Ruff (Python)
lspconfig.ruff.setup({})

-- Telescope
-- note: for some reason couldn't get this work from plugins/telescope.lua
local builtin = require('telescope.builtin')
map('n', 'K', ":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>")

-- treesitter highlight overwrites
vim.api.nvim_set_hl(0, "@module.elixir", { link = "Type"})
vim.api.nvim_set_hl(0, "@string.special.symbol.ruby", { link = "Identifier"})
