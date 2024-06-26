local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigateRight", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigateDown", opts)
keymap("n", "<C-l>", "<cmd> TmuxNavigateUp", opts)
keymap("n", "<leader> h", "<C-w>h", opts)
keymap("n", "<leader> j", "<C-w>j", opts)
keymap("n", "<leader> k", "<C-w>k", opts)
keymap("n", "<leader> l", "<C-w>l", opts)

-- Keep search terms in the center when searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-j>", ":bd<CR>", opts)

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

--  Timestamp
-- Sat Jul 22 02:14:32 PM CEST 2023
-- keymap("n", "<A-T>", ":r! date<CR>", opts)
-- ven. 22 sept. 2023 14:33:55 CEST
keymap("n", "<A-T>", ":r! date +\\%d\\ \\%a\\ \\%b\\ \\%y\\ \\%Z <CR>", opts)

-- 14:17:20
keymap("n", "<A-t>", ":r! date +\\%H:\\%M:\\%S <CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "JK", "<ESC>", opts)
keymap("v", "<C-jk>", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Flutter --
keymap("n", "<leader>r", ":FlutterRestart<CR>", opts)
keymap("n", "<leader>R", ":FlutterRun<CR>", opts)


