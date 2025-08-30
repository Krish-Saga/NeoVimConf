-- Run Python with F5
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write") -- autosave
  vim.cmd("!python3 %")
end, { noremap = true, silent = true })

return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },
}
