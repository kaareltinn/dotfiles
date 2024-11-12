-- Create symlinks in ~/.config/nvim to this file and the rest of the files in this directory:
-- ln -sv ~/work/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
-- ln -sv ~/work/dotfiles/nvim/lua ~/.config/nvim/lua

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

require('config.options')
map = require('config.mappings').map

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
  {
    'kchmck/vim-coffee-script'
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
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
  {'github/copilot.vim'},
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      provider = 'copilot',
      mappings = {
        ask = '<leader>ua',
        edit = '<leader>ue',
        refresh = '<leader>ur',
        jump = {
          next = '<M-j>',
          prev = '<M-k>',
        },
      }

    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "github/copilot.vim", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   'Exafunction/codeium.vim',
  --   config = function ()
  --     vim.g.codeium_manual = true
  --     map('i', '<C-i>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
  --     map('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
  --     map('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  --     map('i', '<C-c>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
  --   end
  -- },
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
  },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
})

-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  map('n', '<leader>fc', function() vim.lsp.buf.format() end, { buffer = bufnr })
  map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
  map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  map('n', '<leader>sd', '<cmd>lua vim.diagnostic.open_float()<CR>', { buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    -- 'tsserver',
    'solargraph',
    'elixirls',
    -- 'gopls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
local lspconfig = require("lspconfig")

lspconfig.solargraph.setup({
  settings = {
    solargraph = {
      diagnostics = true
    }
  }
})

-- Aerial
require('aerial').setup({
  backends = { 'treesitter', 'lsp' }
})
require('telescope').load_extension('aerial')

map('n', '<leader>ae', '<cmd>AerialToggle!<CR>')
map('n', '<leader>fa', '<cmd>:Telescope aerial<CR>')

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
require('telescope').setup({
  pickers = {
    find_files = {
      hidden = true
    }
  },
  extensions = {
    aerial = {
      show_columns = 'both',
    },
  },
})

local builtin = require('telescope.builtin')
map('n', '<leader>fs', builtin.find_files)
map('n', '<leader>fg', builtin.live_grep)
map('n', '<leader>fb', builtin.buffers)
map('n', 'K', ":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>")

-- Lualine
require('lualine').setup({
  options = {
    theme = 'nord',
  },
  sections = {
    lualine_c = { {'filename', path=1} }
  },
  inactive_sections = {
    lualine_c = { {'filename', path=1} }
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

-- yaml.nvim
map('n', '<leader>yav', ':YAMLView<CR>')
map('n', '<leader>yat', ':YAMLTelescope<CR>')
map('n', '<leader>yaq', ':YAMLQuickfix<CR>')

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

-- treesitter highlight overwrites
vim.api.nvim_set_hl(0, "@module.elixir", { link = "Type"})
vim.api.nvim_set_hl(0, "@string.special.symbol.ruby", { link = "Identifier"})
