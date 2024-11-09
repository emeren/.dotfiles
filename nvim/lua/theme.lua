return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
    local mocha = require('catppuccin.palettes').get_palette 'mocha'
    require('catppuccin').setup {
      transparent_background = false,
      flavour = 'mocha',
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
        telescope = {
          enabled = true,
        },
        noice = true,
        notify = false,
        mini = {
          enabled = true,
        },
      },
      custom_highlights = {
        NormalFloat = { fg = mocha.text, bg = '#181825' },
        ['@tag.builtin.tsx'] = { fg = mocha.peach },
        ['@tag.tsx'] = { fg = mocha.yellow },
      },
    }
  end,

  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}
