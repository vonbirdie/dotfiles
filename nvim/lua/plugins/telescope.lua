-- telescope: fuzzy file finder and integration with neovim.
-- https://github.com/nvim-telescope/telescope.nvim
--

return {
  'nvim-telescope/telescope.nvim',

  branch = '0.1.x',

  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-treesitter/nvim-treesitter'},
  },

  keys = {
    {"<c-o>", function()
      return require('telescope.builtin').resume()
    end, {"n", "v", "o"}, { desc = "Resume the last search." }},

    {"<c-h>", function()
      return require('telescope.builtin').help_tags()
    end, {"n", "v", "o"}, { desc = "Search the nvim documentation." }},
    {"<c-k>", function()
      return require('telescope.builtin').keymaps()
    end, {"n", "v", "o"}, { desc = "Search among defined keymaps." }},

    {"<space>ff", function()
      return require('telescope.builtin').find_files()
    end, {"n", "v", "o"}},
    {"<space>fg", function()
      return require('telescope.builtin').live_grep()
    end, {"n", "v", "o"}},
    {"<space>fb", function()
      return require('telescope.builtin').buffers()
    end, {"n", "v", "o"}},
    {"<space>fm", function()
      return require('telescope.builtin').marks()
    end, {"n", "v", "o"}},

    {"gD", function()
      return require('telescope.builtin').lsp_type_definitions()
    end, {"n", "v", "o"}},
    {"gd", function()
      return require('telescope.builtin').lsp_definitions()
    end, {"n", "v", "o"}},
    {"gi", function()
      return require('telescope.builtin').lsp_implementations()
    end, {"n", "v", "o"}},
    {"gr", function()
      return require('telescope.builtin').lsp_references()
    end, {"n", "v", "o"}},

    {"<space>ca", function()
      return require('telescope.builtin').lsp_code_actions()
    end, {"n", "v", "o"}},
    {"<space>cd", function()
      return require('telescope.builtin').diagnostics()
    end, {"n", "v", "o"}},
  },
}

