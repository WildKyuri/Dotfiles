local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 9.5

-- keep adding conf options
config.window_background_opacity = 0.80
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"

config.initial_cols = 160
config.initial_rows = 40

-- Paleta de Colores
-- "#8635e0",
-- "#a656ff",
-- "#c088ff",
-- "#ff88df",
-- "#f9a4e2",
-- "#F4CDE9",
-- "#DEBAD4",
-- "#C8A6BE",
-- "#B293A8",
-- "#9C7F92",
-- "#866C7D",
-- "#705867",
-- "#5A4551",
-- "#44313B",

-- my coolnight colorscheme:
config.colors = {
	-- foreground = "#dcd7ba",
	background = "#1f1f28",

	cursor_bg = "#f9a4e2",
	cursor_border = "#f9a4e2",

	selection_fg = "#F4CDE9",
	selection_bg = "#5A4551",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = { "#090618", "#c34043", "#C8A6BE", "#00ffcd", "#090618", "#ff88df", "#f9a4e2", "#DEBAD4" },
	brights = { "#a656ff", "#e82424", "#c088ff", "#f9a4e2", "#ff88df", "#938aa9", "#ff5d62", "#F4CDE9" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

-- activate ONLY if windows --
config.default_domain = "WSL:Ubuntu"
-- config.default_prog = { "powershell.exe", "-NoLogo" }
-- config.front_end = "WebGpu"
config.max_fps = 165
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
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Split horizontally
	{
		key = "S",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Navigate between panes
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "X",
		mods = "ALT|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- Resize panes
	{
		key = "LeftArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
	},
	{
		key = "RightArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
	},
	{
		key = "UpArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		key = "DownArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
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
		action = wezterm.action.SpawnTab("DefaultDomain"),
	},
	-- Navigate to the next tab
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- Pegar con Ctrl+V
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

return config
