
return {
  'dracula/vim',

  name = 'dracula',

  lazy = false,
  priority = 1000,

  init = function()
    vim.cmd[[colorscheme dracula]]
  end,
}

