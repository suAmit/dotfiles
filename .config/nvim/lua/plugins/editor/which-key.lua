return {
  "folke/which-key.nvim",
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
      s = { name = "Search" },
      m = { name = "Linting and Formatting" },
      g = { name = "LSP/Git" },
      r = { name = "TODO's" },
      w = { name = "Session" },
      t = { name = "Tabs" },
      x = { name = "Trouble" },
      h = { name = "gitsigns" },
      l = { name = "Terminal" },
    }

    which_key.register(groups, opts)
  end,
}
