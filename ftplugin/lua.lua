local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
vim.bo.softtabstop = 2

-- Keymaps
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>", { desc = "Source current file (lua)" })
vim.keymap.set("n", "<leader>X", ":.lua<CR>", { desc = "Source current line (lua)" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute selected text (lua)" })
