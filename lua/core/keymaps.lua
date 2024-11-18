vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs ([t]ab[o]nly)" })

-- Toggle Nerd Tree
keymap.set("n", "<leader>ee", ":NERDTreeToggle<CR>", { desc = "Toggle NERD Tree" })

-- Toggle Git Blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle [G]it [B]lame" } )

keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})

