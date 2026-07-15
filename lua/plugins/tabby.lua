return {
  "nanozuki/tabby.nvim",
  cmd = "Tabby",
  keys = {
    {
      "<leader>tt",
      function()
        vim.cmd.tabnew()
        vim.cmd("Tabby rename_tab new_tab")
      end,
      desc = "New tab",
    },
    { "<leader>rt", ":Tabby rename_tab ", desc = "[R]ename [T]ab" },
    { "<leader>jj", "<cmd>Tabby jump_to_tab<CR>", desc = "[J]ump to tab" },
  },
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
  end,
}
