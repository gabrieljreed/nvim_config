-- Code Tree Support / Syntax Highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    auto_install = true,  -- Auto install syntax support when entering new file type buffer
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
      "luadoc",
      "query",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "yaml",
    },
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
    require ("nvim-treesitter.install").compilers = {"zig", "gcc"}
    -- Install scoop, then `scoop install zig` on Windows
  end
}
