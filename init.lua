local config_path = vim.fn.stdpath("config")
vim.cmd("source " .. config_path .. "/keybindings.vim")
vim.cmd("source " .. config_path .. "/settings.vim")

-- Bootstrap lazy
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
    })
end
vim.opt.rtp:prepend(lazy_path)

-- Need to set this here for it to work properly
vim.g.mapleader = " "

require("lazy").setup("plugins", {
    change_detection = {
        enabled = true,  -- automatically check for plugin updates
        notify = false,  -- don't notify when plugins are updated
    }
})

require("core.keymaps")
require("core.options")

