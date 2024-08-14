local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 9.5

-- keep adding conf options
config.window_background_opacity = 0.75
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- my coolnight colorscheme:
config.colors = {
  -- foreground = "#dcd7ba",
  background = "#1f1f28",

  cursor_bg = "#c8c093",
  cursor_fg = "#c8c093",
  cursor_border = "#c8c093",

  selection_fg = "#c8c093",
  selection_bg = "#2d4f67",

  scrollbar_thumb = "#16161d",
  split = "#16161d",

  ansi = { "#090618", "#c34043", "#C8A6BE", "#00ffcd", "#090618", "#ff88df", "#C8A6BE", "#DEBAD4" },  
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

-- activate ONLY if windows --
-- config.default_domain = 'WSL:Ubuntu'
config.default_prog = { "powershell.exe", "-NoLogo" }
-- config.front_end = "WebGpu"
config.max_fps = 120
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
  if gpu.backend == "Vulkan" then
    config.webgpu_preferred_adapter = gpu
    break
  end
end

-- Keybindings for splitting the terminal
config.keys = {
  -- Split vertically
  {
    key = "D",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  -- Split horizontally
  {
    key = "S",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  -- Navigate between panes
  {
    key = "h",
    mods = "ALT|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "l",
    mods = "ALT|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = "k",
    mods = "ALT|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "j",
    mods = "ALT|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    key = "X",
    mods = "ALT|SHIFT",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Resize panes
  {
    key = "LeftArrow",
    mods = "ALT|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Left", 1 },
  },
  {
    key = "RightArrow",
    mods = "ALT|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Right", 1 },
  },
  {
    key = "UpArrow",
    mods = "ALT|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Up", 1 },
  },
  {
    key = "DownArrow",
    mods = "ALT|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Down", 1 },
  },
  -- Open a new window
  {
    key = "N",
    mods = "ALT|SHIFT",
    action = wezterm.action.SpawnWindow,
  },
  -- Open a new tab
  {
    key = "T",
    mods = "ALT|SHIFT",
    action = wezterm.action.SpawnTab "DefaultDomain",
  },
  -- Navigate to the next tab
  {
    key = "Tab",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivateTabRelative(1),
  },
  -- Paste ctrl + v
  {
    key = "v",
    mods = "CTRL",
    action = wezterm.action.PasteFrom("Clipboard")
  },
}

return config
