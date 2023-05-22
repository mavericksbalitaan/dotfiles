require("toggleterm").setup({
	direction = "float",
})

-- custom keybind
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<Leader>=', ':ToggleTerm<CR>', opts)
