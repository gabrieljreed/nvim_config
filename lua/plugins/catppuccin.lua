-- Color theme
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      local configs = require("catppuccin")
      configs.setup({
        flavour = "mocha",
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
        }
      })
    end
}
