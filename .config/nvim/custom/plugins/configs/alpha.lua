local present, alpha = pcall(require, "alpha")

if not present then
  return
end

require("base46").load_highlight "alpha"

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local options = {}

local ascii = {
  "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
  "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
  "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
  "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
  "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
  "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
  "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
  " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
  " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
  "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
  "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}

options.header = {
  type = "text",
  val = ascii,
  opts = {
    position = "center",
    hl = "AlphaHeader",
  },
}

options.buttons = {
  type = "group",
  val = {
    button("SPC f f", "  Find File    ", ":Telescope find_files<CR>"),
    button("SPC r f", "  Recent File  ", ":Telescope oldfiles<CR>"),
    button("SPC w s", "  Word Sniper  ", ":Telescope live_grep<CR>"),
    button("SPC b m", "  Bookmarks    ", ":Telescope marks<CR>"),
    button("SPC t r", "  Terminal     ", ":term <CR> i"),
    button("SPC r s", "  Rust Shell   ", "<cmd>:term irust <CR> :tabonly <CR> i"),
    button("SPC t h", "  Themes       ", ":Telescope themes<CR>"),
    button("SPC s e", "  Settings     ", ":e ~/.config/nvim/lua/custom/chadrc.lua|:cd %:p:h <CR>"),
    button("SPC u p", "ﮮ  Update NvChad", ":NvChadUpdate <CR>"),
    button("SPC q q", "  Exit         ", ":qa!<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

options = require("core.utils").load_override(options, "goolord/alpha-nvim")

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.1
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

alpha.setup {
  layout = {
    { type = "padding", val = headerPadding },
    options.header,
    { type = "padding", val = 1 },
    options.buttons,
  },
  opts = {},
}
