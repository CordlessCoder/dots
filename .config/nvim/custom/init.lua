local opt = vim.opt
local g = vim.g

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local remaps = {
  -- d = "g",
  -- e = "k",
  -- f = "e",
  -- g = "t",
  -- i = "l",
  -- j = "y",
  -- k = "n",
  -- l = "u",
  -- n = "j",
  --   m= "h",
  -- o = "p",
  -- p = "r",
  -- r = "s",
  -- s = "d",
  -- t = "f",
  -- u = "i",
  -- y = "o",
  -- D = "G",
  -- E = "K",
  -- F = "E",
  -- G = "T",
  -- I = "L",
  -- J = "Y",
  -- K = "N",
  -- L = "U",
  -- N = "J",
  -- O = "P",
  -- P = "R",
  -- R = "S",
  -- S = "D",
  -- T = "F",
  -- U = "I",
  -- Y = "O",
}
for k, v in pairs(remaps) do
  map("n", k, v)
end

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
  g.neovide_transparency = 0.97
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
vim.cmd "let g:sneak#label = 1"
-- Functional wrapper for mapping custom keybindings
-- function map(mode, lhs, rhs, opts)
--   local options = { noremap = true }
--   if opts then
--     options = vim.tbl_extend("force", options, opts)
--   end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end
--
-- -- Colemak: hjkl to mnei, and i to t
-- map("n", "m", "h") -- move Left
-- map("n", "n", "gj") -- move Down (g to allow move within wrapped lines)
-- map("n", "e", "gk") -- move Up (g to allow move within wrapped lines)
-- map("n", "i", "l") -- move Right
-- map("n", "t", "i") -- (t)ype           replaces (i)nsert
-- map("n", "T", "I") -- (T)ype at bol    replaces (I)nsert
-- map("n", "E", "e") -- end of word      replaces (e)nd
-- map("n", "h", "n") -- next match       replaces (n)ext
-- map("n", "k", "N") -- previous match   replaces (N) prev
--
-- -- Visual Colemak
-- map("v", "m", "h") -- move Left
-- map("v", "n", "gj") -- move Down (g to allow move within wrapped lines)
-- map("v", "e", "gk") -- move Up (g to allow move within wrapped lines)
-- map("v", "I", "l") -- move Right - shifted to fix [v]isual[i]n[...]
--
-- -- Swap ; and : to enter commands without pressing shift
-- map("n", ";", ":")
-- map("n", ":", ";")
--
-- -- Quickly return to normal mode (before colemak this was "jk")
-- map("i", ",n", "<Esc>")
--
-- -- Ctrl+up/down to page up/down
-- map("n", "<C-n>", "<C-f>M") -- page down
-- map("n", "<C-e>", "<C-b>M") -- page up
