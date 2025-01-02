return {
  "ibhawan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = function(_, opts)
    local config = require("fzf-lua.config")
    local actions = require("fzf-lua.actions")
    local trouble_actions = require("trouble.sources.fzf").actions
    config.defaults.actions.files["ctrl-t"] = trouble_actions.open
    return {
      grep = {
        actions = {
          ["ctrl-h"] = { actions.toggle_hidden }
        }
      },
      files = {
        actions = {
          ["ctrl-h"] = { actions.toggle_hidden }
        },
      },
    }
  end
}
