-- Enables sticky scrolling
return {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        separator = nil,
        zindex = 20,
        mode = "cursor",  -- line used to calculate context, can set to "cursor" or "topline"
    }
}
