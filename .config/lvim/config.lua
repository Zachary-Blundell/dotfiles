-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
require("zaiquiri.options")
require("zaiquiri.keymaps")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd([[
let g:LanguageClient_serverCommands = {
    \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \ }
]])


lvim.plugins = {
  { "tpope/vim-fugitive" },
  { "chentoast/marks.nvim" },
  { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000,     config = true,  opts = ... },
  { "ThePrimeagen/harpoon" },
  -- for dart syntax hightling
  { "dart-lang/dart-vim-plugin" },
  { "windwp/nvim-ts-autotag" },
  { "vimwiki/vimwiki" },
  {
    "iamcco/markdown-preview.nvim",
    config = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require('flutter-tools').setup {
        -- (uncomment below line for windows only)
        -- flutter_path = "home/flutter/bin/flutter.bat",
        debugger = {
          -- make these two params true to enable debug mode
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" }
            }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
                flutterSdkPath = "home/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              }
            }
            -- uncomment below line if you've launch.json file already in your vscode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = require("lvim.lsp").common_on_attach,
          capabilities = require("lvim.lsp").default_capabilities,
        },
      }
    end
  },
}
require("zaiquiri.mkdp")
require("zaiquiri.marks")
require("zaiquiri.cmp")
require("zaiquiri.harpoon")
require("zaiquiri.vimwiki")
-- require("zaiquiri.catppuccin")
lvim.colorscheme = 'catppuccin-mocha'
lvim.transparent_window = true
