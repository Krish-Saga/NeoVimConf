-- Live Preview (F5 start, F6 stop)
vim.keymap.set("n", "<F5>", function()
  vim.fn.jobstart("live-server", { detach = true })
  print("🚀 Live Preview started")
end)

vim.keymap.set("n", "<F6>", function()
  vim.fn.jobstart("pkill live-server", { detach = true })
  print("🛑 Live Preview stopped")
end)
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
return {
  "turbio/bracey.vim",
  build = "npm install --prefix server",
  ft = { "html", "css", "javascript" },
}
