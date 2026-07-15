return {
  "danymat/neogen",
  cmd = "Neogen",
  keys = {
    { "<leader>dg", "<cmd>Neogen<CR>", desc = "[D]ocumentation [G]enerate" },
  },
  config = function ()
    require("neogen").setup({
      snippet_engine = "luasnip",
    })
  end,
}
