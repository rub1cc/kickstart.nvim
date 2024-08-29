-- set relative number
vim.opt.relativenumber = true

-- personal overrides
vim.keymap.set('i', 'kk', '<Esc>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', ';', ':')

-- Formatting
vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format { async = true, lsp_fallback = true, range = range }
end, { range = true })

-- create user command :Diff that runs :DiffviewOpen
vim.api.nvim_create_user_command('Diff', function()
  require('diffview').open { file_panel = { width = 35 } }
end, { nargs = 0 })

vim.keymap.set('n', '<leader>fm', ':Format<CR>', { desc = '[F]or[m]at' })

-- launch Neotree on startup
vim.cmd 'autocmd VimEnter * Neotree'

-- keymap for tab
vim.keymap.set('n', '<leader>x', ':tabclose<CR>', { desc = 'Tab Close' })
vim.keymap.set('n', 'tn', ':tabnext<CR>', { desc = '[T]ab [N]ext' })
vim.keymap.set('n', 'tp', ':tabprevious<CR>', { desc = '[T]ab [P]revious' })

-- neogit
vim.keymap.set('n', '<leader>ng', ':Neogit<CR>', { desc = 'Open [N]eo[g]it' })
