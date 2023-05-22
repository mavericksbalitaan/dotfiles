local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- custom keybinds
keymap("n", "<Leader>h", ":nohlsearch", opts)
keymap("n", "<Leader>[", "<C-w>h", opts)
keymap("n", "<Leader>]", "<C-w>l", opts)
keymap("n", "<Leader>``", ":bprevious<CR>", opts)
keymap("n", "<Leader><Tab>", ":bnext<CR>", opts)
keymap("n", "<Leader>bd", ":%bd<Bar>e#<Bar>bd#<CR>", opts)
keymap("n", "<Leader>nh", ":nohlsearch<CR>", opts)

-- window navigation
keymap("t", "<ESC>", [[<C-\><C-n>]], opts)
keymap("t", "jk", [[<C-\><C-n>]], opts)
keymap("t", "kj", [[<C-\><C-n>]], opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("t", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("t", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("t", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("t", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-w>", [[<C-\><C-n><C-w>]], opts)
keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

-- normal mode
-- copy text
keymap("n", "Ô", "yyp", opts)
keymap("n", "", "yy<S-p>", opts)
-- move text
keymap("n", "∆", ":m .+1<CR>==gv", opts)
keymap("n", "˚", ":m .-2<CR>==gv", opts)
-- resize splits
keymap("n", "<S-Down>", ":resize -1 <CR>", opts)
keymap("n", "<S-Up>", ":resize +1 <CR>", opts)
keymap("n", "<S-Left>", ":vertical resize +1 <CR>", opts)
keymap("n", "<S-Right>", ":vertical resize -1 <CR>", opts)

-- insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- visual mode
-- indent text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", "<C-c>", '"+y', opts)
keymap("v", "<C-p>", '"+p', opts)

-- visual block
-- move text
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
