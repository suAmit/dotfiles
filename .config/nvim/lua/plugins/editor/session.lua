return {
  "rmagatti/auto-session",
  -- keys = { { "<leader>w" }, { "<A-s>" } },
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },

      session_lens = {
        prompt_title = "YEAH SESSIONS",
        buftypes_to_ignore = {},
        layout_config = {
          width = 0.5,
          height = 0.4,
        },
        load_on_setup = true,
        previewer = false,
      },
    })

    local wk = require("which-key")
    wk.register({ w = { name = "Session" } }, { prefix = "<leader>" })

    local keymap = vim.keymap
    keymap.set({ "n" }, "<A-s>", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
  end,
}
