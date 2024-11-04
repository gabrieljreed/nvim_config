-- Highlight words under cursor
return {
    "tzachar/local-highlight.nvim",
    enabled = false,
    opts = {
        file_types = nil,  -- Attach to all file types
        hlgroup = "Search",
        cw_hlgroup = nil,
        min_match_length = 1,
        max_match_length = math.huge,
        highlight_single_match = true,
    }
}
