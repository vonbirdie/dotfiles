--
-- DISPLAY
--
vim.opt.cursorline = true                         -- Highlight the current line
vim.opt.relativenumber = true                     -- Show line numbers relative to current line.
vim.opt.scrolloff = 10                            -- Show N lines of context around the cursor.
vim.opt.signcolumn = 'yes:1'                   -- Always keep at least 1 sign column but allow max 2.

vim.opt.laststatus = 3

vim.opt.updatetime = 250                          -- Write swap and trigger CursorHold event after this many ms.

-- Colorscheme
vim.opt.termguicolors = true


--
-- FORMATTING
--
vim.opt.tabstop = 2                               -- Global tab width.
vim.opt.shiftwidth = 2                            -- And again, related.
vim.opt.expandtab = true                          -- Use spaces instead of tabs

vim.opt.backspace = {"indent", "eol", "start"}    -- Intuitive backspacing.


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
-- Diagnostics
--
vim.diagnostic.config({
  severity_sort = true,
  float = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
    border = 'rounded',
    source = 'always',
    prefix = ' ',
    scope = 'cursor',
  }
})

local signs = { Error = " ", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


--
-- Plugins
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  defaults = {
    -- Load everything lazily by default. Anything not compliant should opt out
    -- by setting `lazy = false` in their spec.
    lazy = true,
  },
  install = {
    colorscheme = { "dracula" }
  },
  performance = {
    rtp = {
      -- Never use these bundled plugins so disable them to save a few
      -- milliseconds.
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})


--
-- Machine local
--
require("init_local")

