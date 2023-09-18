--local opts = { noremap = true, silent = true }    --possibly neede???

-- Some info
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

--- Normal ---
-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Opens explorer
map("n", "<leader>e", vim.cmd.NvimTreeToggle)
-- find and replace the word cursor is on 
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Makes current file exacutable 
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Keeps cursor... 
-- at the begining when using J
map("n", "J", "mzJ`z")  
-- in center when...  
map("n", "<C-d>", "<C-d>zz")  -- going half page down  
map("n", "<C-u>", "<C-u>zz")  -- going half page up  
map("n", "n", "nzzzv")        -- moving from search terms 
map("n", "N", "Nzzzv")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")

--  Timestamp
-- Sat Jul 22 02:14:32 PM CEST 2023
map("n", "<A-T>", ":r! date<CR>")
-- 14:17
map("n", "<A-t>", ":r! date +\\%H:\\%M:\\%S <CR>")

--  Open Startify
map("n", "<A-s>", ":Startify<CR>")

--- Insert ---
-- Press jk fast to enter
map("i", "jk", "<ESC>")
map("i", "<C-c>", "<Esc>")

--- Visual ---
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")  --map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")  --map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "p", '"_dP')

--- Visual Block ---
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")
-- greatest remap ever
map("x", "<leader>p", [["_dP]])
