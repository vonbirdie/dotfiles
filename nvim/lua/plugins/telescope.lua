
vim.keymap.set("", "<c-o>", "<cmd>lua require('telescope.builtin').resume()<cr>")

vim.keymap.set("", "<c-h>", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
vim.keymap.set("", "<c-k>", "<cmd>lua require('telescope.builtin').keymaps()<cr>")

vim.keymap.set("", "<space>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
vim.keymap.set("", "<space>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.keymap.set("", "<space>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
vim.keymap.set("", "<space>fm", "<cmd>lua require('telescope.builtin').marks()<cr>")

vim.keymap.set("", "gD", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>")
vim.keymap.set("", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
vim.keymap.set("", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
vim.keymap.set("", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")

vim.keymap.set("", "<space>ca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>")
vim.keymap.set("", "<space>cd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>")

