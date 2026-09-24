-- Create symlinks in ~/.config/nvim to this file and the rest of the files in this directory:
-- ln -sv ~/work/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
-- ln -sv ~/work/dotfiles/nvim/lua ~/.config/nvim/lua

require('config.options')
require('config.mappings').init()
map = require('config.mappings').map
require('custom.hotreload')
require('config.lazy')

-- Add cmp_nvim_lsp capabilities settings to all LSP servers
-- This should be executed before you configure any language server
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

-- List of mason supported language servers:
-- https://github.com/williamboman/mason-lspconfig.nvim
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'vue_ls',
    -- 'solargraph',
    'elixirls',
    'terraformls',
    'ruff',
    'ty'
    -- 'jedi_language_server',
    -- 'pyright',
    -- 'gopls',
  },
  automatic_enable = true,
})

-- Ensure 'vue-language-server' is installed via Mason (e.g. add "volar" above)
-- Then, manually locate the Volar plugin path:
local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

-- Now configure ts_ls (TypeScript) to load the Vue plugin
vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_plugin_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "vue" },
})

-- Customize Solargraph for Ruby (nvim-lspconfig provides base config)
vim.lsp.config('solargraph', {
  settings = {
    solargraph = {
      diagnostics = true
    }
  }
})

-- All other servers (elixirls, terraformls, jedi_language_server, ruff, gleam)
-- are automatically configured by nvim-lspconfig and enabled by mason-lspconfig

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

-- Telescope
-- note: for some reason couldn't get this work from plugins/telescope.lua
local builtin = require('telescope.builtin')
map('n', 'K', ":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>")

-- treesitter highlight overwrites
vim.api.nvim_set_hl(0, "@module.elixir", { link = "Type"})
vim.api.nvim_set_hl(0, "@string.special.symbol.ruby", { link = "Identifier"})
