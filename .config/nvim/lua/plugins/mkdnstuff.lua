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
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    -- config = function()
    --   vim.cmd([[
    --     " ---------------------------------------------------------------------------
    --     " Markdown-preview browser opener (Vim-script, exactly like the README) ------
    --     " ---------------------------------------------------------------------------
    --
    --     function! OpenMarkdownPreview(url) abort
    --       silent execute '!brave --new-window ' . a:url
    --     endfunction
    --     let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    --     ]])
    -- end,
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
