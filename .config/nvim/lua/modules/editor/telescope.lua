return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_strategy = nil,
        layout_config = nil,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        live_grep = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = true,
          },
        },
        buffers = {
          previewer = false,
          layout_config = {
            width = 0.7,
            height = 0.4,
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
        find_files = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        oldfiles = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        grep_string = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        git_files = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          }
        },
      },
    })

    telescope.load_extension("fzf")

    local wk = require("which-key")
    wk.register({f = {name = "Telescope"}},{prefix = "<leader>"})
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffer list" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Search in git files" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
