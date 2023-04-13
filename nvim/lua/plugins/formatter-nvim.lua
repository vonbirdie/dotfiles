-- formatter: Runs formatters mapped by language.
-- https://github.com/mhartington/formatter.nvim
--

return {
  'mhartington/formatter.nvim',

  event = {
    "BufWritePost",
  },

  config = function()
    require('formatter').setup {
      filetype = {
        rust = {
          -- Rustfmt
          function()
            return {
              exe = "rustfmt",
              args = {"--emit=stdout"},
              stdin = true
            }
          end
        },
      }
    }

    local format_auto_group = vim.api.nvim_create_augroup("FormatAutogroup", {
      clear = false,
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      group = format_auto_group,
      pattern = {"*.rs"},
      command = "FormatWrite",
      desc = "Format *.rs files on save.",
    })
  end
}
