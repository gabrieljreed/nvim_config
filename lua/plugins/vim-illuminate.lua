-- Highlight words under cursor
return {
  "RRethy/vim-illuminate",
  config = function ()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      under_cursor = true,
      min_count_to_highlight = 1,
    })
  end
}
