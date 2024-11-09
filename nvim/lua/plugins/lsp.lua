return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh8th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Import lspconfig plugin
      local lspconfig = require 'lspconfig'

      lspconfig.lsp_definitions = {
        file_ignore_patterns = { 'index.d.ts' },
      }
      local _border = 'single'

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        virtual_text = {
          spacing = 40,
        },
        border = 'rounded',
      })

      vim.lsp.handlers['textDocument/diagnostic'] = vim.lsp.with(vim.lsp.diagnostic.on_diagnostic, {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = {
          spacing = 40,
        },
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        signs = function(namespace, bufnr)
          return vim.b[bufnr].show_signs == true
        end,
        -- Disable a feature
        update_in_insert = false,
      })

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = _border,
      })

      vim.diagnostic.config {
        float = { border = _border },
      }
      -- Configure diagnostics
      vim.diagnostic.config {
        virtual_text = false, -- Disable inline text to avoid clutter
        signs = true, -- Use signs in the margin
        float = { border = 'rounded' }, -- Rounded borders for diagnostic popups
      }

      -- Import mason_lspconfig and cmp-nvim-lsp plugins
      local mason_lspconfig = require 'mason-lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      -- Key mappings and on-attach settings
      local keymap = vim.keymap -- for conciseness

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          -- Key mappings for LSP actions
          opts.desc = 'Show LSP references'
          keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

          opts.desc = 'Go to declaration'
          keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

          opts.desc = 'Show LSP definitions'
          keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

          -- opts.desc = 'Show LSP implementations in a vertical split'
          -- keymap.map('n', 'gs', ':vsplit | lua vim.lsp.buf.definition()', opts)

          opts.desc = 'Show LSP implementations'
          keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

          opts.desc = 'Show LSP type definitions'
          keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

          opts.desc = 'See available code actions'
          keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

          opts.desc = 'Smart rename'
          keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

          opts.desc = 'Show buffer diagnostics'
          keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

          opts.desc = 'Show line diagnostics'
          keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

          opts.desc = 'Go to previous diagnostic'
          keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

          opts.desc = 'Go to next diagnostic'
          keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

          -- Modify the 'K' key to open diagnostics in a floating window like in VSCode
          opts.desc = 'Show diagnostics in popup'
          local function show_diagnostics_and_hover()
            vim.diagnostic.open_float {
              border = _border,
            }
            vim.lsp.buf.hover()
          end
          vim.keymap.set('n', 'K', show_diagnostics_and_hover, { desc = 'Show diagnostics and hover information' })

          opts.desc = 'Restart LSP'
          keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
        end,
      })

      vim.diagnostic.config {
        float = {
          border = 'rounded', -- Możliwe wartości: 'single', 'double', 'solid', 'rounded', itp.
          max_width = 60, -- Zwiększ lub zmniejsz szerokość okna dla efektu paddingu
          max_height = 20, -- Dostosuj wysokość, aby uzyskać więcej przestrzeni
        },
      }

      -- Configure LSP capabilities for autocompletion
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Diagnostic symbols in the gutter

      local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      mason_lspconfig.setup_handlers {
        lspconfig['tailwindcss'].setup {
          capabilities = capabilities,
          border = 'rounded',
        },
        lspconfig['eslint'].setup {
          capabilities = capabilities,
        },
        lspconfig['ts_ls'].setup {
          capabilities = capabilities,
        },
        ['emmet_ls'] = function()
          lspconfig['emmet_ls'].setup {
            capabilities = capabilities,
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
          }
        end,
        ['lua_ls'] = function()
          lspconfig['lua_ls'].setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { 'vim' } },
              },
            },
          }
        end,
      }
    end,
    vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { desc = 'Show all project diagnostics' }),
    vim.keymap.set('n', 'gw', function()
      vim.cmd 'vsplit'
      vim.lsp.buf.definition()
    end, { noremap = true, silent = true }),
  },
}
