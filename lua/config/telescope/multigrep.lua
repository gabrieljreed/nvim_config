local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local M = {}

local live_multigrep = function (opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  -- Custom finder
  local finder = finders.new_async_job {
    command_generator = function (prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ") -- This is where we say that two spaces is our separator
      local args = { "rg" }
      if pieces[1] then -- Remember - this is actually the first argument! (1-based indexing)
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g") -- Glob files
        table.insert(args, pieces[2])
      end

      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten{
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  -- Custom picker
  -- Has a finder, sorter, and previewer
  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts), -- Use normal previewer
    sorter = require("telescope.sorters").empty(), -- Don't sort, entries are already sorted from ripgrep
  }):find()
  
end

M.setup = function()
  vim.keymap.set("n", "<leader>mg", live_multigrep, { desc = "[M]ulti [G]rep" })
end

-- live_multigrep()

return M
