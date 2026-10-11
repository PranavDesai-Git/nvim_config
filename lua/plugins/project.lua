return {
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			local project_nvim = require("project_nvim")
			project_nvim.setup({
				detection_methods = { "pattern" },
				patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "pyproject.toml" },
				show_hidden = true,
				silent_chdir = true,
			})

			-- Automatically index ~/.config, ~/.suckless, and ~/Projects subdirectories into Telescope Projects
			local history = require("project_nvim.utils.history")
			local project = require("project_nvim.project")

			local base_dirs = {
				vim.fn.expand("~/.config"),
				vim.fn.expand("~/.suckless"),
			}

			local projects_dir = vim.fn.expand("~/Projects")
			local handle = vim.uv.fs_scandir(projects_dir)
			if handle then
				while true do
					local name, type = vim.uv.fs_scandir_next(handle)
					if not name then
						break
					end
					if type == "directory" then
						table.insert(base_dirs, projects_dir .. "/" .. name)
					end
				end
			end

			local existing = history.get_recent_projects()
			local existing_map = {}
			for _, p in ipairs(existing) do
				existing_map[p] = true
			end

			for _, dir in ipairs(base_dirs) do
				if not existing_map[dir] and vim.fn.isdirectory(dir) == 1 then
					table.insert(history.session_projects, dir)
				end
			end

			pcall(function()
				require("telescope").load_extension("projects")
			end)
		end,
	},
}
