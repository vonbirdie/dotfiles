
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

    {"gD", function ()
      return require('trouble').toggle('lsp_type_definitions')
    end, {desc = "Toggle trouble type definitions window."}},
    {"gd", function ()
      return require('trouble').toggle('lsp_definitions')
    end, {desc = "Toggle trouble definitions window."}},
    {"gi", function ()
      return require('trouble').toggle('lsp_implementations')
    end, {desc = "Toggle trouble implementations window."}},
    {"gr", function ()
      return require('trouble').toggle('lsp_references')
    end, {desc = "Toggle trouble references window."}},
  },

  opts = {
    use_diagnostic_signs = true,
  },
}
