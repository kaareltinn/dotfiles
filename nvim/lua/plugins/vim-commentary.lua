return {
  {
    'tpope/vim-commentary',
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "sql",
        callback = function()
          vim.cmd("setlocal commentstring=--\\ %s")
        end,
      })
    end,
  },
}
