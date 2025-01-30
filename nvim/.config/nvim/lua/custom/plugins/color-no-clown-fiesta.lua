return {
  "aktersnurra/no-clown-fiesta.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local plugin = require "no-clown-fiesta"
    plugin.setup({
      styles = {
        type = { bold = true },
        lsp = { underline = false },
        match_paren = { underline = true },
      },
    })
    return plugin.load()
  end
}
