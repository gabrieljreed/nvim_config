return {
  "danymat/neogen",
  -- config = true,
  config = function ()
    require("neogen").setup({
      snippet_engine = "luasnip",
    })
  end
}
