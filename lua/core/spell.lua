local M = {}

local DEFAULT_MAX_FILE_SIZE = 200 * 1024

function M.enable_local_spell(opts)
  opts = opts or {}

  local max_file_size = opts.max_file_size or DEFAULT_MAX_FILE_SIZE
  local bufname = vim.api.nvim_buf_get_name(0)
  local file_size = bufname ~= "" and vim.fn.getfsize(bufname) or 0

  if file_size > max_file_size then
    vim.opt_local.spell = false
    return
  end

  vim.opt_local.spelllang = opts.spelllang or "en_us"
  vim.opt_local.spell = true
end

return M
