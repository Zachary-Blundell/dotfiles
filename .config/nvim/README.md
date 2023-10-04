# Todos 
- fix cmp/lsp-zero 
    - comfermations / tab / super tab
- format shortcuts in readme 
- fix live grep in Telescope
- fix nvim-tree doesnt close when last thing open
- add color previewer
- add gitsigns
- add windwp/nvim-ts-autotag
- add a formatter like null-ls
<h1 align="center"> Keymaps </h1>

<!-- # Idea -->
<!-- ## plugin -->
<!-- ### mode -->

leader = space 

### Sections

- General
- Editing
- Navigation / Display
- Search and Replace

# General

| Keymap | Description | Mode |
| ----------- | ----------- | ----------- |
| jk | fast to enter normal mode | Insert, Visual |

# Editing
| Keymap | Description | Mode |
| ----------- | ----------- | ----------- |
| Alt j | move text up | Normal, Visual Block |
| Alt k | move text down | Normal, Visual Block |
| Leader x | <cmd>!chmod +x %<CR> | Normal |
| J | :move '>+1<CR>gv-gv | Visual Block |
| K | :move '<-2<CR>gv-gv | Visual Block |

## CMP
  --   ['<C-y>'] = cmp.mapping.confirm({select = true}),
  --   ['<C-e>'] = cmp.mapping.abort(),
  --   ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  --   ['<C-d>'] = cmp.mapping.scroll_docs(4),
  --   ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
  --   ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
  --   ['<C-p>'] = cmp.mapping(function()
  --     if cmp.visible() then
  --       cmp.select_prev_item(cmp_select_opts)
  --     else
  --       cmp.complete()
  --     end
  --   end),
  --   ['<C-n>'] = cmp.mapping(function()
  --     if cmp.visible() then
  --       cmp.select_next_item(cmp_select_opts)
  --     else
  --       cmp.complete()
  --     end
  --   end),
  -- },
  -- snippet = {
  --   expand = function(args)
  --     require('luasnip').lsp_expand(args.body)
  --   end,
  -- },
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
## Comment

| Keymap | Description | Mode |
| ----------- | ----------- | ----------- |
| gcc | Toggles the current line using linewise comment | Normal |
| gbc | Toggles the current line using blockwise comment | Normal |
| [count]gcc | Toggles the number of line given as a prefix-count using linewise | Normal |
| [count]gbc | Toggles the number of line given as a prefix-count using blockwise | Normal |
| gc[count]{motion} | (Op-pending) Toggles the region using linewise comment | Normal |
| gb[count]{motion} | (Op-pending) Toggles the region using blockwise comment | Normal |
| gc | Toggles the region using linewise comment | Visual |
| gb | Toggles the region using blockwise comment | Visual |
| **Extra mappings** |||
| gco | Insert comment to the next line and enters INSERT mode | Normal |
| gcO | Insert comment to the previous line and enters INSERT mode | Normal |
| gcA | Insert comment to end of the current line and enters INSERT mode | Normal |

### Examples
#### Linewise
```
`gcw` - Toggle from the current cursor position to the next word
`gc$` - Toggle from the current cursor position to the end of line
`gc}` - Toggle until the next blank line
`gc5j` - Toggle 5 lines after the current cursor position
`gc8k` - Toggle 8 lines before the current cursor position
`gcip` - Toggle inside of paragraph
`gca}` - Toggle around curly brackets
```
#### Blockwise
```
`gb2}` - Toggle until the 2 next blank line
`gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
`gbac` - Toggle comment around a class (w/ LSP/treesitter support)
```

# Navigation / Display

## Remaps

| Keymap | Description | Mode |
| ----------- | ----------- | ----------- |
| | **Better Window Navigation**  | |
| Leader h | move to window on the left | Normal |
| Leader l | move to window on the right | Normal |
| Leader j | move to window below | Normal |
| Leader k | move to window above | Normal |
| | **Other** | |
| Leader e | opens tree explorer | Normal |
| | **Navigate buffers** | |
| L | move to next buffer | Normal |
| H | move to previous buffer | Normal |
| Ctrl j | Close current buffer | Normal |
| | **Resize with arrows** | |
| Up arrow | increase hight | Normal |
| Down arrow | decrease hight | Normal |
| Right arrow | increase width | Normal |
| Left arrow | decrease width | Normal |
| Ctrl u | going half page up | Nromal |
| Ctrl d | going half page down | Nromal |

# Telescope
| Keymap | Description | Mode |
| ----------- | ----------- | ----------- |
| leader ff | Open fuzzy find menu | Normal |
| Ctrl p> | Open find git files menu | Normal |
| leader ps | Live grep files | Normal | 

## Harpoon
| Keymap | Description | Mode |
| ----------- | ----------- | ----------- |
| leader a | add file to Harpoon | Normal |
| leader fh | open quick menu | Normal |
| leader t | go to file 1 | Normal |
| leader g | go to file 2 | Normal |
| leader b | go to file 3 | Normal |
| leader y | go to file 4 | Normal |
| leader h | go to file 5 | Normal |
| leader n | go to file 6 | Normal |

# Search and Replace

### find and replace the word cursor is on 
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])






--- Insert ---
map("i", "<C-c>", "<Esc>")

--- Visual ---
### Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

### greatest remap ever
map("x", "<leader>p", [["_dP]])


<h1 align="center"> Plugins </h1>


## Packer
- [packer.nvim](https://github.com/wbthomason/packer.nvim) -- Have packer manage itself
- [popup.nvim](https://github.com/nvim-lua/popup.nvim) -- An implementation of the Popup API from vim in Neovim
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) -- Useful lua functions used ny lots of plugins

## Quality of life 
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) -- Autopairs, integrates with both cmp and treesitter
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) -- Easily comment stuff
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) -- Context specific commenting for stuff for example with js and jsx
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) -- Markdown Preview


## Visuals 
- [vim-startify](https://github.com/mhinz/vim-startify) -- Startify dashboard
- [vim-airline](https://github.com/vim-airline/vim-airline) -- Status line 
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) -- Themes for status line 
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -- Treesitter
### Colorschemes
- [colorschemes](https://github.com/lunarvim/colorschemes) -- A bunch of colorschemes 
- [darkplus.nvim](https://github.com/lunarvim/darkplus.nvim)
- [vim-deus](https://github.com/ajmwagar/vim-deus)

## Navigation
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) -- Telescope
- [ripgrep](https://github.com/BurntSushi/ripgrep)      -- required for live_grep and grep_string
- [harpoon](https://github.com/theprimeagen/harpoon)) -- Harpoon
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)} -- Bufferline
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) -- Nvim-tree
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) -- adds the icons to the folders and files. also used in alot of other plugins

## Lsp-zero
- [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
#### LSP Support
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)    -- enable LSP
- [mason.nvim](https://github.com/williamboman/mason.nvim)  -- simple to use language server installer
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)  -- language server settings 

#### Autocompletion
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)         -- The completion plugin
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)       -- buffer completions
- [cmp-path](https://github.com/hrsh7th/cmp-path)         -- path completion
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)      -- cmdline completions
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) -- snippet completions
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)

#### Snippets
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)             -- snippet engine
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) -- a bunch of snippets to use
