
return {
  'rcarriga/nvim-notify',

  lazy = false,
  priority = 999,

  init = function()
    vim.notify = require("notify")
  end,
}

