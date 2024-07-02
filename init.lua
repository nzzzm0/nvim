-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- configs
vim.g.mapleader = ","
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

vim.keymap.set('t', '<C-n>', '<C-\\><C-n>') -- exit terminal
vim.keymap.set('n', '<C-n>', '<cmd>Ex<CR>') -- exit terminal

-- plugins
local plugins = {
  {"windwp/nvim-autopairs", config = true},
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer'  ,
      'hrsh7th/cmp-path'    ,
      'hrsh7th/cmp-cmdline' ,
    },
    config = function()
      require("configs.cmp")
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require("configs.lspconfig")
    end
  },
  {"williamboman/mason.nvim"},
  {"nvim-lua/plenary.nvim"},
  {"nvim-telescope/telescope.nvim", tag = "0.1.8"}
}
require("lazy").setup(plugins)
require("mason").setup()

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- lspconfig
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})

