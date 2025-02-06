return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      tsserver_max_memory = 8192,
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact", "typescript" },
      }
    }
  },
  config = function()
    require("typescript-tools").setup {
      on_attach =
          function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
      -- settings = {
      --   tsserver_max_memory = 8192,
      --   jsx_close_tag = {
      --     enable = true,
      --     filetypes = { "javascriptreact", "typescriptreact", "typescript" },
      --   }
      -- }
    }
  end
}
