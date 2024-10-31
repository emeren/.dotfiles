return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>A',
      function()
        require('harpoon'):list():append()
      end,
      desc = 'Harpoons list',
    },
    {
      '<leader>a',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Add harpoon',
    },
    {
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<leader>5',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = 'which_key_ignore',
    },
  },
}
