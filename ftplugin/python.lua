-- Python specific settings
require("core.spell").enable_local_spell()

vim.opt.cc = "120"

vim.opt.foldlevel = 20
-- vim.opt.foldmethod = "indent"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter folds
