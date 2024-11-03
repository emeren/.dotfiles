return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<c-\>]],
    },
    config = function()
      local Terminal = require('toggleterm.terminal').Terminal
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      vim.keymap.set('t', '<esc>', 'print "hello"', { buffer = 0 })
      vim.keymap.set('t', '<Esc>', 'print "hello"', { buffer = 0 })

      require('toggleterm').setup {
        terminal_mappings = false,
        open_mapping = [[<leader>j]],
        vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()',
      }

      local vertical = Terminal:new {
        direction = 'vertical',
        on_open = function(self)
          self:resize(80)
        end,
      }
      local horizontal = Terminal:new {
        direction = 'horizontal',
        on_open = function(self)
          self:resize(12)
        end,
      }
      vim.keymap.set({ 't', 'n' }, '<leader>j', function()
        horizontal:toggle()
      end)

      vim.keymap.set({ 't', 'n' }, '<leader>]', function()
        vertical:toggle()
      end)
    end,
  },
}
