-- Fuzzy file finder
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    {
      "<leader>FF",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "[F]ind [F]iles (all)",
    },
    {
      "<leader>lg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "[L]ive [G]rep",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "[F]ind [R]ecent files ('.' for repeat)",
    },
    {
      "<leader>ft",
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "[F]ind [T]elescope",
    },
    {
      "<leader>fk",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "[F]ind [K]eymaps",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "[F]ind [H]elp",
    },
    {
      "<leader>fo",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "[F]ind in [O]pen buffers",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(
          require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = true,
          })
        )
      end,
      desc = "[F]ind in [B]uffer",
    },
    {
      "<leader>f/",
      function()
        require("telescope.builtin").live_grep(
          require("telescope.themes").get_dropdown({
            search_dirs = { vim.fn.expand("%:p") },
            prompt_title = "Live Grep (Current Buffer)",
            path_display = { "hidden" },
            winblend = 10,
            previewer = true,
          })
        )
      end,
      desc = "[F]ind with regex [/] in buffer",
    },
    {
      "<leader>ds",
      function()
        require("telescope.builtin").lsp_document_symbols(
          require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = true,
          })
        )
      end,
      desc = "[D]ocument [S]ymbols",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "[F]ind in [C]onfig files",
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      -- Makes telescope search faster
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      defaults = {
        path_display = { "filename_first" },
        show_line = true,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = require("telescope.actions").select_vertical,
            ["<C-f>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
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
            },
          },
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopePreviewerLoaded",
      callback = function()
        vim.wo.number = true
      end,
    })

    require("config.telescope.multigrep").setup()
  end,
}
