-- Contains plugins that require no config

return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',                lazy = true },

  -- Add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', },
}
