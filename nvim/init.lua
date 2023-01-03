
--
-- Plugins
--
require('plugin')
require('plugins')


--
-- DISPLAY
--
vim.opt.cursorline = true                         -- Highlight the current line
vim.opt.relativenumber = true                     -- Show line numbers relative to current line.
vim.opt.scrolloff = 10                            -- Show N lines of context around the cursor.

vim.opt.laststatus = 3

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd[[colorscheme dracula]]


--
-- FORMATTING
--
vim.opt.tabstop = 2                               -- Global tab width.
vim.opt.shiftwidth = 2                            -- And again, related.
vim.opt.expandtab = true                          -- Use spaces instead of tabs

vim.opt.backspace = {"indent", "eol", "start"}    -- Intuitive backspacing.

vim.opt.pastetoggle = "<F2>"


--
-- OTHER
--
vim.opt.completeopt = "menu,menuone,preview,noselect"


--
-- Search & Replace
--
-- Give VIM some sane regex matching
vim.api.nvim_set_keymap("n", "/", "/\\v", { noremap = true })
vim.api.nvim_set_keymap("v", "/", "/\\v", { noremap = true })

vim.opt.ignorecase = true                         -- Case-insensitive searching.
vim.opt.smartcase = true                          -- But case-sensitive if expression contains a capital letter.
vim.opt.gdefault = true                           -- Use global by default in substitutions
vim.opt.showmatch = true


--
-- Mappings
--
vim.g.mapleader = ","                             -- Set the leader key to ,

vim.api.nvim_set_keymap("", "<leader>tt", ":tabnew<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>tc", ":tabclose<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>tn", ":tabnext<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>tp", ":tabprevious<cr>", { noremap = true })

vim.api.nvim_set_keymap("", "<leader>n", ":bn<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>bd", ":bd<cr>", { noremap = true })

vim.api.nvim_set_keymap("", "<C-m>", ":w<CR>:make<CR>:cw<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader><space>", ":noh<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<tab>", "%", { noremap = true })
vim.api.nvim_set_keymap("v", "<tab>", "%", { noremap = true })

vim.api.nvim_set_keymap("n", "<up>", "", { noremap = true })
vim.api.nvim_set_keymap("n", "<down>", "", { noremap = true })
vim.api.nvim_set_keymap("n", "<left>", "", { noremap = true })
vim.api.nvim_set_keymap("n", "<right>", "", { noremap = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })


--
-- Machine local
--
require("init_local")
