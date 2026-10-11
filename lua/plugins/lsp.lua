return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Register custom scheme-langserver if not present
			if not configs.scheme_langserver then
				configs.scheme_langserver = {
					default_config = {
						cmd = { "scheme-langserver" },
						filetypes = { "scheme", "scm", "ss", "sps", "sls", "sld" },
						root_dir = lspconfig.util.root_pattern(".git", "*.scm", "*.ss"),
						settings = {},
					},
				}
			end

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"jdtls",
					"pyright",
					"bashls",
					"texlab",
					"svelte",
				},
				handlers = {
					function(server_name)
						if server_name == "codebook" or server_name == "codebook_lsp" then
							return
						end

						local server_opts = {
							capabilities = capabilities,
							on_new_config = function(new_config, new_root_dir)
								if new_root_dir and string.match(new_root_dir, "^oil://") then
									new_config.root_dir = nil
								end
							end,
						}

						-- Specific server performance tuning to prevent memory/CPU hangs
						if server_name == "clangd" then
							server_opts.cmd = {
								"clangd",
								"--background-index",
								"-j=4", -- Limit background indexing threads to prevent CPU/RAM freezes
								"--clang-tighten-gnu-extensions",
								"--fallback-style=LLVM",
								"--fallback-flags=-std=c++23",
								"--header-insertion=never",
							}
						elseif server_name == "svelte" then
							server_opts.on_init = function(client)
								client.server_capabilities.semanticTokensProvider = nil
							end
							server_opts.on_attach = function(client, bufnr)
								client.server_capabilities.semanticTokensProvider = nil
								pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
							end
						elseif server_name == "pyright" then
							server_opts.settings = {
								python = {
									analysis = {
										autoSearchPaths = true,
										useLibraryCodeForTypes = true,
										diagnosticMode = "openFilesOnly", -- Prevent pyright from hanging on huge venvs
									},
								},
							}
						elseif server_name == "lua_ls" then
							server_opts.settings = {
								Lua = {
									telemetry = { enable = false },
									workspace = { checkThirdParty = false },
								},
							}
						elseif server_name == "texlab" then
							server_opts.settings = {
								texlab = {
									build = {
										executable = "latexmk",
										args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
										onSave = true,
									},
									forwardSearch = {
										executable = "zathura",
										args = { "--synctex-forward", "%l:1:%f", "%p" },
									},
									chktex = { onOpenAndSave = true },
									diagnosticsDelay = 300,
								},
							}
						end

						lspconfig[server_name].setup(server_opts)
					end,
				},
			})

			-- Safely initialize scheme_langserver if executable exists
			if vim.fn.executable("scheme-langserver") == 1 then
				lspconfig.scheme_langserver.setup({
					capabilities = capabilities,
				})
			end

			-- Keymap to quickly restart LSP servers without quitting Neovim
			vim.keymap.set("n", "<leader>rs", function()
				vim.cmd("LspRestart")
				vim.notify("LSP servers restarted!", vim.log.levels.INFO, { title = "LSP" })
			end, { desc = "Restart LSP Servers" })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					if client.name == "svelte" then
						client.server_capabilities.semanticTokensProvider = nil
						pcall(vim.lsp.semantic_tokens.stop, args.buf, client.id)
					end

					if vim.bo[args.buf].filetype == "oil" then
						return
					end

					local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
					end

					map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
					map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
					map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
					map("n", "<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
					map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous Diagnostic")
					map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next Diagnostic")
				end,
			})
		end,
	},
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				menu = {
					border = "rounded",
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					},
				},
				documentation = {
					auto_show = true,
					window = { border = "rounded" },
				},
			},
		},
	},
}
