vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>tt", ":tabnew<CR>", {})
keymap.set("n", "<leader>tc", ":tabclose<CR>", {})
keymap.set("n", "<leader>to", ":tabonly<CR>", {})

keymap.set("n", "<leader>ff", require("telescope.builtin").git_files, {})
keymap.set("n", "<leader>FF", require("telescope.builtin").find_files, {})
keymap.set("n", "<leader>lg", require("telescope.builtin").live_grep, {})

keymap.set("n", "<leader>ee", ":NERDTreeToggle<CR>", {})  -- Toggle Nerd Tree

keymap.set("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {})
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {})

