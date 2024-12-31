-- "C-/" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  opts = {
    toggler = {
      line = '<C-/>'
      -- line = '<C-_>'
    },
    opleader = {
      line = '<C-/>'
      -- line = '<C-_>'
    }
  }
}
