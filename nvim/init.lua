-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy.vim (package manager) setup
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

-- Options
vim.g.mapleader = ","

vim.opt.number = true
vim.opt.ruler = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

vim.opt.laststatus = 2

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.clipboard = "unnamedplus"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 100

vim.opt.conceallevel = 1

-- General remappings
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Tabs
map('n', '<Tab>', 'gt')
map('n', '<S-Tab>', 'gT')
map('n', '<S-t>', ':tabnew<CR>')

-- Window switching
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')
map('', '<C-h>', '<C-w>h')

-- Buffer nav
map('', '<leader>d', ':bd!<CR>')
map('', '<leader>z', ':bp<CR>')
map('', '<leader>x', ':bn<CR>')

-- Maintain visual mode after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move visual block
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

-- <Ctrl-c> redraws the screen and removes any search highlighting.
map('n', '<C-c>', ':nohl<CR><C-l>')

map('n', '<leader>h', ':<C-u>split<CR>')
map('n', '<leader>v', ':<C-u>vsplit<CR>')

-- no one is really happy until you have this shortcuts
vim.cmd([[
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
]])
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
  {'arcticicestudio/nord-vim'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-surround'},
  {'tpope/vim-commentary'},
  {'Raimondi/delimitMate'},
  {'airblade/vim-gitgutter'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-buffer'},
  {'L3MON4D3/LuaSnip'},
  {'honza/vim-snippets'},
  {'mattn/emmet-vim'},
  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
  },
  {'mhinz/vim-mix-format'},
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
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
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
        },
      },
    },
  }
})

-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  map('n', '<leader>fc', function() vim.lsp.buf.format() end, { buffer = bufnr })
  map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
  map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'solargraph',
    'elixirls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- LINTERS
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- requires npm install -g eslint_d
    null_ls.builtins.diagnostics.eslint_d.with({
      extra_args = { "-c", "eslint.config.mjs" },
      env = {
        ESLINT_USE_FLAT_CONFIG = "true",
      },
      -- condition = function(utils)
      --   utils.root_has_file("eslint.config.mjs")
      -- end
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup, 
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- CMP
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'codeium'},
    {
      name = 'buffer',
      option = {
        keyword_pattern = [[\k\+]],
      }
    },
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  }
})

require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/mysnippets"})

local luasnip = require("luasnip")
luasnip.filetype_extend("typescript", {"javascript"})
luasnip.filetype_extend("javascriptreact", {"javascript"})
luasnip.filetype_extend("typescriptreact", {"javascript"})
map('i', '<C-l>', luasnip.expand)

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>fs', builtin.find_files)
map('n', '<leader>fg', builtin.live_grep)
map('n', '<leader>fb', builtin.buffers)
map('n', 'K', ":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>")

require('telescope').load_extension 'pomodori'

map('n', '<leader>pt', function()
  require('telescope').extensions.pomodori.timers()
end, { desc = "Manage Pomodori timers" })


-- Lualine
require('lualine').setup({
  options = {
    theme = 'nord',
  }
})

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
map('t', '<C-o>', '<C-\\><C-n>', { noremap = false })

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

-- vim-fugitive
map('', '<leader>gs', ':G<CR>')
map('', '<leader>gb', ':G blame<CR>')
map('', '<leader>gd', ':G diff<CR>')

-- gitgutter
map('n', 'ghn', ':GitGutterNextHunk<CR>')
map('n', 'ghb', ':GitGutterPrevHunk<CR>')
map('n', 'ghu', ':GitGutterUndoHunk<CR>')
map('n', 'ghs', ':GitGutterStageHunk<CR>')

-- obsidian.vim
map('n', '<leader>obn', ':ObsidianNew<CR>')
map('n', '<leader>obs', ':ObsidianSearch<CR>')
map('n', '<leader>obt', ':ObsidianToday<CR>')
map('n', '<leader>oby', ':ObsidianYesterday<CR>')

-- nord
vim.cmd('colorscheme nord')
vim.g['nord_uniform_status_lines'] = true
vim.g['nord_uniform_diff_background'] = true

-- vim-mix-format
vim.g['mix_format_on_save'] = 1

vim.api.nvim_set_hl(0, "@module.elixir", { link = "Type"})
