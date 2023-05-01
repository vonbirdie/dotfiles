-- Evaluating as of 13/04/23.

return {
  'ggandor/leap.nvim',

  lazy = false,

  config = function()
    require('leap').add_default_mappings()
  end
}
