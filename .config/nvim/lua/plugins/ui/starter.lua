return {
  "echasnovski/mini.starter",
  config = function()
    local starter = require("mini.starter")
    starter.setup({
      content_hooks = {
        starter.gen_hook.adding_bullet("░ ", true),
        starter.gen_hook.aligning("center", "center"),
      },
      header = table.concat({
        [[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
        [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
        [[/ /\  /  __/ (_) \ V /| | | | | | |]],
        [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
        [[───────────────────────────────────]],
      }, "\n"),
      query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
      items = {
        starter.sections.recent_files(4, false),
        starter.sections.recent_files(4, true),
        starter.sections.builtin_actions(),
      },
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        starter.config.footer = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(starter.refresh)
      end,
    })
  end,
}
