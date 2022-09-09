local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.confirm = true
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autochdir = true
opt.mousemodel = "extend"
-- g.toggle_theme_icon = ""
g.instant_username = "CordlessCoder"
g.python3_host_prog = "/usr/bin/python3"

g.neovide_transparency = 0.85
g.neovide_refresh_rate = 165
opt.guifont = "FiraCode Nerd Font:h15"
g.neovide_cursor_unfocused_outline_width = 0.1
g.neovide_cursor_animation_length = 0.06
g.neovide_cursor_trail_length = 0.17
g.rust_clip_command = 'xclip -selection clipboard'
-- vim.cmd "set langmap=fpgjluyrstdneikFPGJLUYRSTDNEIKoO;ertyuiosdfgjklnERTYUIOSDFGJKLNpP"
-- vim.cmd "set langnoremap"
vim.cmd "let g:sneak#label = 1"
