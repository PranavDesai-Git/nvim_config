return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]], -- Ctrl + \ to toggle
				dir = "cwd",
				hide_numbers = true,
				shade_terminals = false, -- Keeps it pitch black
				start_in_insert = true,
				insert_mappings = true,
				terminal_mappings = true,
				persist_size = true,
				direction = "horizontal", -- You can change to "float" or "vertical"
				close_on_exit = true,
				shell = vim.o.shell,
				highlights = {
					Normal = { link = "Normal" },
					NormalFloat = { link = "Normal" },
					FloatBorder = { link = "Normal" },
				},
			})

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], opts) -- Double Esc to exit terminal mode
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)         -- Type 'jk' to exit terminal mode
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function()
					set_terminal_keymaps()
				end,
			})
		end,
	},
}
