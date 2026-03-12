return {
  {
    "jakewvincent/mkdnflow.nvim",
    config = function()
      require("mkdnflow").setup({
        -- Config goes here; leave blank for defaults
      })
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- build = "cd app && npm install",
    build = ":call mkdp#util#install()",
    -- build = "npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }

      -- set to 1, nvim will open the preview window after entering the Markdown buffer
      -- default: 0
      -- vim.g.mkdp_auto_start = 1

      -- set to 1, the nvim will auto close current preview window when changing
      -- from Markdown buffer to another buffer
      -- default: 1
      -- vim.g.mkdp_auto_close = 1
      -- combine preview window
      -- default: 0
      -- if enable it will reuse previous opened preview window when you preview markdown file.
      -- ensure to set let g:mkdp_auto_close = 0 if you have enable this option
      -- vim.g.mkdp_combine_preview = 0
    end,
    ft = { "markdown" },
    config = function()
      vim.cmd([[
        " ---------------------------------------------------------------------------
        " Markdown-preview browser opener (Vim-script, exactly like the README) ------
        " ---------------------------------------------------------------------------

        function! OpenMarkdownPreview(url) abort
          silent execute '!brave --new-window ' . a:url
        endfunction
        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]])
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
  },
}
