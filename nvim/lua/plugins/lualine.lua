return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('lualine').setup {
        options = {
          theme = 'nord',
        },
        sections = {
          lualine_c = { {'filename', path=1} },
        },
        inactive_sections = {
          lualine_c = { {'filename', path=1} },
        },
      }
    end,
  }
}
