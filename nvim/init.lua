
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--
-- BASIC SETTINGS
--
vim.opt.directory = "~/tmp//"                     -- Keep swap files in one location
vim.opt.undodir = "~/tmp//"                       -- Keep undo files in one location

--
-- Plugins
--



--
-- DISPLAY
--
vim.opt.cursorline = true                         -- Highlight the current line
vim.opt.number = true                             -- Show line numbers.
vim.opt.relativenumber = true                     -- Show line numbers relative to current line.
vim.opt.ruler = true                              -- Show cursor position.
vim.opt.scrolloff = 10                            -- Show N lines of context around the cursor.

-- Colorscheme 


--
-- FORMATTING
--
vim.opt.tabstop = 2                               -- Global tab width.
vim.opt.shiftwidth = 2                            -- And again, related.
vim.opt.expandtab = true                          -- Use spaces instead of tabs
vim.opt.autoindent = true                         -- Indent new lines

vim.opt.backspace = {"indent", "eol", "start"}    -- Intuitive backspacing.

vim.opt.pastetoggle = "<F2>"

--
-- STATUS LINE
--
vim.opt.laststatus = 2                            -- Always show the status line

vim.opt.statusline = "%f%y [%c,%l]"

--
-- OTHER
--
vim.opt.wildmenu = true                           -- Enhanced command line completion.
vim.opt.wildmode = "list:longest"                 -- Complete files like a shell.

--
-- Search & Replace
--
-- Give VIM some sane regex matching
map("n", "/", "/\\v")
map("v", "/", "/\\v")

vim.opt.ignorecase = true                         -- Case-insensitive searching.
vim.opt.smartcase = true                          -- But case-sensitive if expression contains a capital letter.
vim.opt.incsearch = true                          -- Highlight matches as you type.
vim.opt.hlsearch = true                           -- Highlight matches.
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

map("", "<C-c>", "+y<CR>")

map("n", "<leader><space>", ":noh<cr>")
map("n", "<tab>", "%")
map("v", "<tab>", "%")

map("n", "<up>", "")
map("n", "<down>", "")
map("n", "<left>", "")
map("n", "<right>", "")
map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<c-p>", ":Files<cr>")
map("n", "<c-o>", ":Buffers<cr>")
map("n", "<c-i>", ":Ag<cr>")

--
-- Machine local
--

