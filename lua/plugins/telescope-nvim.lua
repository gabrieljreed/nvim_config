-- Fuzzy file finder
return {
  "nvim-telescope/telescope.nvim",
  event = "vimEnter",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      -- Makes telescope search faster
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function ()
    require("telescope").setup {
      extensions = {
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          previewer = true,
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer",
            }
          }
        }
      }
    }

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "[F]ind [F]iles (git)" })
    vim.keymap.set("n", "<leader>FF", builtin.find_files, { desc = "[F]ind [F]iles (all)" })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "[L]ive [G]rep" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent files ('.' for repeat)" })
    vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [T]elescope" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>fo", builtin.buffers, { desc = "[F]ind in [O]pen buffers" })

    require("config.telescope.multigrep").setup()

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>fb', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = true,
      })
    end, { desc = '[F]ind in [B]uffer' })

    vim.keymap.set('n', '<leader>ds', function()
      builtin.lsp_document_symbols(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = true,
      })
    end, { desc = '[D]ocument [S]ymbols' })

  -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[F]ind in [C]onfig files' })

  end
}
