-- Personal Hyprland layer for Caelestia.
-- Loaded after Caelestia defaults and before HyprMod-generated monitor settings.
-- The goal is to restore the previous workflow without replacing Caelestia services.

local vars = require("variables")
local fn = require("utils.functions")

local repeating = { repeating = true }
local mouse = { mouse = true }

-- ------------------------------------------------------------
-- Input: preserve the previous keyboard/mouse behaviour.
-- ------------------------------------------------------------
hl.config({
	input = {
		kb_layout = "us,latam",
		kb_options = "",
		follow_mouse = 1,
		sensitivity = 0.5,
		accel_profile = "flat",
	},
})

hl.bind("CTRL + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))

-- ------------------------------------------------------------
-- Personal startup additions only.
-- Caelestia itself keeps ownership of shell, clipboard history,
-- wallpaper, idle/lock integration, notifications, etc.
-- ------------------------------------------------------------
-- hl.on("hyprland.start", function()
-- 	-- Start Kanata only when available, configured, and not already running.
-- 	hl.exec_cmd(
-- 		"command -v kanata >/dev/null 2>&1 && "
-- 			.. '[ -f "$HOME/.config/kanata/config.kbd" ] && '
-- 			.. "! pgrep -x kanata >/dev/null && "
-- 			.. 'kanata -c "$HOME/.config/kanata/config.kbd"'
-- 	)
-- end)

hl.on("hyprland.start", function()
	hl.exec_cmd(
		"sleep 2 && "
			.. '[ -f "$HOME/.config/kanata/config.kbd" ] && '
			.. "! pgrep -x kanata >/dev/null && "
			.. '/usr/bin/kanata -c "$HOME/.config/kanata/config.kbd"'
	)
end)

-- ------------------------------------------------------------
-- ALT workflow from the previous Hyprland configuration.
-- These are aliases; Caelestia's original SUPER bindings remain intact.
-- ------------------------------------------------------------
hl.bind("ALT + Q", hl.dsp.window.close())
hl.bind("ALT + SHIFT + SPACE", hl.dsp.window.float())

-- Dwindle helpers.
hl.bind("ALT + P", hl.dsp.window.pseudo())
hl.bind("ALT + O", hl.dsp.layout("togglesplit"))

-- Vim-style focus.
local focus_dirs = {
	H = "left",
	L = "right",
	K = "up",
	J = "down",
}
for key, dir in pairs(focus_dirs) do
	hl.bind("ALT + " .. key, hl.dsp.focus({ direction = dir }))
	hl.bind("ALT + SHIFT + " .. key, hl.dsp.window.move({ direction = dir }))
end

-- Resize with ALT + arrows, preserving the old 10 px increments.
hl.bind("ALT + RIGHT", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 10 0"), repeating)
hl.bind("ALT + LEFT", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -10 0"), repeating)
hl.bind("ALT + UP", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10"), repeating)
hl.bind("ALT + DOWN", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10"), repeating)

-- Workspaces 1-10 and 11-20.
for i = 1, 10 do
	local key = i % 10
	hl.bind("ALT + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("ALT + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))

	local upper = i + 10
	hl.bind("ALT + CTRL + " .. key, hl.dsp.focus({ workspace = upper }))
	hl.bind("ALT + SHIFT + CTRL + " .. key, hl.dsp.window.move({ workspace = upper }))
end

-- Move active window to special workspaces
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = "special:music" }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = "special:communication" }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = "special:todo" }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = "special:special" }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = "special:sysmon" }))

-- Mouse move/resize aliases.
hl.bind("ALT + mouse:272", hl.dsp.window.drag(), mouse)
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), mouse)

-- ============================================================
-- ALT + `
-- Toggle focus between the current tiled window and the
-- front/recent floating window, remembering the exact tiled
-- window we came from.
-- ============================================================

local last_tiled_by_workspace = {}

local function find_window_by_address(address)
	if not address then
		return nil
	end

	for _, win in ipairs(hl.get_windows() or {}) do
		if win.address == address then
			return win
		end
	end

	return nil
end

local function most_recent_window(workspace_id, floating)
	local target = nil

	for _, win in ipairs(hl.get_windows() or {}) do
		if win.workspace and win.workspace.id == workspace_id and win.floating == floating then
			if not target then
				target = win
			else
				local current_history = win.focus_history_id or math.huge
				local target_history = target.focus_history_id or math.huge

				if current_history < target_history then
					target = win
				end
			end
		end
	end

	return target
end

hl.bind("ALT + grave", function()
	local active = hl.get_active_window()
	local workspace = hl.get_active_workspace()

	if not active or not workspace then
		return
	end

	local workspace_id = workspace.id

	-- Estamos en una ventana floating:
	-- regresar EXACTAMENTE a la tiled desde donde llegamos.
	if active.floating then
		local saved_address = last_tiled_by_workspace[workspace_id]
		local target = find_window_by_address(saved_address)

		if target and not target.floating and target.workspace and target.workspace.id == workspace_id then
			hl.dispatch(hl.dsp.focus({ window = target }))
			return
		end

		-- Fallback por si esa ventana fue cerrada.
		target = most_recent_window(workspace_id, false)

		if target then
			hl.dispatch(hl.dsp.focus({ window = target }))
		end

		return
	end

	-- Estamos en una tiled:
	-- recordar EXACTAMENTE esta ventana antes de ir a floating.
	last_tiled_by_workspace[workspace_id] = active.address

	local target = most_recent_window(workspace_id, true)

	if target then
		hl.dispatch(hl.dsp.focus({ window = target }))
	end
end)

-- ------------------------------------------------------------
-- Useful old shortcuts mapped onto Caelestia where possible.
-- ------------------------------------------------------------

-- Old btop shortcut, but use Caelestia's own sysmon special workspace.
hl.bind("SUPER + SHIFT + ESCAPE", fn.toggle("sysmon"))

-- Old colour-picker shortcut; Caelestia also keeps its native shortcut.
hl.bind("SUPER + H", hl.dsp.exec_cmd("hyprpicker -a"))

-- OpenCode was unique to the previous setup.
hl.bind("SUPER + O", hl.dsp.exec_cmd("kitty --class opencode --title OpenCode opencode"))

-- Preserve the old direct session exit shortcut.
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl dispatch exit"))

-- Preserve old media muscle-memory, but route through Caelestia/MPRIS.
hl.bind("SUPER + F10", hl.dsp.global("caelestia:mediaToggle"))
hl.bind("SUPER + F11", hl.dsp.global("caelestia:mediaNext"))
hl.bind("SUPER + F9", hl.dsp.global("caelestia:mediaPrev"))

-- Preserve old mute shortcut. Physical media keys remain managed by Caelestia.
hl.bind("SUPER + F5", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- DroidCam shortcuts are independent of Caelestia.
hl.bind("F12", hl.dsp.exec_cmd("[ -x /opt/droidcam/droidcamx ] && /opt/droidcam/droidcamx capture"))
hl.bind("SUPER + SHIFT + F12", hl.dsp.exec_cmd("[ -x /opt/droidcam/droidcamx ] && /opt/droidcam/droidcamx photo"))

-- ------------------------------------------------------------
-- Personal window rules that are not already provided by Caelestia.
-- ------------------------------------------------------------
hl.window_rule({
	match = { class = "wiremix-popup" },
	float = true,
	size = "450 680",
	center = true,
})

-- ------------------------------------------------------------
-- Workspace → monitor mapping
-- Restored from previous Hyprland configuration.
-- ------------------------------------------------------------

-- Workspaces 1-10 → DP-2
for i = 1, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-2",
	})
end

-- Workspaces 11-15 → DP-1
for i = 11, 17 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-1",
	})
end

-- Workspaces 16-20 → HDMI-A-1
for i = 18, 20 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "HDMI-A-1",
	})
end

-- ============================================================
-- Cycle normal workspaces 1-20
-- Ignore Caelestia special workspaces completely.
-- ALT+A = previous
-- ALT+S = next
-- ============================================================

local function cycle_normal_workspace(direction)
	return function()
		local current = hl.get_active_workspace()
		if not current then
			return
		end

		local workspaces = {}

		for _, ws in pairs(hl.get_workspaces()) do
			if not ws.special and ws.id >= 1 and ws.id <= 20 then
				table.insert(workspaces, ws)
			end
		end

		if #workspaces == 0 then
			return
		end

		table.sort(workspaces, function(a, b)
			return a.id < b.id
		end)

		local current_index = nil

		for i, ws in ipairs(workspaces) do
			if ws.id == current.id then
				current_index = i
				break
			end
		end

		local target_index

		if current_index then
			target_index = ((current_index - 1 + direction) % #workspaces) + 1
		elseif direction > 0 then
			target_index = 1
		else
			target_index = #workspaces
		end

		hl.dispatch(hl.dsp.focus({
			workspace = tostring(workspaces[target_index].id),
		}))
	end
end

hl.unbind("ALT + A")
hl.unbind("ALT + S")

hl.bind("ALT + A", cycle_normal_workspace(-1))
hl.bind("ALT + S", cycle_normal_workspace(1))

-- ============================================================
-- Legacy personal application keybinds
-- ============================================================

local fn = require("utils.functions")

-- Eww cheatsheets.
hl.bind("SUPER + slash", hl.dsp.exec_cmd("eww open --toggle cheatsheet-popup"))

hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("eww open --toggle nvim-cheatsheet-popup"))

-- DroidCam.
hl.bind("F12", hl.dsp.exec_cmd("/opt/droidcam/droidcamx capture"))

hl.bind("SUPER + SHIFT + F12", hl.dsp.exec_cmd("/opt/droidcam/droidcamx photo"))

-- Exit Hyprland.
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown"))

-- ------------------------------------------------------------
-- Move floating windows with ALT + CTRL + arrows.
-- 10 px per step.
-- ------------------------------------------------------------

hl.bind("ALT + LEFT", hl.dsp.window.move({ x = -40, y = 0, relative = true }), repeating)

hl.bind("ALT + RIGHT", hl.dsp.window.move({ x = 40, y = 0, relative = true }), repeating)

hl.bind("ALT + UP", hl.dsp.window.move({ x = 0, y = -40, relative = true }), repeating)

hl.bind("ALT + DOWN", hl.dsp.window.move({ x = 0, y = 40, relative = true }), repeating)

-- Quickshell icon theme
hl.env("QS_ICON_THEME", "Papirus-Dark")
