require 'options'
require 'keymaps'
require 'misc'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end

vim.opt.rtp:prepend(lazypath)
vim.opt.formatoptions:remove { 'c', 'r', 'o' }

require('lazy').setup {
  require 'theme',
  'tpope/vim-sleuth',
  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    opts = {},
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  require 'plugins.git',
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { 'mbbill/undotree' },
  -- require 'plugins.startup',
  require 'plugins.todo-comments',
  require 'plugins.obsidian',
  require 'plugins.git',
  require 'plugins.ai',
  require 'plugins.mason',
  require 'plugins.lsp',
  require 'plugins.telescope',
  require 'plugins.conform',
  require 'plugins.nvim-cmp',
  require 'plugins.nvim-treesitter',
  require 'plugins.neo-tree',
  require 'plugins.mini',
  require 'plugins.noice',
  require 'plugins.harpoon',
  require 'plugins.multi-cursor',
  require 'plugins.which-key',
  require 'plugins.toggleterm',
  require 'plugins.hop',
  require 'plugins.nvim-tmux-navigation',
}
