-- pywal.lua - a dynamic theme based on pywal
local M = {}
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

-- tests the functions above
local base30 = lines_from(os.getenv "HOME" .. "/.cache/wal/colors-base30")
local base16 = lines_from(os.getenv "HOME" .. "/.cache/wal/colors")

M.base_30 = {
   white = base30[1],
   darker_black = base30[2],
   black = base30[3],
   black2 = base30[4],
   one_bg = base30[5],
   one_bg2 = base30[6],
   one_bg3 = base30[7],
   grey = base30[8],
   grey_fg = base30[9],
   grey_fg2 = base30[10],
   light_grey = base30[11],
   red = base30[12],
   baby_pink = base30[13],
   pink = base30[14],
   line = base30[15],
   green = base30[16],
   vibrant_green = base30[17],
   nord_blue = base30[18],
   blue = base30[19],
   yellow = base30[20],
   sun = base30[21],
   purple = base30[22],
   dark_purple = base30[23],
   teal = base30[24],
   orange = base30[25],
   cyan = base30[26],
   statusline_bg = base30[27],
   lightbg = base30[28],
   pmenu_bg = base30[29],
   folder_bg = base30[30],
}

M.base_16 = {
   base00 = base16[1],
   base01 = base16[2],
   base02 = base16[3],
   base03 = base16[4],
   base04 = base16[5],
   base05 = base16[6],
   base06 = base16[7],
   base07 = base16[8],
   base08 = base16[9],
   base09 = base16[10],
   base0A = base16[11],
   base0B = base16[12],
   base0C = base16[13],
   base0D = base16[14],
   base0E = base16[15],
   base0F = base16[16],
}

-- print all line numbers and their contents
M.type = "dark"

vim.opt.bg = "dark"

M.polish_hl = {
   Normal = { fg = M.base_30.light_grey },
   Constant = { fg = M.base_30.light_grey },
   Character = { fg = M.base_30.light_grey },
   TSCharacter = { fg = M.base_30.light_grey },
   TSFieldKey = { fg = M.base_30.sun },
   Exception = { fg = M.base_30.dark_purple },
   Visual = { fg = M.base_30.white, bg = M.base_30.black2 },
   Delimiter = { fg = M.base_30.sun },
   TSPunctSpecial = { fg = M.base_30.sun },
   TSPunctDelimiter = { fg = M.base_30.sun },
   TSPunctBracket = { fg = M.base_30.sun },
   TSParameter = { fg = M.base_30.teal },
   TSProperty = { fg = M.base_30.teal },
   SpecialChar = { fg = M.base_30.baby_pink },
   NormalFloat = { fg = M.base_30.teal },
   TooLong = { fg = M.base_30.sun },
   String = { fg = M.base_30.yellow },
   Debug = { fg = M.base_30.nord_blue },
   Statement = { fg = M.base_30.green },
   WarningMsg = { fg = M.base_30.red },
   Type = { fg = M.base_30.cyan, bold = true },
   Decorator = { fg = M.base_30.cyan, bold = true },
   Enum = { fg = M.base_30.cyan, bold = true },
   Method = { fg = M.base_30.cyan, bold = true },
   TSNamespace = { fg = M.base_30.baby_pink, bold = true },
   Identifier = { fg = M.base_30.cyan, italic = true },
   Function = { italic = true, fg = M.base_30.yellow },
   TSFuncMacro = { italic = true, fg = M.base_30.yellow },
   Directory = { bold = true },
   Number = { bold = true },
   Float = { bold = true },
   Boolean = { bold = true },
   Special = { bold = true },
   Comment = { italic = true },
   ErrorMsg = { bold = true },
   Operator = { bold = false },
   Define = { bold = true },
   Structure = { bold = true },
   Macro = { bold = true, fg = M.base_30.baby_pink },
   TblineFill = { bg = M.base_30.black },
}

vim.g.terminal_color_0 = M.base_16.base00
vim.g.terminal_color_1 = M.base_16.base01
vim.g.terminal_color_2 = M.base_16.base02
vim.g.terminal_color_3 = M.base_16.base03
vim.g.terminal_color_4 = M.base_16.base04
vim.g.terminal_color_5 = M.base_16.base05
vim.g.terminal_color_6 = M.base_16.base06
vim.g.terminal_color_7 = M.base_16.base07
vim.g.terminal_color_8 = M.base_16.base08
vim.g.terminal_color_9 = M.base_16.base09
vim.g.terminal_color_10 = M.base_16.base0A
vim.g.terminal_color_11 = M.base_16.base0B
vim.g.terminal_color_12 = M.base_16.base0C
vim.g.terminal_color_13 = M.base_16.base0D
vim.g.terminal_color_14 = M.base_16.base0E
vim.g.terminal_color_15 = M.base_16.base0F

M = require("base46").override_theme(M, "pywal")

return M
