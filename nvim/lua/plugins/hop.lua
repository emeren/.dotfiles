return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    local hop = require 'hop'
    local directions = require('hop.hint').HintDirection
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    vim.keymap.set('', 'f', function()
      hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = true }
    end, { remap = true })
    vim.keymap.set('', 'F', function()
      hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = true }
    end, { remap = true })
    -- vim.keymap.set('', '<leader>t', function()
    --   hop.hint_words { current_line_only = false, hint_offset = -1 }
    -- end, { remap = true })
    -- vim.keymap.set('', '<leader>T', function()
    --   hop.hint_char1 { current_line_only = false, hint_offset = 1 }
    -- end, { remap = true })

    vim.cmd 'hi HopNextKey guifg=#52AD70'
    vim.cmd 'hi HopNextKey1 guifg=#52AD70'
    vim.cmd 'hi HopNextKey2 guifg=#52AD70'
  end,
}
