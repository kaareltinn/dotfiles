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

-- Load plugin specs from lua/plugins/*.lua
require("lazy").setup("plugins", {
  defaults = {
    lazy = true, -- Default to lazy loading, optional
  },
  change_detection = {
    notify = false, -- I find the config changed notification super annoying
  },
})
