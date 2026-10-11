return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				c = { "clang-format" },
				cpp = { "clang-format" },
				java = { "google-java-format" },
				tex = { "latexindent" },
				latex = { "latexindent" },
			},
			formatters = {
				stylua = {
					prepend_args = { "--indent-width", "4", "--indent-type", "Spaces" },
				},
				prettier = {
					prepend_args = { "--tab-width", "4" },
				},
				prettierd = {
					prepend_args = { "--tab-width", "4" },
				},
				["clang-format"] = {
					prepend_args = { "--style={IndentWidth: 4, TabWidth: 4}" },
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
