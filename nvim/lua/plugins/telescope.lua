-- telescope: fuzzy file finder and integration with neovim.
-- https://github.com/nvim-telescope/telescope.nvim
--

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'kyazdani42/nvim-web-devicons', lazy = true},
    {'nvim-treesitter/nvim-treesitter', lazy = true},
  },

  config = function()
    vim.keymap.set("", "<c-o>", function()
      return require('telescope.builtin').resume()
    end, { desc = "Resume the last search." })

    vim.keymap.set("", "<c-h>", function()
      return require('telescope.builtin').help_tags()
    end, { desc = "Search the nvim documentation." })
    vim.keymap.set("", "<c-k>", function()
      return require('telescope.builtin').keymaps()
    end, { desc = "Search among defined keymaps." })

    vim.keymap.set("", "<space>ff", function()
      return require('telescope.builtin').find_files()
    end)
    vim.keymap.set("", "<space>fg", function()
      return require('telescope.builtin').live_grep()
    end)
    vim.keymap.set("", "<space>fb", function()
      return require('telescope.builtin').buffers()
    end)
    vim.keymap.set("", "<space>fm", function()
      return require('telescope.builtin').marks()
    end)

    vim.keymap.set("", "gD", function()
      return require('telescope.builtin').lsp_type_definitions()
    end)
    vim.keymap.set("", "gd", function()
      return require('telescope.builtin').lsp_definitions()
    end)
    vim.keymap.set("", "gi", function()
      return require('telescope.builtin').lsp_implementations()
    end)
    vim.keymap.set("", "gr", function()
      return require('telescope.builtin').lsp_references()
    end)

    vim.keymap.set("", "<space>ca", function()
      return require('telescope.builtin').lsp_code_actions()
    end)
    vim.keymap.set("", "<space>cd", function()
      return require('telescope.builtin').diagnostics()
    end)
  end
}

