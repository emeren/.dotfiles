vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.pumheight = 10
vim.opt.relativenumber = false
vim.opt.list = false
vim.opt.tabstop = 2
vim.opt.cmdheight = 0
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.conceallevel = 1
vim.opt_local.conceallevel = 1

vim.api.nvim_set_hl(0, 'Cursor', { fg = 'black', bg = 'white' })

vim.opt.swapfile = false

vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
