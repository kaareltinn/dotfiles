return {
  {
    'rgroli/other.nvim',
    keys = {
      {'<leader>aa', '<cmd>:Other<CR>'},
      {'<leader>ah', '<cmd>:OtherSplit<CR>'},
      {'<leader>av', '<cmd>:OtherVSplit<CR>'},
      {'<leader>at', '<cmd>:Other test<CR>'},
    },
    config = function()
      require('other-nvim').setup({
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
    end
  },
}
