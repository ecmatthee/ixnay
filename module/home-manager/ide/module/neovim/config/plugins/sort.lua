require("sort").setup()

vim.keymap.set('n', '<leader>ss', "<Cmd>Sort<CR>", { desc = "Sort - Case Sensitive" })
vim.keymap.set('n', '<leader>si', "<Cmd>Sort i<CR>", { desc = "Sort - Case Insensitive" })
vim.keymap.set('n', '<leader>su', "<Cmd>Sort u<CR>", { desc = "Sort - Remove Duplicants" })
vim.keymap.set('n', '<leader>ss', "<Esc><Cmd>Sort<CR>", { desc = "Sort - Case Sensitive" })
vim.keymap.set('n', '<leader>si', "<Esc><Cmd>Sort i<CR>", { desc = "Sort - Case Insensitive" })
vim.keymap.set('n', '<leader>su', "<Esc><Cmd>Sort u<CR>", { desc = "Sort - Remove Duplicants" })
