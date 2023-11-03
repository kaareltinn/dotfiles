-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy.vim (package manager) setup setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function map(kind, mapping, command, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(kind, mapping, command, options)
end

-- Set mapleader to ","
vim.g.mapleader = ","

-- nvim-tree
local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  map('', '<leader>q', ':NvimTreeToggle<CR>')
  map('', '<leader>m', ':NvimTreeFindFile<CR>')
end

-- Plugins spec
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        on_attach = nvim_tree_on_attach
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'alexghergh/nvim-tmux-navigation',
  },
  {
    'vim-test/vim-test',
  },
  {
    'rgroli/other.nvim',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
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
          },
          sync_install = false,
          highlight = { enable = true, additional_vim_regex_highlighting = true },
          indent = { enable = true },
        })
    end
  },
  {
    'nvim-treesitter/playground'
  },
  {
    'arcticicestudio/nord-vim'
  }
})

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>fs', builtin.find_files)
map('n', '<leader>fg', builtin.live_grep)
map('n', '<leader>fb', builtin.buffers)
map('n', 'K', ":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>")

-- Moving between windows
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')
map('', '<C-h>', '<C-w>h')

-- Close buffer
map('', '<leader>d', ':bd!<CR>')

-- Tmux Navigation
-- Have to come after regular windows movement
local nvim_tmux_nav = require('nvim-tmux-navigation')
nvim_tmux_nav.setup {
  disable_when_zoomed = true
}

map('n', '<C-h>', ':NvimTmuxNavigateLeft<CR>')
map('n', '<C-j>', ':NvimTmuxNavigateDown<CR>')
map('n', '<C-k>', ':NvimTmuxNavigateUp<CR>')
map('n', '<C-l>', ':NvimTmuxNavigateRight<CR>')

-- vim-test
map('n', '<leader>t', ':TestFile<CR>')
map('n', '<leader>s', ':TestNearest<CR>')
map('n', '<leader>l', ':TestLast<CR>')
map('n', '<leader>a', ':TestSuite<CR>')

vim.g['test#strategy'] = 'neovim'
vim.g['test#neovim#term_position'] = '20'
vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'

-- other.vim
require("other-nvim").setup({
	mappings = {
		"rails",
    {
      pattern = "spec/(.*)/(.*)_spec.rb$",
      target = "app/%1/%2.rb"
    },
    {
      pattern = "lib/(.*)/(.*).ex$",
      target = "test/%1/%2_test.exs"
    },
    {
      pattern = "test/(.*)/(.*)_test.exs$",
      target = "lib/%1/%2.ex"
    },
    {
      pattern = "app/(.*)/(.*).ts$",
      target = "app/%1/%2.test.js",
    },
    {
      pattern = "app/(.*)/(.*).test.js$",
      target = "app/%1/%2.ts",
    },
    {
      pattern = "app/(.*)/(.*).tsx$",
      target = "app/%1/%2.test.jsx",
    },
    {
      pattern = "app/(.*)/(.*).test.jsx$",
      target = "app/%1/%2.tsx",
    },
    {
      pattern = "app/(.*)/(.*).jsx$",
      target = "app/%1/%2.test.jsx",
    },
    {
      pattern = "app/(.*)/(.*).test.jsx$",
      target = "app/%1/%2.jsx",
    }
  }
})

-- other.vim
map('n', '<leader>aa', ':Other<CR>')
map('n', '<leader>ah', ':OtherSplit<CR>')
map('n', '<leader>av', ':OtherVSplit<CR>')
map('n', '<leader>at', ':Other test<CR>')

vim.cmd('colorscheme nord')
