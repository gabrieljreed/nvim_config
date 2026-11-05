require("core.spell").enable_local_spell()

vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2

-- Toggle markdown checkbox
vim.keymap.set("n", "<C-l>", function()
  local line = vim.api.nvim_get_current_line()
  local new
  if line:match("%[ %]") then
    new = line:gsub("%[ %]", "[x]", 1)
  elseif line:match("%[[xX]%]") then
    new = line:gsub("%[[xX]%]", "[ ]", 1)
  elseif line:match("^%s*[-*+]") then
    -- No checkbox yet: add one after the list marker
    new = line:gsub("^(%s*[-*+])%s*", "%1 [ ] ", 1)
  else
    -- No list marker yet: add one with a checkbox
    new = line:gsub("^(%s*)", "%1- [ ] ", 1)
  end
  vim.api.nvim_set_current_line(new)
end, { buffer = true, desc = "Toggle markdown checkbox" })
