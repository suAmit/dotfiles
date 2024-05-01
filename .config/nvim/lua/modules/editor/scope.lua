return {
  "tiagovla/scope.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  config = function()
    local scope = require("scope")
    local telescope =  require("telescope")

    scope.setup()

    telescope.load_extension("scope")

    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "bl", "<cmd>Telescope scope buffers<cr>", { desc = "List of buffers" })
  end
}
