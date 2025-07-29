-- LSP Support
local os_name = vim.loop.os_uname().sysname

if os_name == "Windows_NT" then
  pyright = "pyright"
else
  pyright = "pyright@1.1.351"  -- Need this version to work on Laika Rocky9 Machines with old version of node
end

return {
  -- LSP Configuration
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- We're pinning before 2.0 because it caused a bunch of problems
    { 'williamboman/mason.nvim', version="^1.0.0" },
    { 'williamboman/mason-lspconfig.nvim', version="^1.0.0" },

    -- Auto-Install LSPs, linters, formatters, debuggers
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
        'cssls',
        'html',
        'lua_ls',
        'jsonls',
        'marksman',
        'quick_lint_js',
        'yamlls',
        pyright,
        "ts_ls",  -- Need to install typescript and typescript-language-server with npm: `npm install -g typescript typescript-language-server`
      }
    })

    require('mason-tool-installer').setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        -- 'black',
        -- 'debugpy',
        -- 'flake8',
        -- 'isort',
        -- 'mypy',
        -- 'pylint',
      },
    })

    -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    vim.api.nvim_command('MasonToolsInstall')

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Call setup on each LSP server
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          --  Disable weird popup on Mac
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    }

    -- Python LSP settings
    local function get_venv_path()
      local cwd = vim.fn.getcwd()
      return cwd .. "/venv"
    end

    -- Use virtual environment Python interpreter
    lspconfig.pyright.setup {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
          venvPath = get_venv_path(),
          venv = "venv",
        }
      }
    }

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Go to definition
        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinitions")

        -- Go to references
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

        -- Rename
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Document symbols
        -- map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

        -- Workspace symbols
        map("<leader>ws", require("telescope.builtin").lsp_workspace_symbols, "[W]orkspace [S]ymbols")

        -- Show hover
        map("<leader>gh", vim.lsp.buf.hover, "[G]o [H]over")
      end
    })

    -- Show diagnostics in a floating window
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = true,
      update_in_insert = true,
      underline = true,
    })
    vim.keymap.set("n", "<leader>ge", vim.diagnostic.open_float, { desc = "[G]o [E]rror" })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
      }
    },
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    -- By default, Neovim doesn't support everything that is in the LSP specification.
    -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    -- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

  end
}
