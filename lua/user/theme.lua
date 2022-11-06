local M = {}

M.tokyonight = function()
  -- require("tokyonight").setup {
  lvim.builtin.theme.tokyonight.options = {
    style = "storm",
    transparent = lvim.transparent_window,
    terminal_colors = true,
    styles = {
      comments = {},
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark",
      floats = "dark",
    },
    sidebars = {
      "qf",
      "vista_kind",
      "terminal",
      "packer",
      "spectre_panel",
      "NeogitStatus",
      "help",
    },
    day_brightness = 0.3,
    hide_inactive_statusline = true,
    dim_inactive = true,
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    on_colors = function(colors)
      colors.git = { change = "#6183bb", add = "#449dab", delete = "#f7768e", conflict = "#bb7a61" }
      colors.bg_dark = "#1a1e30"
      colors.bg_dim = "#1f2335"
      colors.bg_float = "#1a1e30"
    end,
    on_highlights = function(hl, c)
      c.bg_dark = "#1a1e30"
      c.bg_dim = "#1f2335"
      c.bg_float = "#1a1e30"
      local current_colors = M.colors.tokyonight_colors
      hl.NormalFloat = { fg = current_colors.fg, bg = "#181924" }
      hl.Cursor = { fg = current_colors.bg, bg = current_colors.fg }
      hl.NormalNC = { fg = current_colors.fg_dark, bg = "#1c1d28" }
      hl.Normal = { fg = current_colors.fg, bg = "#1f2335" }
      hl.CursorLineNr = { fg = current_colors.orange, style = "bold" }
    end,
  }
end

M.colors = {
  tokyonight_colors = {
    cmp_border = "#181924",
    none = "NONE",
    bg_dark = "#1f2335",
    bg_alt = "#1a1b26",
    bg = "#24283b",
    bg_br = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue0 = "#3d59a1",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    violet = "#bb9af7",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",
    hlargs = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",
    -- git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
    git = { change = "#6183bb", add = "#449dab", delete = "#f7768e", conflict = "#bb7a61" },
    gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
  },
}

return M
