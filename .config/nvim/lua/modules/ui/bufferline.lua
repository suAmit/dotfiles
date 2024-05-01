return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  -- config = function()
  --   local status_ok, bufferline = pcall(require, "bufferline")
  --   if not status_ok then
  --     return
  --   end
  --   vim.opt.termguicolors = true
  --   bufferline.setup {}
  -- end     

  config = function()

    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        close_command = "bp|sp|bn|bd! %d",
        right_mouse_command = "bp|sp|bn|bd! %d",
        left_mouse_command = "buffer %d",
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        show_close_icon = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 10,
        show_tab_indicators = true,
        indicator = {
          icon = "┃",
          style = "icon",
        },
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        separator_style = "thin",
        -- separator_style = "slant",
        always_show_bufferline = true,
        diagnostics = false,
        themable = true,
        style_preset = {
          -- bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold
        },
      },
      highlights = {
        background = {
          guifg = comment_fg,
          guibg = "#282c34"
        },
        fill = {
          guifg = comment_fg,
          guibg = "#282c34"
        },
        buffer_selected = {
          guifg = normal_fg,
          guibg = "#3A3E44",
          gui = "bold"
        },
        separator_visible = {
          guifg = "#282c34",
          guibg = "#282c34"
        },
        separator_selected = {
          guifg = "#282c34",
          guibg = "#282c34"
        },
        separator = {
          guifg = "#282c34",
          guibg = "#282c34"
        },
        indicator_selected = {
          guifg = "#282c34",
          guibg = "#282c34"
        },
        modified_selected = {
          guifg = string_fg,
          guibg = "#3A3E44"
        }
      }
    })
  end
}
