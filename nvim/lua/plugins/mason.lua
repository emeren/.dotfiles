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
          'prettierd',
          'tailwindcss-language-server',
          'typescript-language-server',
          'html',
          'css_variables',
          'tailwindcss',
          'lua_ls',
          'emmet_ls',
          'prismals',
          'json-lsp',
          'eslint-lsp',
          'ts_ls',
        },
      }

      local mason_tool_installer = require 'mason-tool-installer'
      mason_tool_installer.setup {
        ensure_installed = {
          'prettierd', -- prettier formatter
          'stylua', -- lua formatter
          'eslint-lsp', -- eslint formatter
        },
      }
    end,
  },
}
