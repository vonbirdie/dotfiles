-- https://github.com/folke/todo-comments.nvim
--

return {
  "folke/todo-comments.nvim",

  dependencies = {
    {"nvim-lua/plenary.nvim"},
  },

  keys = {
    {"]t", function()
      require("todo-comments").jump_next()
    end, "n", { desc = "Next todo comment" }},

    {"[t", function()
      require("todo-comments").jump_prev()
    end, "n", { desc = "Previous todo comment" }},
  },

  event = {
    "BufEnter",
  },

  opts = {
    keywords = {
      TODO = {
        color = "warning",
        icon = "",
      },
      DO_NOT_SUBMIT = {
        color = "error",
        icon = "",
        alt = { "DO NOT SUBMIT" },
      },
    },

    highlight = {
      before = "fg",
      keyword = "bg",
      after = "fg",
      pattern = [[<(KEYWORDS)\s*\((b\/[0-9]+|[a-z]+)\):]],
    },
  }
}

