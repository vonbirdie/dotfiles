-- telescope: fuzzy file finder and integration with neovim.
-- https://github.com/nvim-telescope/telescope.nvim
--

return {
  'nvim-telescope/telescope.nvim',

  branch = '0.1.x',

  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-treesitter/nvim-treesitter'},
    {'folke/trouble.nvim'},
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

    {"<leader>ff", function()
      return require('telescope.builtin').find_files()
    end, {"n", "v", "o"}, { desc = "Search among files." }},
    {"<leader>fg", function()
      return require('telescope.builtin').live_grep()
    end, {"n", "v", "o"}, { desc = "Search the contents in files." }},
    {"<leader>fb", function()
      return require('telescope.builtin').buffers()
    end, {"n", "v", "o"}, { desc = "Search among open buffers." }},
  },

  opts = function()
    local trouble = require("trouble.providers.telescope")

    return {
      defaults = {
        mappings = {
          i = { ["<c-t>"] = trouble.open_with_trouble },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        },
      },
    }
  end,
}

