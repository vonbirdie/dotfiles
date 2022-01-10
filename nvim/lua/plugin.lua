
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use { 'dracula/vim', as = 'dracula' }

  -- nvim-cmp: completion engine plugin for neovim written in Lua.
  -- https://github.com/hrsh7th/nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  -- vim-vsnip: VSCode(LSP)'s snippet feature in vim and integration with
  -- nvim-cmp.
  -- https://github.com/hrsh7th/vim-vsnip
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'

  -- telescope: fuzzy file finder and integration with neovim.
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons', opt = true},
      {'nvim-treesitter/nvim-treesitter', opt = true},
    }
  }

  -- formatter: Runs formatters mapped by language.
  -- https://github.com/mhartington/formatter.nvim
  use 'mhartington/formatter.nvim'

  -- dap: Debugging in nvim via the Debug Adapter Protocol.
  -- https://github.com/mfussenegger/nvim-dap
  use 'mfussenegger/nvim-dap'

  --
  -- Evaluate
  --
  use 'neovim/nvim-lspconfig'
  use 'romgrk/nvim-treesitter-context'
  use 'kosayoda/nvim-lightbulb'
  use 'rafamadriz/friendly-snippets'
  use 'theHamsta/nvim-dap-virtual-text'

  use {
  'sudormrfbin/cheatsheet.nvim',

  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  }
}

  -- indent-blankline: displays indent guides using invisible characters.
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use 'lukas-reineke/indent-blankline.nvim'

  -- comment: Commenting functionality well integrated with neovim.
  -- https://github.com/numToStr/Comment.nvim
  use 'numToStr/Comment.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

