return {
  "nanozuki/tabby.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function ()
    require("tabby").setup({
      preset = "active_wins_at_tail",
      option = {
        theme = {
          fill = "TabLineFill",
          head = "TabLine",
          current_tab = "TabLineSel",
          tab = "TabLine",
          win = "TabLine",
          tail = "TabLine",
        },
        nerdfont = true,
        lualine_theme = nil,
        tab_name = {
          name_fallback = function (tabid)
            return tabid
          end
        },
        buf_name = {
          mode = "unique"
        }
      }
    })
  end
}
