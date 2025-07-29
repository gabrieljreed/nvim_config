-- Inline git blame (Windows only for now)

local os_name = vim.loop.os_uname().sysname

return {
  "TimothyGCY/blamer.nvim",
  cond = os_name == "Windows_NT",
}
