return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- Use latest release instead of latest commit
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
      },
    },
  },
}
