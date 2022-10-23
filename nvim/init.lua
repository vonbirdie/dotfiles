
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


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

-- Colorscheme
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
map("n", "/", "/\\v")
map("v", "/", "/\\v")

vim.opt.ignorecase = true                         -- Case-insensitive searching.
vim.opt.smartcase = true                          -- But case-sensitive if expression contains a capital letter.
vim.opt.gdefault = true                           -- Use global by default in substitutions
vim.opt.showmatch = true


--
-- Mappings
--
vim.g.mapleader = ","                             -- Set the leader key to ,

map("", "<leader>tt", ":tabnew<cr>")
map("", "<leader>tc", ":tabclose<cr>")
map("", "<leader>tn", ":tabnext<cr>")
map("", "<leader>tp", ":tabprevious<cr>")

map("", "<leader>n", ":bn<cr>")
map("", "<leader>bd", ":bd<cr>")

map("", "<C-m>", ":w<CR>:make<CR>:cw<CR>")

map("n", "<leader><space>", ":noh<cr>")
map("n", "<tab>", "%")
map("v", "<tab>", "%")

map("n", "<up>", "")
map("n", "<down>", "")
map("n", "<left>", "")
map("n", "<right>", "")
map("n", "j", "gj")
map("n", "k", "gk")


--
-- Machine local
--
require("init_local")
