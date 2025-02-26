map = require('config.mappings').map

return {
  -- {'github/copilot.vim'},
  {
    'Exafunction/codeium.vim',
    lazy = false,
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      map('i', '<Tab>', function () return vim.fn['codeium#Accept']() end)
      map('i', '<c-k>', function() return vim.fn['codeium#CycleCompletions'](1) end)
      map('i', '<c-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end)
      map('i', '<c-x>', function() return vim.fn['codeium#Clear']() end)
    end
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      provider = 'claude',
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
      -- "github/copilot.vim", -- for providers='copilot'
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
}
