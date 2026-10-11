return {
  "folke/snacks.nvim",
  priority = 1000,
  opts = {
    image = {
      formats = {
        "png", "jpg", "jpeg", "gif", "bmp", "webp", "tiff",
        "heic", "avif", "mp4", "mov", "avi", "mkv", "webm", "icns",
      },
    },
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true, ui_select = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
