return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "lewis6991/async.nvim",
  },
  config = function()
    require("refactoring").setup()

    -- Remaps for the refactoring operations currently offered by the plugin
    vim.keymap.set("x", "<leader>re", ":Refactor extract ")
    vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
    
    -- Extract variable supports only visual mode
    vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
    
    -- Inline func supports only normal
    vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
    
    -- Inline var supports both normal and visual mode
    vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
    
    -- Extract block supports only normal mode
    vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
    vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
  end,
}
