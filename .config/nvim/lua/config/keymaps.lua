-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Shorten function name
local keymap = vim.keymap.set --(mode, lhs, rhs, opts?)

--  Timestamp
-- ven. 22 sept. 2023 14:33:55 CEST
keymap("n", "<A-T>", ":r! date +\\%d\\ \\%a\\ \\%b\\ \\%y\\ \\%Z <CR>")
-- 14:17:20
keymap("n", "<A-t>", ":r! date +\\%H:\\%M:\\%S <CR>")

-- Insert --
-- Press jk fast to enter
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
