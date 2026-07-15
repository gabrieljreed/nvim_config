local opt = vim.opt
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

opt.completeopt = { "noinsert", "menuone", "noselect" }
opt.hidden = true
opt.smartcase = true    -- Case insensitive search on lowercase
opt.showmatch = true    -- Show matching parentheses
opt.tabstop = 4         -- 1 tab = 4 spaces
opt.shiftwidth = 4      -- Shift uses 4 spaces
opt.expandtab = true    -- Use spaces instead of tabs
opt.smartindent = true  -- Auto indent new lines
opt.autoindent = true
opt.inccommand = "split"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.title = true
opt.wildmenu = true
opt.autoread = true
opt.ttyfast = true
vim.bo.softtabstop = 4
opt.fillchars={eob = ' '}
opt.cursorline = true

vim.cmd.colorscheme "tokyonight-night"

opt.foldcolumn="2"

vim.g.have_nerd_font = true
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

-- Case-insensitive searching unless \C or capital letters in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Minimum lines to show above/below cursor
vim.opt.scrolloff = 10

-- Disable swapfiles
vim.opt.swapfile = false

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Save session options
vim.opt.sessionoptions = "curdir,globals,help,tabpages,winsize,localoptions"

vim.opt.conceallevel = 0

if is_windows then
  vim.opt.shell = "powershell"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd.checktime()
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
