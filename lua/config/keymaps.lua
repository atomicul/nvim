-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Clear search
vim.keymap.set("n", "<C-c>", "<cmd>noh<cr>")

local cycle = require("config.actions.cycle_files")
vim.keymap.set("n", "<leader>n", cycle)
vim.keymap.set("n", "<leader>p", function()
  cycle({ reverse = true })
end)
