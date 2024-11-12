-- Contains plugins that require no config

return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'rktjmp/lush.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  "christoomey/vim-tmux-navigator",

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',                lazy = true },

  -- Add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', },
}
