return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ["<C-h>"] = false,
      ["<C-l>"] = false,
    },
    view_options = {
      show_hidden = true,
    }
  },
  -- Optional dependencies
  dependencies = { "echasnovski/mini.icons" },
}
