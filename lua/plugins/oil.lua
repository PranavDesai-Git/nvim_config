return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				cleanup_delay_ms = false, 
				watch_for_changes = false,
				view_options = {
					show_hidden = false,
					sort = {
						{ "type", "asc" },
						{ "mtime", "desc" },
					},
				},
				float = {
					padding = 2,
					max_width = 0,
					max_height = 0,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
				},
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-s>"] = "actions.select_vsplit",
					["<C-h>"] = "actions.select_split",
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			vim.api.nvim_create_autocmd("VimEnter", {
				desc = "Open Oil automatically when starting Neovim with no arguments",
				callback = function()
					if vim.fn.argc() == 0 then
						local bufname = vim.api.nvim_buf_get_name(0)
						if bufname == "" then
							require("oil").open(vim.fn.getcwd())
						end
					end
				end,
			})
		end,
	},
}
