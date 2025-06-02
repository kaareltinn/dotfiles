return {
  {
    'tpope/vim-fugitive',
    keys = {
      {'<leader>gs', ':G<CR>'},
      {'<leader>gb', ':G blame<CR>'},
      {'<leader>gd', ':G diff<CR>'},
      {'<leader>gc', ':Gvdiffsplit3!<CR>'},
      {'ghd', ':diffget //2<CR>'},
      {'ghl', ':diffget //3<CR>'},
    },
  }
}
