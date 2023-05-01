-- Renders an icon in the status column where there is a code action from an
-- LSP available.
-- https://github.com/kosayoda/nvim-lightbulb

return {
  'kosayoda/nvim-lightbulb',

  lazy = true,

  init = function()
    local lightbulb_auto_group = vim.api.nvim_create_augroup("LightbulbAutogroup", {
      clear = false,
    })
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
      group = lightbulb_auto_group,
      callback = function()
        require('nvim-lightbulb').update_lightbulb()
      end
    })
  end,
}

