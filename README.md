# Neovim Config

## Fresh Machine Setup

After cloning this config on a new machine:

1. Start Neovim once so `lazy.nvim` installs plugins.
2. Run `:MasonToolsInstall` to install the configured LSP servers and related Mason-managed tools.

This config no longer auto-runs Mason installs on startup, so the manual `:MasonToolsInstall` step is required on a fresh machine.

## External Prerequisites

These are referenced directly by the config and are not installed by Mason:

- `lazygit`
  Used by the `toggleterm` floating Lazygit mapping on `<leader>gg`.
- `sqlite3.dll` at `C:/Program Files/sqlite/sqlite3.dll`
  Used by the Telescope `smart-open` extension on Windows.
- `zig` or `gcc`
  Used by Treesitter parser compilation. The config explicitly sets Treesitter compilers to `zig` and `gcc`.

## Notes

- TypeScript support uses `ts_ls` and the config notes that `typescript` and `typescript-language-server` may need to be installed with npm in some environments.
- The active colorscheme is `tokyonight`.
- `catppuccin` is present in the lockfile but disabled in the config.
