-- Inline git blame (Linux only for now)

local os_name = vim.loop.os_uname().sysname

return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  cond = os_name ~= "Windows_NT",
  enabled = false,
}
