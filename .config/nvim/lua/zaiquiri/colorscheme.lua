vim.cmd "colorscheme onedark"
-- remove background / make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


-- vim.g.tokyonight_style = 'storm' -- available: night, storm Customize the style of this color scheme.
-- vim.g.tokyonight_transparent_background = 1 -- Set to 1 to enable transparent background.
-- vim.g.tokyonight_enable_italic = 1
-- vim.g.tokyonight_cursor = 'auto' -- Available values: 'auto', 'red', 'green', 'blue' Customize the cursor color, only works in GUI clients.
--
-- vim.cmd "colorscheme tokyonight"
