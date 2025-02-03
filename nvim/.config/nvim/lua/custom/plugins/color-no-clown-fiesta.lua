return {
  "aktersnurra/no-clown-fiesta.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local plugin = require "no-clown-fiesta"
    plugin.setup({
      transparent = true,
      styles = {
        lsp = { underline = false },
        type = { bold = true },
        match_paren = { underline = true },
      },
    })
    return plugin.load()
  end
}
