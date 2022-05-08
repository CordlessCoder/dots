local present, alpha = pcall(require, "alpha")


if not present then
   return
end



--- Generates a button for alpha.nvim dashboard configuration.
-- @param label the text that will be displayed at this button
-- @param shortcut the shortcut key label text
-- @param hl_icon the highlight group of the label icon
-- @param hl_label the highlight group for the button label text
-- @return table options table that will be passed onto the alpha setup function
-- function btn_gen(label, shortcut, hl_label, hl_icon)
  -- return {
    -- type = "button",
    -- on_press = function()
      -- api.nvim_feedkeys(key, "normal", false)
    -- end,
    -- val = label,
    -- opts = {
      -- position = "center",
      -- shortcut = shortcut,
      -- cursor = 5,
      -- width = 25,
      -- align_shortcut = "right",
      -- hl_shortcut = "AlphaKeyPrefix",
      -- hl = {
        -- { hl_icon, 1, 3 }, -- highlight the icon glyph
        -- { hl_label, 4, 15 }, -- highlight the part after the icon glyph
      -- },
    -- },
  -- }
-- end

local function button(sc, txt, keybind, highlight, highlight_s)
   local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

   local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 40,
      align_shortcut = "right",
      hl = highlight,
      hl_shortcut = highlight_s,
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
      hl = "Label",
   },
}



options.buttons = {
   type = "group",
   val = {
      button("SPC f f", "  Find File  ", ":Telescope find_files<CR>", "Alpha0", "AlphaShortcut9"),
      button("SPC r f", "  Recent File  ", ":Telescope oldfiles<CR>", "Alpha1", "AlphaShortcut8"),
      button("SPC w s", "  Word Sniper", ":Telescope live_grep<CR>", "Alpha2", "AlphaShortcut7"),
      button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>", "Alpha3", "AlphaShortcut6"),
      button("SPC t r", "  Terminal ", ":term <CR> i", "Alpha4", "AlphaShortcut5"),
      button("SPC p s", "  Python Shell ", ":term bpython <CR> i", "Alpha5", "AlphaShortcut4"),
      button("SPC t h", "  Themes  ", ":Telescope themes<CR>", "Alpha6", "AlphaShortcut3"),
      button("SPC s e", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>", "Alpha7", "AlphaShortcut2"),
      button("SPC q q", "  Exit ", ":qa!<CR>", "Alpha8", "AlphaShortcut1"),
   },
   opts = {
      spacing = 1,
   },
}

options = require("core.utils").load_override(options, "goolord/alpha-nvim")

alpha.setup {
   layout = {
      { type = "padding", val = 4 },
      options.header,
      { type = "padding", val = 1 },
      options.buttons,
   },
   opts = {},
}
