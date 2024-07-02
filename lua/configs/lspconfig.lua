local capabilities = require("cmp_nvim_lsp").default_capabilities()
local map = vim.keymap.set

local lspconfig = require('lspconfig')

local servers = { 'gopls', 'tsserver'}

local on_attach = function()
  map("n","K",vim.lsp.buf.hover,{})
  map("n","rn",vim.lsp.buf.rename,{})
end


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

