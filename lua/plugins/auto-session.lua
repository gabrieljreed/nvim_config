return {
  "rmagatti/auto-session",
  lazy = false,

  ---Enable autocomplete for opts
  ---@module "auto-session"
  ---#type AutoSession.config
  opts = {
    suppressed_dirs = { "~/", "~/Downloads", "/" },
    auto_restore = false,
    lazy_support = true,
    -- log_level = "debug",
  }
}
