return {
  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  config = function()
    require("telescope").load_extension("smart_open")
  end,
  dependencies = {
    {
      "kkharji/sqlite.lua",
      init = function()
        -- Detect Windows using jit.os or vim.fn.has
        local is_windows = vim.fn.has("win32") == 1

        if is_windows then
          vim.g.sqlite_clib_path = "C:/Program Files/sqlite/sqlite3.dll"
        end
      end,
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
}
