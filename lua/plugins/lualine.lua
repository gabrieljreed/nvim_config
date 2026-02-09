return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
      },
      sections = {
        lualine_c = {{ "filename", path = 1 }}
      },
      inactive_sections = {  -- What to show in inactive panes/statuslines
        lualine_c = {{ "filename", path = 1 }}
      },
    })
  end
}
