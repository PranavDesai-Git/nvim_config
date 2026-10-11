return {
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 1,
        width = 120,
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
      },
    }
  },
  {
    "folke/twilight.nvim",
    lazy = true,
    opts = {
      exclude = { "noice", "prompt", "nui", "" },
    }
  }
}
