return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local mocha = require('catppuccin.palettes').get_palette 'mocha'
    require('catppuccin').setup {
      transparent_background = true,
      flavour = 'mocha',
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

