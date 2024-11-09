return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoons list',
    },
    {
      '<leader>A',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Add harpoon',
    },
    {
      '<C-1>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<C-2>',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<C-3>',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<C-4>',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<C-5>',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = 'which_key_ignore',
    },
    {
      '<C-6>',
      function()
        require('harpoon'):list():select(6)
      end,
      desc = 'which_key_ignore',
    },
  },
}
