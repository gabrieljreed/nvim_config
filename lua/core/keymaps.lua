vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>ff", require("telescope.builtin").git_files, {})
keymap.set("n", "<leader>FF", require("telescope.builtin").find_files, {})

