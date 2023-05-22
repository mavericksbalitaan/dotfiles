require("telescope").setup({
    defaults = { 
    file_ignore_patterns = { 
      "node_modules" 
    }
  }
})

-- custom keybinds
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
keymap("n", "<leader>-", builtin.find_files, opts)
keymap("n", "<leader>0", builtin.live_grep, opts)
keymap("n", "<leader>fb", builtin.buffers, opts)
keymap("n", "<leader>fh", builtin.help_tags, opts)
