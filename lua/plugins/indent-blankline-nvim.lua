return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    enabled = true,
    indent = {
      char = "|",
    },
    scope = {
      show_end = false,
    },
  },
}
