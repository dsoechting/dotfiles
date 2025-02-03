-- Pull in the wezterm API
local wezterm = require "wezterm"
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- local theme = 'Black Metal (Gorgoroth) (base16)'
local theme = "Black Metal (Immortal) (base16)"
-- local theme = 'Tokyo Night'
config.color_scheme = theme

local colors = wezterm.color.get_builtin_schemes()[theme]
config.window_background_image = '/Users/dsoechting/.config/wezterm/images/interstellar.jpg'
-- config.window_background_image = './wezterm/images/interstellar.jpg'
config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.005,
}

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono")
-- config.font = wezterm.font("Iosevka Nerd Font Mono")
-- config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 23
config.line_height = 1.1
config.audible_bell = "Disabled"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.max_fps = 120

config.window_decorations = "RESIZE"

-- Workspace switcher
workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"
local workspace_rg_filter = " | /opt/homebrew/bin/rg -e '/repos/' -e 'dsoechting/dotfiles'"
workspace_switcher.workspace_formatter = function(label)
  return wezterm.format({
    { Attribute = { Italic = true } },
    { Foreground = { Color = colors.ansi[3] } },
    { Background = { Color = colors.background } },
    { Text = "󱂬 : " .. label },
  })
end

-- tmux
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    mods = "LEADER",
    key = "c",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
    mods = "LEADER",
    key = "x",
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    mods = "LEADER",
    key = "l",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  {
    mods = "LEADER",
    key = "j",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
    mods = "LEADER",
    key = "H",
    action = wezterm.action.AdjustPaneSize { "Left", 5 }
  },
  {
    mods = "LEADER",
    key = "L",
    action = wezterm.action.AdjustPaneSize { "Right", 5 }
  },
  {
    mods = "LEADER",
    key = "J",
    action = wezterm.action.AdjustPaneSize { "Down", 5 }
  },
  {
    mods = "LEADER",
    key = "K",
    action = wezterm.action.AdjustPaneSize { "Up", 5 }
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.PromptInputLine {
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = "s",
    mods = "LEADER",
    action = workspace_switcher.switch_workspace({ extra_args = workspace_rg_filter }),
  }
}

for i = 1, 9 do
  -- leader + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- tmux status
wezterm.on("update-right-status", function(window, _)
  local prefix = ""

  if window:leader_is_active() then
    -- prefix = " " .. utf8.char(0x1f47e) -- shark
    prefix = " " .. utf8.char(0x1F918) -- horns
  end

  window:set_left_status(wezterm.format {
    { Background = { Color = colors.brights[3] } },
    { Text = prefix },
  })
end)

-- Workspace name Right status
wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, workspace)
  local gui_win = window:gui_window()
  local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
  gui_win:set_right_status(wezterm.format({
    { Foreground = { Color = colors.brights[3] } },
    -- { Foreground = { Color = colors.foreground } },
    { Text = base_path .. "  " },
  }))
end)

wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, workspace)
  -- Workspace name Right status
  local gui_win = window:gui_window()
  local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
  gui_win:set_right_status(wezterm.format({
    { Foreground = { Color = colors.ansi[1] } },
    -- { Foreground = { Color = colors.foreground } },
    { Text = base_path .. "  " },
  }))

  -- Default workspace config
  -- nvim - terminals - lazygit
  local original_pane = window:active_pane()
  local original_tab = window:active_tab()
  local gui_window = window:gui_window()

  original_tab:set_title('nvim')
  original_pane:send_text('nvim .\n')

  local tab_1, _, _ = window:spawn_tab {}
  tab_1:set_title('terminals')

  local tab_2, pane_2, _ = window:spawn_tab {}
  tab_2:set_title("git")
  pane_2:send_text("lazygit \n")

  gui_window:perform_action(wezterm.action.ActivateTab(0), original_pane)
end)


-- Plugins
-- nvim panel navigation integration
smart_splits.apply_to_config(config, {
  -- the default config is here, if you'd like to use the default keys,
  -- you can omit this configuration table parameter and just use
  -- smart_splits.apply_to_config(config)

  -- directional keys to use in order of: left, down, up, right
  direction_keys = { 'h', 'n', 'p', 'l' },
  -- modifier keys to combine with direction_keys
  modifiers = {
    move = 'CTRL',   -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = 'META', -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
})
wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
