return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		-- disable MRU
		startify.section.mru.val = { { type = "padding", val = 0 } }

		-- Set menu
		startify.section.top_buttons.val = {
			startify.button("e", ">  New File", "<cmd>ene<CR>"),
      startify.button("SPC e", ">  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      startify.button("SPC ff", "> 󰱼 Find File", "<cmd>Telescope find_files<CR>"),
      startify.button("SPC fs", ">  Find Word", "<cmd>Telescope live_grep<CR>"),
      startify.button("SPC wr", "> 󰁯 Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
		}

		-- Send config to alpha
		alpha.setup(startify.config)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
