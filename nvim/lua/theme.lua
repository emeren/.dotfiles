return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local mocha = require('catppuccin.palettes').get_palette 'mocha'
    require('catppuccin').setup {
      transparent_background = true,
      flavour = 'macchiato',
      default_integrations = true,
      integrations = {
        cmp = true,
        hop = true,
        harpoon = true,
        gitsigns = true,
        neotree = true,
        mason = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
      custom_highlights = {
        NormalFloat = { fg = mocha.text, bg = '#000000' },
        ['@tag.builtin.tsx'] = { fg = mocha.peach },
        ['@tag.tsx'] = { fg = mocha.yellow },
      },
    }
  end,
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}
