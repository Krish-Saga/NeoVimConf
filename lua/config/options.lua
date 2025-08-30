-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Fix for live-server not detecting changes
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.backupcopy = "yes"

-- Treesitter folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Start with all folds open
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
