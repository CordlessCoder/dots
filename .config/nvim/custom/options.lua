local opt = vim.opt
local g = vim.g

-- see if the file exists
local function file_exists(file)
   local f = io.open(file, "rb")
   if f then
      f:close()
   end
   return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
local function lines_from(file)
   if not file_exists(file) then
      return {}
   end
   local lines = {}
   for line in io.lines(file) do
      lines[#lines + 1] = line
   end
   return lines
end

opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autochdir = true
-- g.toggle_theme_icon = ""
g.instant_username = "CordlessCoder"
g.python3_host_prog = "/usr/bin/python3"
g.neovide_refresh_rate = 165
opt.guifont = "FiraCode Nerd Font:h14"
g.neovide_cursor_unfocused_outline_width = 0.1
g.neovide_cursor_animation_length = 0.06
g.neovide_cursor_trail_length = 0.6

local lines = lines_from(os.getenv "HOME" .. "/.cache/wal/colors")

for k, v in pairs(lines) do
   load("vim.g.terminal_color_" .. k - 1 .. " = '" .. v .. "'")()
end
