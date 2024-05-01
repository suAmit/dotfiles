return {
	language = {
		treesitter = {
			-- syntex
			syntex = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"lua",
			},
		},
		mason = {
			-- server
			-- To run LSP setup server in ../lsp/lspconfig.lua file
			LSP = {
				"tsserver",
				"html",
				"cssls",
				-- "lua_ls"
			},
			-- formetter
			mason_tool = {
				"prettier",
				"eslint_d",
				-- "stylua"
			},
		},
		-- ../lsp/formatting.lua
		formetter = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			-- svelte = { "prettier" },
			-- markdown = { "prettier" },
			-- graphql = { "prettier" },
			-- liquid = { "prettier" },
			-- lua = { "stylua" },
			-- python = { "isort", "black" }, --list formetter in order to which one use firsttrees
		},
		-- ../lsp/linting.lua
		lint = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			-- svelte = { "eslint_d" },
			-- python = { "pylint" },
		},
	},
}
