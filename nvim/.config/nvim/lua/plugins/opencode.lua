return {
  "AuenKr/open-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("opencode").setup()
  end
}
