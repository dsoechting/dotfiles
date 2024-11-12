return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    }
  },
  config = function()
    local telescope = require("telescope")
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    telescope.setup({
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end
        },
      },
      defaults = {
        mappings = {
          i = {
            ['<C-j>'] = "move_selection_next",
            ['<C-k>'] = "move_selection_previous",
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      }
    })
    telescope.load_extension("fzf")
    telescope.load_extension("harpoon")
    telescope.load_extension("live_grep_args")
  end
}
