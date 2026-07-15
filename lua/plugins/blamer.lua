-- Inline git blame (Windows only for now)

local os_name = vim.loop.os_uname().sysname

return {
  "TimothyGCY/blamer.nvim",
  cmd = {
    "BlamerShow",
    "BlamerHide",
    "BlamerToggle",
  },
  keys = {
    { "<leader>gbi", "<cmd>BlamerToggle<CR>", desc = "[G]it [B]lame [I]nline toggle" },
  },
  cond = os_name == "Windows_NT",
}
