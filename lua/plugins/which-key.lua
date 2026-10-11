return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "classic",
			spec = {
				{ "<leader>f", group = "file/find" },
				{ "<leader>h", group = "git hunk" },
				{ "<leader>r", group = "rename" },
				{ "<leader>c", group = "code action" },
				{ "<leader>x", group = "diagnostics/trouble" },
				{ "<leader>q", group = "session" },
				{ "<leader>s", group = "search/replace" },
				{ "<leader>o", group = "orgmode" },
				{ "<leader>t", group = "tabs" },
			},
			win = {
				border = "rounded",
				padding = { 1, 2 },
			},
		},
		keys = {
			{
				"<leader>?",
				"<cmd>WhichKey<cr>",
				desc = "Which-key All Mappings",
			},
		},
	},
}
