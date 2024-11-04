local config_path = vim.fn.stdpath("config")
vim.cmd("source " .. config_path .. "/keybindings.vim")
vim.cmd("source " .. config_path .. "/settings.vim")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins", {
        change_detection = {
                enabled = true,  -- automatically check for plugin updates
                notify = false,  -- don't notify when plugins are updated
        }
})

require("core.keymaps")
require("core.options")


local opt = vim.opt
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4

-- vim.cmd [[colorscheme darcula]]

