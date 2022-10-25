
require("todo-comments").setup({
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
})

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

