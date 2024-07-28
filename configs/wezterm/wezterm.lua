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
	foreground = "#CBE0F0",
	-- background = "#14001E",
	cursor_bg = "#DC97FF",
	cursor_border = "#DC97FF",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- activate ONLY if windows --
-- config.default_domain = 'WSL:Ubuntu'
config.default_prog = {"powershell.exe", "-NoLogo"}
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
    action = wezterm.action.AdjustPaneSize {"Left", 1},
  },
  {
    key = "RightArrow",
    mods = "ALT|SHIFT",
    action = wezterm.action.AdjustPaneSize {"Right", 1},
  },
  {
    key = "UpArrow",
    mods = "ALT|SHIFT",
    action = wezterm.action.AdjustPaneSize {"Up", 1},
  },
  {
    key = "DownArrow",
  mods = "ALT|SHIFT",
    action = wezterm.action.AdjustPaneSize {"Down", 1},
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
}

return config
