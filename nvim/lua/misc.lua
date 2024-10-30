vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    vim.lsp.buf.format()
  end,
})

--[[ vim.api.nvim_buf_set_extmark(0, vim.api.nvim_create_namespace 'padding', 0, 0, {
  virt_text = { { ' ', 'Normal' } },
  virt_text_pos = 'overlay',
  hl_mode = 'combine',
  priority = 10,
})

vim.api.nvim_buf_set_extmark(0, vim.api.nvim_create_namespace 'padding', vim.fn.line '$', 0, {
  virt_text = { { ' ', 'Normal' } },
  virt_text_pos = 'overlay',
  hl_mode = 'combine',
  priority = 10,
}) ]]
