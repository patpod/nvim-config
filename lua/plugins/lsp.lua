return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					{ "williamboman/mason.nvim", opts = {} },
				},
			},
			"WhoIsSethDaniel/mason-tool-installer",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP : " .. desc })
					end

					-- Go to the definition of the word under the cursor
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					-- Find referencer for the word under the cursor
					map("gr", require("telescope.builtin").lsp_references, "References")
					-- Jump to the implementation of the word under the cursor
					-- Useful for languages that can declare types without implementation
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					-- Jump to the type of the word under the cursor
					map("gy", require("telescope.builtin").lsp_type_definitions, "[G]oto T[y]pe Definition")
					-- map("gD", require("telescope.builtin").lsp)
				end,
			})
			-- Language specific LSP configurations
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
}
