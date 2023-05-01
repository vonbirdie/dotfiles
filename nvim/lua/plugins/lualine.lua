
return {
  'nvim-lualine/lualine.nvim',

  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },

  lazy = false,

  opts = {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diagnostics'},
      lualine_c = {},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    tabline = {
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {{'filename', path = 1}},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'}
    }
  }
}
