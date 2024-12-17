vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs ([t]ab[o]nly)" })

-- Nvim Tree
keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>", { desc = "Open/Focus NvimTree" })
keymap.set("n", "<leader>rf", ":NvimTreeFindFile<CR>", { desc = "[R]eveal [F]ile in NERD Tree" })
keymap.set("n", "<leader>eq", ":NvimTreeClose<CR>", { desc = "Close NvimTree" })

-- Git Blame
vim.keymap.set("n", "<leader>gbt", ":GitBlameToggle<CR>", { desc = "[G]it [B]lame [T]oggle" } )
vim.keymap.set("n", "<leader>gbo", ":GitBlameCopySHA<CR>", { desc = "[G]it [B]lame [O]pen URL" } )
vim.keymap.set("n", "<leader>gby", ":GitBlameCopySHA<CR>", { desc = "[G]it [B]lame [Y]ank SHA" } )

keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})

-- Toggle term
keymap.set("n", "<C-\\>", ":ToggleTerm<CR>")
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts) -- Exit terminal mode
  vim.keymap.set("t", "<C-\\>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)  -- Close terminal
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>p]], opts)  -- Move to previous window/pane
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Lazygit toggle
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _lazygit_toggle()
  lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- Clear Shada cache
vim.api.nvim_create_user_command("ClearShada", function ()
    local shada_path = vim.fn.expand(vim.fn.stdpath("data") .. "/shada")
    local files = vim.fn.glob(shada_path .. "/*", false, true)
    local all_success = 0
    for _, file in ipairs(files) do
      local file_name = vim.fn.fnamemodify(file, ":t")
      if file_name == "main.shada" then
        -- Skip main shada file
        goto continue
      end
      local success = vim.fn.delete(file)
      all_success = all_success + success
      if success ~= 0 then
        vim.notify("Couldn't delete file '" .. file_name .. "'", vim.log.levels.WARN)
      end
      ::continue::
    end
    if all_success == 0 then
      vim.print("Successfully cleared all .tmp shada files")
    end
  end,
  { desc = "Clear all .tmp shada files" }
)
vim.keymap.set("n", "<leader>cs", ":ClearShada<CR>", { desc = "[C]lear all .tmp [S]hada files" })

-- Copy current file path
vim.keymap.set("n", "<leader>cf", ":let @+=expand('%:p')<CR>", { desc = "[C]opy current [F]ile path" })

-- Toggle Copilot
vim.keymap.set("n", "<leader>gcd", ":Copilot disable<CR>", { desc = "[G]itHub [C]opilot [D]isable" })
vim.keymap.set("n", "<leader>gce", ":Copilot enable<CR>", { desc = "[G]itHub [C]opilot [E]nable" })

