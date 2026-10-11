return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "org" },
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- or 'nvim-tree/nvim-web-devicons'
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		file_types = { "markdown", "org" },
		-- This is the default, but ensures it's on for reading
		enabled = true,
		render_modes = { "n", "c", "t" }, -- Normal, Command, and Terminal modes
		anti_conceal = {
			ignore = {
				link = true,
			},
		},
		win_options = {
			concealcursor = {
				default = vim.o.concealcursor,
				rendered = "nc",
			},
		},
		heading = {
			-- Makes headers look like clean blocks
			sign = false,
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
		},
		code = {
			-- Adds a background to code blocks
			style = "full",
			left_pad = 2,
			right_pad = 2,
			terminal_colors = true,
		},
		latex = {
			enabled = true,
			converter = "latex2text",
			highlight = "RenderMarkdownMath",
		},
	},
}
