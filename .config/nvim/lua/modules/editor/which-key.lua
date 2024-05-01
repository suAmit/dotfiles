return {
  "folke/which-key.nvim",
  keys = {"<leade>"},
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local which_key = require("which-key")

    local opts = {
      prefix = "<leader>",
    }

    local groups = {
      s = { name = "Split" },
      m = { name = "Linting and Formatting" },
      g = { name = "LSP command" },
      r = { name = "TODO's" },
      t = { name = "Tabs" },
      x = { name = "Trouble" },
      h = { name = "gitsigns" },
    }

    which_key.register(groups, opts)
  end
}
