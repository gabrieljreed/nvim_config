local cwd = vim.fn.getcwd()
cwd = string.lower(cwd)
local in_obsidian = string.find(cwd, "obsidian")

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  cond = in_obsidian,
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "obsidian-vault",
        path = "~/Documents/obsidian-vault",
      }
    }
  }
}
