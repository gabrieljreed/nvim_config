-- Highlight words under cursor
return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "IlluminatePause",
    "IlluminateResume",
    "IlluminateToggle",
    "IlluminatePauseBuf",
    "IlluminateResumeBuf",
    "IlluminateToggleBuf",
    "IlluminateDebug",
    "IlluminationDisable",
    "IlluminationEnable",
    "IlluminationToggle",
  },
  config = function ()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      filetypes_denylist = {
        "NvimTree",
        "TelescopePrompt",
        "lazy",
        "mason",
      },
      under_cursor = true,
      min_count_to_highlight = 1,
    })
  end,
}
