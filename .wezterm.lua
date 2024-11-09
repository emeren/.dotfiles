local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#96CEB8",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.window_padding = {
	left = 10,
	right = 10,
	top = 2,
	bottom = 2,
}

-- config.wezterm.on("update-status", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if string.find(pane:get_title(), "^n-vi-m-.*") then
-- 		overrides.window_padding = {
-- 			left = 0,
-- 			right = 0,
-- 			top = 0,
-- 			bottom = 0,
-- 		}
-- 	else
-- 		overrides.window_padding = padding
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })
config.font_size = 14
config.line_height = 1.55
config.max_fps = 144

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.macos_window_background_blur = 10
config.enable_kitty_keyboard = true
config.macos_window_background_blur = 95
config.window_background_opacity = 100

config.keys = {
	{ key = ".", mods = "CMD", action = wezterm.action({ SendKey = { key = ".", mods = "CTRL" } }) },
	{ key = "p", mods = "CMD", action = wezterm.action({ SendKey = { key = "p", mods = "CTRL" } }) },
	{ key = "a", mods = "CMD", action = wezterm.action({ SendKey = { key = "a", mods = "CTRL" } }) },
	{ key = "c", mods = "CMD", action = wezterm.action({ SendKey = { key = "c", mods = "CTRL" } }) },
	{ key = "/", mods = "CMD", action = wezterm.action({ SendKey = { key = "v", mods = "CTRL" } }) },
	{ key = "x", mods = "CMD", action = wezterm.action({ SendKey = { key = "x", mods = "CTRL" } }) },
	{ key = "s", mods = "CMD", action = wezterm.action({ SendKey = { key = "s", mods = "CTRL" } }) },
}

return config
