return {
  {
    'arcticicestudio/nord-vim',
    init = function()
      vim.cmd('colorscheme nord')
      vim.g['nord_uniform_status_lines'] = true
      vim.g['nord_uniform_diff_background'] = true
    end
  },
}
