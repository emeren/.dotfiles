return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Personal',
        path = '~/Notes',
      },
    },
    daily_notes = {
      folder = '/DailyNotes',
      default_tags = { 'daily-notes' },
      template = nil,
    },
    templates = {
      folder = 'Templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
    },
    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.title)
      return path:with_suffix '.md'
    end,
    disable_frontmatter = false,

    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      local datetime = os.date '%Y-%m-%d %H:%M:%S'

      local out = {
        id = note.id,
        datetime = datetime,
        date = note.date,
        tags = note.tags,
        aliases = note.aliases,
      }

      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,

    vim.keymap.set('n', '<leader>od', ':ObsidianDailies<CR>', { desc = '[O]bsidian [N]ote' }),
    vim.keymap.set('n', '<leader>ot', ':ObsidianTags<CR>', { desc = '[O]bsidian [N]ote' }),
    vim.keymap.set('n', '<leader>on', ':ObsidianNewFromTemplate<CR>', { desc = '[O]bsidian [N]ote' }),
    vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<CR>', { desc = '[O]bsidian [N]ote' }),
    vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', { desc = '[O]bsidian [N]ote' }),
  },
}
