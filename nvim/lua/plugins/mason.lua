return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      local mason = require 'mason'

      -- enable mason and configure icons
      mason.setup {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      }

      local mason_lspconfig = require 'mason-lspconfig'
      mason_lspconfig.setup {
        -- list of servers for mason to install
        ensure_installed = {
          -- 'tsserver',
          'html',
          'css_variables',
          'tailwindcss',
          'svelte',
          'lua_ls',
          'graphql',
          'emmet_ls',
          'prismals',
          'pyright',
          'jdtls',
        },
      }

      local mason_tool_installer = require 'mason-tool-installer'
      mason_tool_installer.setup {
        ensure_installed = {
          'prettierd', -- prettier formatter
          'stylua', -- lua formatter
          'isort', -- python formatter
          'black', -- python formatter
          'pylint',
          'eslint_d',
        },
      }
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
      -- ensure the java debug adapter is installed
      require('mason-nvim-dap').setup {
        ensure_installed = { 'java-debug-adapter', 'java-test' },
      }
    end,
  },
}
