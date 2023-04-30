
return {
  'kosayoda/nvim-lightbulb',

  config = function()
    local lightbulb_auto_group = vim.api.nvim_create_augroup("LightbulbAutogroup", {
      clear = false,
    })
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
      group = lightbulb_auto_group,
      callback = function()
        require('nvim-lightbulb').update_lightbulb()
      end
    })
  end
}

