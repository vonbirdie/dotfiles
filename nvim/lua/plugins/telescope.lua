
vim.api.nvim_set_keymap("", "<c-o>", "<cmd>lua require('telescope.builtin').resume()<cr>", {})

vim.api.nvim_set_keymap("", "<c-h>", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {})
vim.api.nvim_set_keymap("", "<c-k>", "<cmd>lua require('telescope.builtin').keymaps()<cr>", {})

vim.api.nvim_set_keymap("", "<space>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
vim.api.nvim_set_keymap("", "<space>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})
vim.api.nvim_set_keymap("", "<space>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", {})
vim.api.nvim_set_keymap("", "<space>fm", "<cmd>lua require('telescope.builtin').marks()<cr>", {})

vim.api.nvim_set_keymap("", "gD", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", {})
vim.api.nvim_set_keymap("", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", {})
vim.api.nvim_set_keymap("", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", {})
vim.api.nvim_set_keymap("", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", {})

vim.api.nvim_set_keymap("", "<space>ca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", {})
vim.api.nvim_set_keymap("", "<space>cd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", {})

