local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>tf', telescope.find_files, { desc = "Telescope - Find Files" })
vim.keymap.set('n', '<leader>tg', telescope.live_grep, { desc = "Telescope - Live Grep" })
vim.keymap.set('n', '<leader>tb', telescope.buffers, { desc = "Telescope - Buffers" })
vim.keymap.set('n', '<leader>th', telescope.help_tags, { desc = "Telescope - Help Tags" })
