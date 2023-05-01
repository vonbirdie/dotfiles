-- 
-- Evaluating as of 13/04/23
--

return {
  'sudormrfbin/cheatsheet.nvim',

  dependencies = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  },

  lazy = false,

  opts = {
    bundled_cheatsheets = {
      disabled = {
        "nerd-fonts",
        "unicode",
        "markdown",
      },
    },
  }
}

