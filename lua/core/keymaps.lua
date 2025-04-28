vim.g.mapleader = " "

-- Movement
vim.keymap.set({"n", "v"}, "gl", "$", { desc = "Move to end of line" })
vim.keymap.set({"n", "v"}, "gh", "^", { desc = "Move to start of line with text" })
vim.keymap.set({"n", "v"}, "gH", "0", { desc = "Move to true start of line" })

-- Tabs
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:Tabby rename_tab new_tab<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs ([t]ab[o]nly)" })

-- Yanking
vim.keymap.set("n", "ygl", "y$", { desc = "Yank to end of line" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste from yank register" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>cf", ":let @+=expand('%:p')<CR>", { desc = "[C]opy current [F]ile path" })

-- Misc
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Open new line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Open new line above" })
vim.keymap.set("n", "<leader>dd", "0D", { desc = "Delete contents of line" })
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader><CR>", "i<CR><ESC>", { desc = "Insert newline" })
vim.keymap.set("n", "<leader>bb", "<C-o>", { desc = "Go back" })
vim.keymap.set("n", "<leader>n", "<C-i>", { desc = "Go next/forward" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous search result" })
vim.cmd("command Q qa!")
vim.cmd("command W w")
vim.keymap.set("n", "<leader>af", ":set foldmethod=expr<CR>", { desc = "Re[A]ctivate [F]olds (set fold method to expression)" })
vim.keymap.set("n", "<leader>bd", ":bd!<CR>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "[G]it [N]ext hunk" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "[Git]it [P]revious hunk" })

-- Quickfix
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>", { desc = "Qui[C]kfix [N]ext" })
vim.keymap.set("n", "<leader>cb", "<cmd>cnext<CR>", { desc = "Qui[C]kfix [B]ack" })

-- Nvim Tree
vim.keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>", { desc = "Open/Focus NvimTree" })
vim.keymap.set("n", "<leader>rf", ":NvimTreeFindFile<CR>", { desc = "[R]eveal [F]ile in NERD Tree" })
vim.keymap.set("n", "<leader>eq", ":NvimTreeClose<CR>", { desc = "Close NvimTree" })

-- Git Blame
local os_name = vim.loop.os_uname().sysname
if os_name == "Windows_NT" then
  vim.keymap.set("n", "<leader>gbt", ":BlamerToggle<CR>", { desc = "[G]it [B]lame [T]oggle" } )
else
  vim.keymap.set("n", "<leader>gbt", ":GitBlameToggle<CR>", { desc = "[G]it [B]lame [T]oggle" } )
  vim.keymap.set("n", "<leader>gbo", ":GitBlameCopySHA<CR>", { desc = "[G]it [B]lame [O]pen URL" } )
  vim.keymap.set("n", "<leader>gby", ":GitBlameCopySHA<CR>", { desc = "[G]it [B]lame [Y]ank SHA" } )
end

vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})

-- Toggle term
vim.keymap.set("n", "<C-\\>", ":ToggleTerm<CR>")
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
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true, desc="Toggle Lazygit" })

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

-- Toggle Copilot
vim.keymap.set("n", "<leader>gcd", ":Copilot disable<CR>", { desc = "[G]itHub [C]opilot [D]isable" })
vim.keymap.set("n", "<leader>gce", ":Copilot enable<CR>", { desc = "[G]itHub [C]opilot [E]nable" })

-- Tabby
vim.keymap.set("n", "<leader>rt", ":Tabby rename_tab ", { desc = "[R]ename [T]ab"})
vim.keymap.set("n", "<leader>jt", ":Tabby jump_to_tab<CR>", { desc = "[J]ump to [T]ab" })

