local opt = vim.opt

opt.smartcase = true    -- Case insensitive search on lowercase
opt.showmatch = true    -- Show matching parentheses
opt.tabstop = 4         -- 1 tab = 4 spaces
opt.shiftwidth = 4      -- Shift uses 4 spaces
opt.expandtab = true    -- Use spaces instead of tabs
opt.smartindent = true  -- Auto indent new lines
opt.autoindent = true
vim.bo.softtabstop = 4
opt.scrolloff=1
opt.fillchars={eob = ' '}

vim.cmd.colorscheme "catppuccin"

-- opt.foldlevel = 20
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter folds
opt.foldcolumn="2"

-- NERDTree show and use relative line numbers
vim.g.NERDTreeShowLineNumbers = 1
vim.api.nvim_create_autocmd("FileType", {
    pattern = "nerdtree",
    callback = function()
        vim.opt_local.relativenumber = true
    end,
})
vim.g.NERDTreeIgnore = {
  "\\.pyc$",
  "__pycache__",
  ".git",
}

vim.g.have_nerd_font = true

-- Case-insensitive searching unless \C or capital letters in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Minimum lines to show above/below cursor
vim.opt.scrolloff = 10

