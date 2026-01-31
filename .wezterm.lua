local wezterm = require("wezterm")

COLOR_BASE = "#faf4ed"
COLOR_SURFACE = "#dfdad9"
COLOR_TEXT = "#575279"
COLOR_MUTED = "#9893a5"
FONT = "JetBrainsMono Nerd Font"
FONT_SIZE = 20.0
FONT_WEIGHT = "Regular"

local config = {}

-- Font
config.font = wezterm.font(FONT, { weight = FONT_WEIGHT })
config.font_size = FONT_SIZE

-- Command palette font
config.command_palette_font = wezterm.font(FONT, { weight = FONT_WEIGHT })
config.command_palette_font_size = FONT_SIZE
config.command_palette_bg_color = COLOR_BASE -- rose-pine-dawn overlay
config.command_palette_fg_color = COLOR_TEXT -- rose-pine-dawn text

-- You can find more color schemes at: https://wezterm.org/colorschemes/index.html
config.color_scheme = "rose-pine-dawn"

-- Hide the title bar
config.window_decorations = "RESIZE"

-- Tab bar
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = false

-- Window padding
config.window_padding = {
	left = 10,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Keys
config.keys = {
	-- New tab
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	-- Split pane vertically
	{ key = "d", mods = "CMD", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- Split pane horizontally
	{ key = "D", mods = "CMD|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- Navigate panes
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
}

-- Effective when enable_tab_bar = true
config.window_frame = {
	-- The font used in the tab bar.
	font = wezterm.font({ family = FONT, weight = FONT_WEIGHT }),

	-- The size of the font in the tab bar.
	font_size = 14.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = COLOR_SURFACE,

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = COLOR_SURFACE,
}

-- Effective when enable_tab_bar = true
config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		background = COLOR_SURFACE,

		-- The active tab is the one that has focus in the window
		active_tab = {
			bg_color = COLOR_BASE,
			fg_color = COLOR_TEXT,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = COLOR_SURFACE,
			fg_color = COLOR_MUTED,
		},

		inactive_tab_hover = {
			bg_color = COLOR_BASE,
			fg_color = COLOR_TEXT,
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = COLOR_SURFACE,
			fg_color = COLOR_MUTED,
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = COLOR_BASE,
			fg_color = COLOR_TEXT,
		},
	},
}

return config
