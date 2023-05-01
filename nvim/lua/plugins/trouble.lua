
return {
  'folke/trouble.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  keys = {
    {"<leader>xx", function ()
      return require('trouble').toggle()
    end, {desc = "Toggle trouble window."}},

    {"<leader>xw", function ()
      return require('trouble').toggle('workspace_diagnostics')
    end, {desc = "Toggle trouble workspace diagnostics window."}},
    {"<leader>xd", function ()
      return require('trouble').toggle('document_diagnostics')
    end, {desc = "Toggle trouble document diagnostics window."}},

    {"<leader>xl", function ()
      return require('trouble').toggle('loclist')
    end, {desc = "Toggle trouble loclist window."}},
    {"<leader>xq", function ()
      return require('trouble').toggle('quickfix')
    end, {desc = "Toggle trouble quickfix window."}},

    {"gr", function ()
      return require('trouble').toggle('lsp_references')
    end, {desc = "Toggle trouble LSP references window."}},
  },

  opts = {
    use_diagnostic_signs = true,
  },
}
