-- Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indent
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

-- Text Wrapping
vim.opt.textwidth = 80
vim.opt.wrap = true
vim.opt.tw = 0
vim.opt.showbreak = "+++"
vim.opt.linebreak = true

-- Brackets
vim.opt.showmatch = false
vim.opt.matchtime = 0

-- Theme
vim.g.termguicolors = true
vim.opt.termguicolors = true

-- Spell
-- vim.opt.spell = true
-- vim.opt.spelllang = { "en", "cjk" }

-- Autocmd
-- vim.api.nvim_exec([[ autocmd BufWritePre * :%s/\s\+$//e ]], false)
