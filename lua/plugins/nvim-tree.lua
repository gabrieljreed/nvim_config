return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,  -- Lazy loading isn't recommended by the docs - https://github.com/nvim-tree/nvim-tree.lua/wiki/Installation
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "b0o/nvim-tree-preview.lua",
  },
  config = function ()
    require("nvim-tree").setup {
      view = {
        relativenumber = true,
        width = 40,
      },
      filters = {
        custom = {
          "^.git$",
          "*.pyc$",
        }
      },

      on_attach = function (bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        local preview = require("nvim-tree-preview")

        vim.keymap.set("n", "P", preview.watch, opts "Preview (Watch)")
        vim.keymap.set("n", "<Esc>", preview.unwatch, opts "Close Preview/Unwatch")
        vim.keymap.set("n", "<C-f>", function() return preview.scroll(4) end, opts "Scroll Down")
        vim.keymap.set("n", "<C-b>", function() return preview.scroll(-4) end, opts "Scroll Up")
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Show help"))

        vim.keymap.set("n", "<C-q>", function ()
         local ok, node = pcall(api.tree.get_node_under_cursor)
          if ok and node then
            api.node.open.vertical()
          end
        end, opts "Open in split")

        vim.keymap.set("n", "<Tab>", function ()
         local ok, node = pcall(api.tree.get_node_under_cursor)
          if ok and node then
            if node.type == "directory" then
              api.node.open.edit()
            else
              preview.node(node, { toggle_focus = true })
            end
          end
        end, opts "Preview")

      end,

    }
  end
}
