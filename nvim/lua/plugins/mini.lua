return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.pairs').setup()
    local statusline = require 'mini.statusline'
  end,
}
