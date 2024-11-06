return {
  "rmagatti/auto-session",
  lazy = false,

  ---Enable autocomplete for opts
  ---@module "auto-session"
  ---#type AutoSession.config
  opts = {
    suppressed_dirs = { "~/", "~/Downloads", "/" },
    -- log_level = "debug",
  }
}
