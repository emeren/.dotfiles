--
-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>', { silent = true })

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    close_if_last_window = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      neotree = true,
      notify = true,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
    },
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
      window = {
        position = 'right',
        mappings = {
          -- ["<C-r"] = "rename",
          -- ["N"] = "add_directory", -- see 'n'
          -- ["n"] = "add", -- Create new (file). nnn would ask for 'file', 'dir' and symlinks
          ['.'] = 'toggle_hidden',
          --            ["<C-o>"] = "open_nofocus", -- Cant use "L" since its used to go back to the code buffer
          ['<C-t>'] = { 'show_help', nowait = false, config = { title = 'Sort toggles', prefix_key = 't' } }, -- Mimic nnn dialog
          ['<C-x>'] = 'cut_to_clipboard', -- Delete
          ['H'] = 'set_root',
          ['f'] = 'show_file_details', -- File details
          ['h'] = 'parent_or_close',
          ['n'] = { 'show_help', nowait = false, config = { title = 'Create new', prefix_key = 'n' } }, -- Mimic nnn dialog
          ['A'] = { 'add_directory', nowait = false },
          ['a'] = { 'add', nowait = false },
          ['r'] = 'rename', -- Lazy rename. Since neo-tree doesn't have a batch rename function.
          ['td'] = { 'order_by_diagnostics', nowait = false }, -- Not in nnn
          ['te'] = { 'order_by_type', nowait = false }, -- File extension
          ['tg'] = { 'order_by_git_status', nowait = false }, -- Not in nnn
          ['tm'] = { 'order_by_modified', nowait = false },
          ['tn'] = { 'order_by_name', nowait = false },
          ['ts'] = { 'order_by_size', nowait = false },
          ['tt'] = { 'order_by_created', nowait = false },
          ['x'] = 'delete', -- Delete
        },
      },
    },
    window = {
      mappings = {
        ['<C-l>'] = '',
        ['<C-r>'] = 'rename', -- Rename
        -- ["R"] = "copy", -- To mimic nnn duplicate (C-R)
        ['h'] = 'close_node',
        ['l'] = 'open',
        ['h'] = 'close',
      },
    },
  },
}
