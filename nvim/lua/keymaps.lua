vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>w', '<cmd>:w<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep cursor in the same position when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
---

-- Split screen
vim.keymap.set('n', '<C-]>', ':vsplit<CR>', { noremap = false, silent = false })

vim.keymap.set('n', '<C-o>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- GIT
vim.keymap.set('n', '<leader>fh', ':Telescope git_bcommits<CR>', { desc = '[F]ile [H]istory' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', 'c', '"_c', { noremap = true, desc = 'Cut without copying to clipboard' })
vim.keymap.set('n', '<leader>w', '<cmd>bdelete<CR>', { desc = '[W] Close current buffer' })

-- Map Ctrl+/ to comment code
vim.api.nvim_set_keymap('n', '<C->>', '<leader>gc', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C->>', '<leader>gc', { noremap = true, silent = true })

-- Map Ctrl+S to save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Map Ctrl+W to close buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bwipeout<CR>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('W', 'w', {})

vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
