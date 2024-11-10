local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      -- flavour = "macchiato", -- latte, frappe, macchiato, mocha
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      -- background = {   -- :h background
      --   light = "latte",
      --   dark = "mocha",
      -- },
      no_italic = true,    -- Force no italic
      no_bold = true,      -- Force no bold
      no_underline = true, -- Force no underline
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        mason = true,
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        notify = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
      color_overrides = {
        mocha = {
          base = "#1C1E26",
          blue = "#70B0FF",
          green = "#64D1A9",
          yellow = "#FFD88C",
          peach = "#FAB795",
          pink = "#F3C1FF",
          sapphire = "#34D3FB",
          mauve = "#B877DB"
        }
      },
      custom_highlights = function(colors)
        return {
          ["@type.java"] = { fg = colors.green },
          ["@variable.member.java"] = { fg = colors.sapphire },
          ["@variable.builtin.java"] = { fg = colors.mauve },
          ["@variable.java"] = { fg = colors.text },
          ["@function.method.call.java"] = { fg = colors.peach },
          ["@lsp.type.method.java"] = { fg = colors.peach },




          ["@function.tsx"] = { fg = colors.blue },
          Include = { fg = colors.mauve, style = { "italic" } },
          Type = { fg = colors.green },
          Constant = { fg = colors.sapphire, style = { "italic " } },
          ["@tag.tsx"] = { fg = colors.green, style = { "bold" } },
          ["@tag.attribute.tsx"] = { fg = colors.peach },
          ["@variable"] = { fg = colors.yellow, style = { "italic" } },
          ["@variable.member.tsx"] = { fg = colors.sapphire, style = { "italic" } },
          ["@property"] = { fg = colors.sapphire, style = { "italic" } },
          ["@parameter"] = { fg = colors.pink, style = { "italic" } },
          ["@variable.parameter"] = { fg = colors.pink, style = { "italic" } },
          ["@keyword.tsx"] = { fg = colors.mauve, style = { "italic" } },
          ["@type.builtin.tsx"] = { fg = colors.mauve, style = { "italic" } },
          ["@type.builtin"] = { fg = colors.green, style = { "italic" } },
          ["@constant.builtin.tsx"] = { fg = colors.mauve, style = { "italic" } },
          ["@keyword.export.tsx"] = { fg = colors.mauve, style = { "italic" } },

          ["@lsp.type.enum.typescriptreact"] = { fg = colors.yellow },
          ["@lsp.type.interface"] = { fg = colors.green, style = { "italic" } },
          ["@lsp.type.member.typescriptreact"] = { fg = colors.sapphire, style = { "italic" } },
          ["@lsp.typemod.parameter.declaration.typescriptreact"] = { fg = colors.pink },
          ["@lsp.typemod.function.local.typescriptreact"] = { fg = colors.text },
          ["@lsp.typemod.variable.local.typescriptreact"] = { fg = colors.text },
        }
      end
    })

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
  priority = 1000
}
local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day",    -- The theme is used when the background is set to light
      transparent = true,     -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent",       -- style for sidebars, see below
        floats = "dark",                -- style for floating windows
      },
      sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false,             -- dims inactive windows
      lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors) end,
    })
    vim.cmd [[colorscheme tokyonight]]
  end,
  opts = {},
}
-- return palenightfall
-- return rosePine
-- return catppuccin
return tokyonight
