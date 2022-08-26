local M = {}

M.config = function()

  local kind = require "user.lsp_kind"

  -- Lualine
  -- =========================================
  lvim.builtin.lualine.active = true
  lvim.builtin.lualine.style = "default"
  lvim.builtin.lualine.sections.lualine_b = { "branch" }

  -- NvimTree
  -- =========================================
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = kind.icons.hint,
      info = kind.icons.info,
      warning = kind.icons.warn,
      error = kind.icons.error,
    },
  }
  lvim.builtin.nvimtree.setup.renderer.icons.glyphs = kind.nvim_tree_icons
  lvim.builtin.nvimtree.on_config_done = function(_)
    lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", " Explorer" }
  end
  -- lvim.builtin.nvimtree.hide_dotfiles = 0

  -- Project
  -- =========================================
  lvim.builtin.project.active = true
  lvim.builtin.project.detection_methods = { "lsp", "pattern" }

  -- Telescope
  -- =========================================
  local user_telescope = require "user.telescope"
  lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "file_create")
    pcall(telescope.load_extension, "file_browser")
  end

  -- Terminal
  -- =========================================
  lvim.builtin.terminal.active = true
  lvim.builtin.terminal.open_mapping = [[<c-\>]]

end

return M
