return {
  "stevearc/conform.nvim",
  -- LazyVim already includes conform; we extend its opts.
  opts = {
    -- Run on save. Turn off LSP fallback so vtsls doesn't take over.
    format_on_save = function(_buf)
      return { timeout_ms = 3000, lsp_fallback = false }
    end,

    -- Use Prettier/Prettierd for web filetypes (tsx is "typescriptreact")
    formatters_by_ft = {
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      jsonc = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      less = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      ["markdown.mdx"] = { "prettierd", "prettier" },
    },

    -- Prefer project-local prettier if available
    formatters = {
      prettier = { prefer_local = "node_modules/.bin" },
      -- prettierd will automatically discover your local prettier config;
      -- no extra config needed, but you can add env if you like:
      -- prettierd = { env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.getcwd() .. "/.prettierrc" } },
    },
  },
}
