--[[
  Config para wezterm en el caso de uso
  de el subsistema de linux para una pc
  de torre con buen procesador y buena
  grafica
--]]

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 9.5

-- keep adding conf options
config.window_background_opacity = 0.80
-- config.front_end = "WebGpu"
config.front_end = "OpenGL"

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"
config.default_cursor_style = "SteadyBar"

config.initial_cols = 160
config.initial_rows = 40

-- Función para alternar la opacidad
local function toggle_opacity(window, pane)
	if config.window_background_opacity == 1.0 then
		config.window_background_opacity = 0.80 -- Regresar a opacidad inicial
	else
		config.window_background_opacity = 1.0 -- Hacer sólido el fondo
	end
	window:set_config_overrides({ window_background_opacity = config.window_background_opacity })
end

-- my coolnight colorscheme:
config.colors = {
	-- foreground = "#dcd7ba",
	-- background = "#1f1f28", -- Dark Pink
	background = "#0c0b0f", -- Dark Purple
	-- background = "#3b224c",
	-- background = "#181616", -- vague.nvim bg
	-- background = "#080808", -- almost black
	-- background = "#020202", -- dark purple
	-- background = "#17151c", -- brighter purple
	-- background = "#16141a",
	-- background = "#0e0e12", -- bright washed lavendar
	-- background = "rgba(59, 34, 76, 100%)",

	cursor_bg = "#f9a4e2",
	cursor_border = "#f9a4e2",

	selection_fg = "#F4CDE9",
	selection_bg = "#5A4551",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = {
		"#090618",
		"#c34043",
		"#bf6ebe",
		"#00ffcd",
		"#e0c4ff",
		"#ff88df",
		"#f9a4e2",
		"#DEBAD4",
	},
	brights = {
		"#a656ff",
		"#e82424",
		"#c088ff",
		"#f9a4e2",
		"#ff88df",
		"#938aa9",
		"#ff5d62",
		"#F4CDE9",
	},
	indexed = {
		[16] = "#ffa066",
		[17] = "#ff5d62",
	},
}

-- Añadir opciones de lanzamiento rápido para WSL
config.launch_menu = {
	{
		label = "WSL - Parrot OS",
		args = { "wsl.exe", "--distribution", "Parrot" },
	},
	{
		label = "WSL - Ubuntu",
		args = { "wsl.exe", "--distribution", "Ubuntu" },
	},
}
-- activate ONLY if windows --
-- config.default_domain = "WSL:Ubuntu"
config.default_domain = "WSL:ParrotOS"

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
	-- Cambiar Ubuntu y Parrot
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = "ShowLauncher",
	},
	-- Alternar opacidad con CTRL+ALT+E
	{
		key = "e",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(toggle_opacity),
	},
}

return config
