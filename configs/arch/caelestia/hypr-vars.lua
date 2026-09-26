-- Personal overrides for Caelestia.
-- Keep this file small: only values that intentionally differ from Caelestia defaults.
return {
	-- Previous setup changed volume in 2% steps.
	volumeStep = 2,
	windowOpacity = 0.90,

	sleepGestureCmd = "systemctl suspend",

	-- Desactivar workspaces numéricos nativos de Caelestia
	kbGoToWs = "",
	kbGoToWsGroup = "",
	kbMoveWinToWs = "",
	kbMoveWinToWsGroup = "",

	-- Special workspaces
	kbMusicWs = "SUPER + 1",
	kbCommunicationWs = "SUPER + 2",
	kbTodoWs = "SUPER + 3",
	kbSpecialWs = "SUPER + 4",
	kbSystemMonitorWs = "SUPER + 5",

	kbTerminal = "ALT + RETURN",
	kbLauncher = "ALT + Space",

	-- ============================================================
	-- Personal keybinds - restored from previous Hyprland
	-- ============================================================

	-- Apps
	browser = "zen-browser",
	kbBrowser = "SUPER + Z",
}
