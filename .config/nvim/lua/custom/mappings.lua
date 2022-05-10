local map = nvchad.map

map("v", "<Tab>", ">")
map("v", "<S-Tab>", "<")
map("", "<leader>tn", ":tabn<CR>")
map("", "<C-t>", ":tabedit<CR>")
map("n", "<C-s>", "<cmd> :call Black() <CR> | :w <CR>") -- ctrl + s to save file
map("n", "<leader>tf", ":TZFocus<CR>")
map("n", "<leader>ta", ":TZAtaraxis<CR>")
map("n", "<C-g>", ":TZFocus<CR>")
map("n", "<leader>tm", ":TZMinimalist<CR>")
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader>cc", "<cmd> :ColorizerToggle <CR>")

