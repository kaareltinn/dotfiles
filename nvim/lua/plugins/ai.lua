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
}
