-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Shorten function name
local keymap = vim.keymap.set --(mode, lhs, rhs, opts?)

--  quick write
-- vim.keymap.del({ "n", "i", "v" }, "<leader>w")
keymap("n", "<leader>w", ":w<CR>", { desc = "Write" })

-- Insert --
-- Press jk fast to exit
keymap("i", "jk", "<ESC>")
keymap("i", "JK", "<ESC>")
keymap("v", "<C-jk>", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Flutter --
keymap("n", "<leader>r", ":FlutterRestart<CR>")
keymap("n", "<leader>R", ":FlutterRun<CR>")

-- in lua/config/keymaps.lua

-- Remove the defaults first
vim.keymap.del("n", "<leader>e")
vim.keymap.del("n", "<leader>E")

-- Swap them
keymap("n", "<leader>e", function()
  require("snacks.explorer").open({ cwd = vim.fn.getcwd() })
end, { desc = "Explorer Snacks (cwd)" })

keymap("n", "<leader>E", function()
  require("snacks.explorer").open({ cwd = require("lazyvim.util").root() })
end, { desc = "Explorer Snacks (root dir)" })
