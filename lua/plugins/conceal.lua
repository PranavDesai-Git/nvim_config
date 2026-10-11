return {
	{
		"Jxstxs/conceal.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("conceal").setup({
				-- This plugin hooks into Treesitter to hide the "ugly" parts
			})

			-- Set the level so Neovim actually shows the replacements
			vim.opt.conceallevel = 2
		end,
	},
}
