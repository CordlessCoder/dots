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
-- local base16 = lines_from(os.getenv "HOME" .. "/.cache/wal/colors")

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
  base00 = base30[32],
  base01 = base30[33],
  base02 = base30[34],
  base03 = base30[35],
  base04 = base30[36],
  base05 = base30[37],
  base06 = base30[38],
  base07 = base30[39],
  base08 = base30[40],
  base09 = base30[41],
  base0A = base30[42],
  base0B = base30[43],
  base0C = base30[44],
  base0D = base30[45],
  base0E = base30[46],
  base0F = base30[47],
}

-- print all line numbers and their contents
M.type = "dark"

vim.opt.bg = "dark"

M.polish_hl = {
  Normal = { fg = M.base_30.white },
  Constant = { fg = M.base_30.grey_fg2 },
  Character = { fg = M.base_30.grey_fg },
  TSCharacter = { fg = M.base_30.grey_fg },
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
  String = { fg = M.base_30.orange },
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
  rainbowcol1 = { fg = base30[33], bold = true },
  rainbowcol2 = { fg = base30[34], bold = true },
  rainbowcol3 = { fg = base30[35], bold = true },
  rainbowcol4 = { fg = base30[36], bold = true },
  rainbowcol5 = { fg = base30[37], bold = true },
  rainbowcol6 = { fg = base30[38], bold = true },
  rainbowcol7 = { fg = base30[39], bold = true },
}

vim.g.terminal_color_0 = base30[32]
vim.g.terminal_color_1 = base30[33]
vim.g.terminal_color_2 = base30[34]
vim.g.terminal_color_3 = base30[35]
vim.g.terminal_color_4 = base30[36]
vim.g.terminal_color_5 = base30[37]
vim.g.terminal_color_6 = base30[38]
vim.g.terminal_color_7 = base30[39]
vim.g.terminal_color_8 = base30[40]
vim.g.terminal_color_9 = base30[41]
vim.g.terminal_color_10 = base30[42]
vim.g.terminal_color_11 = base30[43]
vim.g.terminal_color_12 = base30[44]
vim.g.terminal_color_13 = base30[45]
vim.g.terminal_color_14 = base30[46]
vim.g.terminal_color_15 = base30[47]

M = require("base46").override_theme(M, "pywal")

return M
