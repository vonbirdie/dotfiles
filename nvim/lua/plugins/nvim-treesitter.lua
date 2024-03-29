
return {
  'nvim-treesitter/nvim-treesitter',

  build = ':TSUpdate' ,

  lazy = false,

  opts = {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
      'bash',
      'beancount',
      'c',
      'cpp',
      'css',
      'diff',
      'dockerfile',
      'dot',
      'fish',
      'gitcommit',
      'go',
      'html',
      'java',
      'javascript',
      'jsdoc',
      'json',
      'kotlin',
      'lua',
      'markdown',
      'markdown_inline',
      'proto',
      'python',
      'regex',
      'rust',
      'scss',
      'sql',
      'starlark',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true
    },
  }
}

