local map = require("core.utils").map

map("v", "<Tab>", ">")
map("v", "<S-Tab>", "<")
map("", "<leader>tn", ":tabn<cr>")
map("", "<C-t>", ":tabedit<cr>")
map("n", "<C-s>", "<cmd> :call Black() <CR> | :w <CR>") -- ctrl + s to save file
map("", "<C-g>", ":TZFocus<CR>")
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
