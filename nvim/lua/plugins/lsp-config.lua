-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
on_attach = function(client, bufnr)

  -- Mappings.
  local opts = { buffer = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
  vim.keymap.set('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
  vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set('n', '<space>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<space>e', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<space>q', function() vim.diagnostic.setloclist() end, opts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, opts)
end

vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_next()
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev()
end, { desc = "Previous diagnostic" })
