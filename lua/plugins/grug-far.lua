return {
	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		keys = {
			{ "<leader>sr", function() require("grug-far").open() end, desc = "Search & Replace (Grug-far)" },
		},
	},
}
