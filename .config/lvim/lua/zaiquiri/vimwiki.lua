
-- Define a global variable vimwiki_list as a Lua table
vim.g.vimwiki_list = {
  {
    path = '~/Documents/Notebook/',
    syntax = 'markdown',
    ext = 'md'
  }
}

vim.g.vimwiki_folding = 'custom'
vim.cmd [[
  autocmd FileType markdown hi VimwikiLink guifg=#8839ef
]]
