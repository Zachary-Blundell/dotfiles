local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Shorten function name
local keymap = vim.keymap.set

keymap("n", "<leader>a", mark.add_file)
keymap("n", "<leader>t", ui.toggle_quick_menu, {noremap = false})

keymap("n", "<leader>1", function() ui.nav_file(1) end)
keymap("n", "<leader>2", function() ui.nav_file(2) end)
keymap("n", "<leader>3", function() ui.nav_file(3) end)
keymap("n", "<leader>4", function() ui.nav_file(4) end)
keymap("n", "<leader>5", function() ui.nav_file(5) end)
keymap("n", "<leader>6", function() ui.nav_file(6) end)
