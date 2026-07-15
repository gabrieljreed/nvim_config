return {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleTerm",
    "TermExec",
  },
  keys = {
    {
      "<C-\\>",
      "<cmd>ToggleTerm<CR>",
      desc = "Toggle terminal",
    },
    {
      "<leader>gg",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
        lazygit:toggle()
      end,
      desc = "Toggle Lazygit",
    },
  },
  version = "*",
  config = function()
    require("toggleterm").setup({
      on_open = function(term)
        local opts = { buffer = term.bufnr }
        vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-\\>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>p]], opts)
      end,
    })
  end,
}
