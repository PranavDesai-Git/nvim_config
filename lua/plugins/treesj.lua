return {
  "Wansmer/treesj",
  keys = {
    { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Toggle split/join" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      max_join_length = 150,
    })
  end,
}
