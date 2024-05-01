local function setup_macro_refresh(lualine)
  vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
      lualine.refresh({
        place = { "statusline" },
      })
    end,
  })
  vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
      local timer = vim.loop.new_timer()
      timer:start(
        50,
        0,
        vim.schedule_wrap(function()
          lualine.refresh({
            place = { "statusline" },
          })
        end)
      )
    end,
  })
end

local clients_lsp = function ()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.buf_get_clients(bufnr)
  if next(clients) == nil then
    return ''
  end

  --for more Lsp server deatail uncommit below line and commit LSP return
  -- local c = {}
  -- for _, client in pairs(clients) do
  --   table.insert(c, client.name)
  -- end
  -- return '\u{f085} ' .. table.concat(c, '|')
  
  return ' LSP'
end

local function macro_recording_status()
  local function current_status()
    local register = vim.fn.reg_recording()
    return register == "" and "" or "RECORDING @" .. register
  end
  return { "macro-recording", fmt = current_status }
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.opt.laststatus = 0
  end,
  config = function()
    vim.opt.laststatus = 3
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    setup_macro_refresh(lualine)
    lualine.setup({
      options = {
        -- theme = "rose-pine",
        component_separators = "",
        section_separators = { left = "", right = "" },
        -- disabled_filetypes = { "alpha" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" }, right_padding = 2 },
          macro_recording_status(),
        },
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c ={ 
          -- { "filesize" }, 
          { "filename" },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          -- { "filetype" },
          {clients_lsp}
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { right = "", left = "" }, left_padding = 2 },
        },
      },
      extensions = { "nvim-tree", "fzf" },
    })
  end,
}
