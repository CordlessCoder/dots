-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- TODO: Properly receive colors from pywal
local read_pywal_colors = function()
	-- read pywal colors if ~./cache/wal/colors exists and has 16 lines
	local pywal_colors = {}
	local pywal_cache = os.getenv("HOME") .. "/.cache/wal"

	-- check if wezterm.toml if exists load that as color_scheme
	-- TODO fix template
	-- local toml_colors_file = io.open(pywal_cache .. "/wezterm-wal.toml", "r")
	-- if toml_colors_file then
	-- 	toml_colors_file:close()
	-- 	wezterm.add_to_config_reload_watch_list(pywal_cache .. "/wezterm-wal.toml")
	--
	-- 	return {
	-- 		color_scheme_dirs = { pywal_cache },
	-- 		-- color_scheme = "wezterm-wal",
	-- 	}
	-- end

	local pywal_cache_file_path = pywal_cache .. "/colors"
	local pywal_cache_file = io.open(pywal_cache_file_path, "r")
	local err = nil

	if pywal_cache_file then
		wezterm.add_to_config_reload_watch_list(pywal_cache_file_path)
		local pyfile_c = pywal_cache_file:read("*a")
		local color_lines = wezterm.split_by_newlines(pyfile_c)
		local line_count = color_lines and #color_lines or 0 -- means 0 if color_lines is nil
		pywal_cache_file:close()
		if line_count == 16 then
			pywal_colors = {
				foreground = color_lines[16],
				background = color_lines[1],

				cursor_bg = color_lines[8],
				cursor_fg = color_lines[8],
				cursor_border = color_lines[8],

				selection_fg = color_lines[8],
				selection_bg = "#2d4f67",

				scrollbar_thumb = "#16161d",
				split = "#16161d",

				ansi = { table.unpack(color_lines, 1, 8) },

				brights = { table.unpack(color_lines, 9, 16) },
			}
		elseif line_count == 18 then
			pywal_colors = {
				foreground = color_lines[16],
				background = color_lines[1],

				cursor_bg = color_lines[8],
				cursor_fg = color_lines[8],
				cursor_border = color_lines[8],

				selection_fg = color_lines[8],
				selection_bg = "#2d4f67",

				scrollbar_thumb = "#16161d",
				split = "#16161d",

				ansi = { table.unpack(color_lines, 1, 8) },

				brights = { table.unpack(color_lines, 9, 16) },
				indexed = { [16] = color_lines[17], [17] = color_lines[18] },
			}
		else
			err = string.format("pywal colors file has wrong number of lines %d", line_count)
		end

		-- pywal_cache_file:close()
	else
		err = "pywal colors file not found"
	end

	if err then
		wezterm.log_error(string.format("error reading pywal colors: %s", err))
		return {}
	end
	wezterm.log_info("successfully loaded pywal colors using raw method")
	return pywal_colors
end

-- config.enable_wayland = false
-- config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
})
config.freetype_load_target = "Light"
-- config.freetype_render_target = "VerticalLcd"
config.font_size = 16.0
config.window_background_opacity = 0.8
config.enable_tab_bar = false
local pywal_colors = read_pywal_colors()
if pywal_colors then
	config.colors = pywal_colors
else
	config.color_scheme = "tokyonight_night"
end

-- and finally, return the configuration to wezterm
return config
