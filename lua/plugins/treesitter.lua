return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		priority = 1000,
		config = function()
			local status, treesitter = pcall(require, "nvim-treesitter.configs")
			if not status then
				status, treesitter = pcall(require, "nvim-treesitter.config")
			end
			if not status then
				return
			end
			treesitter.setup({
				ensure_installed = {
					"c",
					"java",
					"lua",
					"vim",
					"vimdoc",
					"javascript",
					"typescript",
					"tsx",
					"python",
					"bash",
					"markdown",
					"markdown_inline",
					"org",
					"latex",
					"bibtex",
					"svelte",
					"css",
					"html",
					"norg",
					"scss",
					"typst",
					"vue",
					"regex",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				indent = {
					enable = true,
					disable = { "python", "yaml" },
				},
			})

			local function start_treesitter(buf)
				buf = buf or vim.api.nvim_get_current_buf()
				if not vim.api.nvim_buf_is_valid(buf) then
					return
				end
				local ft = vim.bo[buf].filetype
				if ft and ft ~= "" then
					pcall(vim.treesitter.start, buf, ft)
				end
			end

			vim.api.nvim_create_autocmd({ "FileType", "BufReadPost", "BufEnter" }, {
				callback = function(args)
					start_treesitter(args.buf)
				end,
			})

			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				start_treesitter(buf)
			end
		end,
	},
}
