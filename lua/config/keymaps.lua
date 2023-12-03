-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Clear search
vim.keymap.set("n", "<C-c>", "<cmd>noh<cr>")

local cycle = require("config.actions.cycle_files")
vim.keymap.set("n", "]f", cycle, { desc = "Next file" })
vim.keymap.set("n", "[f", function()
  cycle({ reverse = true })
end, { desc = "Prev file" })

local create_class = require("config.cpp.create_class.create_class")
vim.keymap.set("n", "<leader>cc", create_class, { desc = "Create class" })
