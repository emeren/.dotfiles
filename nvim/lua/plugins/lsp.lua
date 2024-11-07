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
            vim.diagnostic.open_float {}
            vim.lsp.buf.hover()
          end
          vim.keymap.set('n', 'K', show_diagnostics_and_hover, { desc = 'Show diagnostics and hover information' })

          opts.desc = 'Restart LSP'
          keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
        end,
      })

      -- Configure LSP capabilities for autocompletion
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Diagnostic symbols in the gutter

      local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      local function filter(arr, fn)
        if type(arr) ~= 'table' then
          return arr
        end

        local filtered = {}
        for k, v in pairs(arr) do
          if fn(v, k, arr) then
            table.insert(filtered, v)
          end
        end

        return filtered
      end

      local function filterReactDTS(value)
        return string.match(value.uri, 'react/index.d.ts') == nil
      end

      mason_lspconfig.setup_handlers {

        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
          }
        end,
        -- ['textDocument/definition'] = function(err, result, method, ...)
        --   if vim.tbl_islist(result) and #result > 1 then
        --     local filtered_result = filter(result, filterReactDTS)
        --     return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
        --   end
        --
        --   vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
        -- end,
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
    vim.keymap.set('n', '<leader>aD', '<cmd>Telescope diagnostics<CR>', { desc = 'Show all project diagnostics' }),
  },
}
