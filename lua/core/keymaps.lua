vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs ([t]ab[o]nly)" })

-- Nerd Tree
keymap.set("n", "<leader>ee", ":NERDTreeToggle<CR>", { desc = "Toggle NERD Tree" })
keymap.set("n", "<leader>rf", ":NERDTreeFind<CR>", { desc = "[R]eveal [F]ile in NERD Tree" })

-- Git Blame
vim.keymap.set("n", "<leader>gbt", ":GitBlameToggle<CR>", { desc = "[G]it [B]lame [T]oggle" } )
vim.keymap.set("n", "<leader>gbo", ":GitBlameCopySHA<CR>", { desc = "[G]it [B]lame [O]pen URL" } )
vim.keymap.set("n", "<leader>gby", ":GitBlameCopySHA<CR>", { desc = "[G]it [B]lame [Y]ank SHA" } )

keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})

-- Toggle term
keymap.set("n", "<C-\\>", ":ToggleTerm<CR>")
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _lazygit_toggle()
  lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

