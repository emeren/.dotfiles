-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- my coolnight colorscheme
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
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

-- config.font = wezterm.font("")
config.font_size = 14
config.line_height = 1.50
-- config.disable_default_key_bindings = true

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.macos_window_background_blur = 10
config.enable_kitty_keyboard = true
config.window_background_opacity = 0.8
config.macos_window_background_blur = 90

config.keys = {
	{ key = ".", mods = "CMD", action = wezterm.action({ SendKey = { key = ".", mods = "CTRL" } }) },
	{ key = "p", mods = "CMD", action = wezterm.action({ SendKey = { key = "p", mods = "CTRL" } }) },
	{ key = "a", mods = "CMD", action = wezterm.action({ SendKey = { key = "a", mods = "CTRL" } }) },
	{ key = "c", mods = "CMD", action = wezterm.action({ SendKey = { key = "c", mods = "CTRL" } }) },
	{ key = "/", mods = "CMD", action = wezterm.action({ SendKey = { key = ">", mods = "CTRL" } }) },
	{ key = "x", mods = "CMD", action = wezterm.action({ SendKey = { key = "x", mods = "CTRL" } }) },
	{ key = "s", mods = "CMD", action = wezterm.action({ SendKey = { key = "s", mods = "CTRL" } }) },
}

return config
