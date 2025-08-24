return {
  "folke/snacks.nvim",
  opts = {
    notifier = { enabled = true },

    -- show hidden files in snacks.explorer
    picker = {
      sources = {

        explorer = {
          hidden = true,
          follow_file = false,
          ignored = true,
          exclude = { "node_modules", ".git" },
        },
      },
    },
  },
}
