return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      dim_inactive = true, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      -- on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      -- on_highlights = function(highlights, colors) end,

      cache = true, -- When set to true, the theme will be cached for better performance
    },
  },
}
-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }

-- return {
--   { -- was missing this
--     "catppuccin/nvim",
--     lazy = true,
--     name = "catppuccin",
--     opts = {
--       transparent_background = true,
--       integrations = {
--         aerial = true,
--         alpha = true,
--         cmp = true,
--         dashboard = true,
--         flash = true,
--         gitsigns = true,
--         headlines = true,
--         illuminate = true,
--         indent_blankline = { enabled = true },
--         leap = true,
--         lsp_trouble = true,
--         mason = true,
--         markdown = true,
--         mini = true,
--         native_lsp = {
--           enabled = true,
--           underlines = {
--             errors = { "undercurl" },
--             hints = { "undercurl" },
--             warnings = { "undercurl" },
--             information = { "undercurl" },
--           },
--         },
--         navic = { enabled = true, custom_bg = "lualine" },
--         neotest = true,
--         neotree = true,
--         noice = true,
--         semantic_tokens = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--         which_key = true,
--       },
--     },
--   }, -- and this
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin-mocha",
--     },
--   },
-- }

-- return {
--   -- add gruvbox
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "tokyonight",
--     },
--   },

-- -- add more treesitter parsers
-- {
--   "nvim-treesitter/nvim-treesitter",
--   opts = {
--     ensure_installed = {
--       "bash",
--       "html",
--       "javascript",
--       "json",
--       "lua",
--       "markdown",
--       "markdown_inline",
--       "python",
--       "query",
--       "regex",
--       "tsx",
--       "typescript",
--       "vim",
--       "yaml",
--     },
--   },
-- },
--
-- -- add any tools you want to have installed below
-- {
--   "williamboman/mason.nvim",
--   opts = {
--     ensure_installed = {
--       "stylua",
--       "shellcheck",
--       "shfmt",
--       "flake8",
--     },
--   },
-- },
-- }
