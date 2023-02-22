local opt = vim.opt
local g = vim.g

require("config.mappings")
require("config.visual")

opt.relativenumber = true
opt.confirm = true
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autochdir = true
opt.mousemodel = "extend"
g.toggle_theme_icon = "" -- disables the theme icon
g.instant_username = "CordlessCoder"
g.python3_host_prog = "/usr/bin/python3"

if g.neovide then
	g.neovide_transparency = 0.85
	-- g.neovide_refresh_rate = 165
	g.neovide_cursor_unfocused_outline_width = 0.1
	g.neovide_cursor_animation_length = 0.11
	g.neovide_cursor_trail_length = 0.17
	g.neovide_remember_window_size = false
	g.neovide_cursor_vfx_mode = "wireframe"
	g.neovide_hide_mouse_when_typing = true
end

g.rust_clip_command = "xclip -selection clipboard"
g.gitblame_enabled = 0
-- opt.guifont = "FiraCode Nerd Font:h16"
opt.guifont = "JetBrainsMono Nerd Font:h16"
-- vim.cmd "set langmap=fpgjluyrstdneikFPGJLUYRSTDNEIKoO;ertyuiosdfgjklnERTYUIOSDFGJKLNpP"
-- vim.cmd "set langnoremap"
vim.cmd("let g:sneak#label = 1")
