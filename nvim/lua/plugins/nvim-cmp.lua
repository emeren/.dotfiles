return {
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile',
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local luasnip = require 'luasnip'
      local cmp = require 'cmp'
      require('luasnip.loaders.from_vscode').lazy_load {}

      -- Custom function to check if the line is empty
      local function is_empty_line()
        local line = vim.api.nvim_get_current_line()
        return line:match '^%s*$' ~= nil
      end

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {
            config = {
              sources = {
                { name = 'nvim_lsp' },
              },
            },
          },
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm {
                  select = true,
                }
              end
            else
              fallback()
            end
          end),
          -- ['<Tab>'] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif luasnip.locally_jumpable(1) then
          --     luasnip.jump(1)
          --   else
          --     fallback()
          --   end
          -- end, { 'i', 's' }),

          --   ['<S-Tab>'] = cmp.mapping(function(fallback)
          --     if cmp.visible() then
          --       cmp.select_prev_item()
          --     elseif luasnip.locally_jumpable(-1) then
          --       luasnip.jump(-1)
          --     else
          --       fallback()
          --     end
          --   end, { 'i', 's' }),
        },
        sources = {
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'cmdline' },
          { name = 'luasnip' },
          { max_item_count = 10 },
        },
      }
    end,
  },
}
