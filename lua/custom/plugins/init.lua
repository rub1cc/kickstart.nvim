-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'sindrets/diffview.nvim', -- optional - Diff integration
    config = function()
      require('diffview').setup {
        use_icons = false, -- Requires nvim-web-devicons
        view = {
          merge_tool = {
            layout = 'diff1_plain',
          },
        },
        file_panel = {
          listing_style = 'list', -- "list" | "tree",
        },
      }
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
  },
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_node_command = '~/.nvm/versions/node/v20.10.0/bin/node'
    end,
  },

  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'nordic'
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
  },

  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm ci && npm run build',
    config = true,
  },
}
