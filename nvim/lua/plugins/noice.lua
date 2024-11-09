return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    background_colour = '#000000',
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        type = 'default',
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      cmdline = {
        enabled = true,
        view = 'cmdline',
        format = {
          -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          -- view: (default is cmdline view)
          -- opts: any options passed to the view
          -- icon_hl_group: optional hl_group for the icon
          -- title: set to anything or empty string to hide
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
          search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
          filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
          lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
          help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
          input = { view = 'cmdline_input', icon = '󰥻 ' }, -- Used by input()
          -- lua = false, -- to disable a format, set to `false`
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
              { find = '%d+ fewer lines' },
              { find = '%d+ lines changed' },
              { find = '%d+ more lines' },
              { find = '%d+ lines yanked' },
              { find = 'search hit %a+, continuing at %a+' },
              { find = '%d+ lines <ed %d+ time' },
              { find = '%d+ lines >ed %d+ time' },
              { find = '%d+ substitutions on %d+ lines' },
              { find = 'Hunk %d+ of %d+' },
              { find = '%-%-No lines in buffer%-%-' },
              { find = '^E486: Pattern not found' },
              { find = '^Word .*%.add$' },
              { find = '^E486' },
              { find = '^E42' },
              { find = '^E776' },
              { find = '^E348' },
              { find = '^W325' },
              { find = '^E1513' },
              { find = '^E553' },
              { find = 'E211: File .* no longer available' },
              { find = 'No more valid diagnostics to move to' },
              { find = 'No code actions available' },
            },
          },
          view = 'mini',
        },
        -- {
        --   filter = {
        --     event = 'msg_show',
        --     find = 'neo%-tree',
        --   },
        --   opts = { skip = false },
        -- },
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = '%d+L, %d+B',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            kind = 'search_count',
          },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          border = { style = vim.g.border_style },
        },
        mini = {
          timeout = 3000,
          zindex = 10,
          position = { col = -3 },
          format = { '{title} ', '{message}' },
        },
        hover = {
          border = { style = vim.g.borde_style },
          size = { max_width = 80 },
          win_options = { scrolloff = 4, wrap = true },
        },
        popup = {
          border = { style = vim.g.borde_style },
          size = { width = 90, height = 25 },
          win_options = { scrolloff = 8, wrap = true, concealcursor = 'nv' },
          close = { keys = { 'q' } },
        },
        split = {
          enter = true,
          size = '50%',
          win_options = { scrolloff = 6 },
          close = { keys = { 'q' } },
        },
        notify = {
          render = 'minimal',
        },
      },
    }
    require('notify').setup {
      top_down = true,
      fps = 60,
      max_height = 5,
      timeout = 2000,
      max_width = 80,
      background_colour = '#000000',
    }
  end,
}
