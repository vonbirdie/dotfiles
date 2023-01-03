
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
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("v", "/", "/\\v")

vim.opt.ignorecase = true                         -- Case-insensitive searching.
vim.opt.smartcase = true                          -- But case-sensitive if expression contains a capital letter.
vim.opt.gdefault = true                           -- Use global by default in substitutions
vim.opt.showmatch = true


--
-- Mappings
--
vim.g.mapleader = ","                             -- Set the leader key to ,

vim.keymap.set("", "<leader>tt", ":tabnew<cr>")
vim.keymap.set("", "<leader>tc", ":tabclose<cr>")
vim.keymap.set("", "<leader>tn", ":tabnext<cr>")
vim.keymap.set("", "<leader>tp", ":tabprevious<cr>")

vim.keymap.set("", "<leader>n", ":bn<cr>")
vim.keymap.set("", "<leader>bd", ":bd<cr>")

vim.keymap.set("", "<C-m>", ":w<CR>:make<CR>:cw<CR>")

vim.keymap.set("n", "<leader><space>", ":noh<cr>")
vim.keymap.set("n", "<tab>", "%")
vim.keymap.set("v", "<tab>", "%")

vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<down>", "")
vim.keymap.set("n", "<left>", "")
vim.keymap.set("n", "<right>", "")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")


--
-- Machine local
--
require("init_local")
