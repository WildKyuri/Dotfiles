-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config")

-- Fish como shell de Neovim
vim.opt.shell = vim.fn.exepath("fish")
