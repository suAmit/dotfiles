return {
  "folke/which-key.nvim",
  tag = "v2.1.0",
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
      f = { name = "Find" },
      g = { name = "LSP/Git" },
      h = { name = "gitsigns" },
      l = { name = "Terminal" },
      m = { name = "Linting and Formatting" },
      r = { name = "TODO's" },
      s = { name = "Search" },
      S = { name = "Split" },
      t = { name = "Tabs" },
      w = { name = "Session" },
      x = { name = "Trouble" },
    }

    which_key.register(groups, opts)
  end,
}
