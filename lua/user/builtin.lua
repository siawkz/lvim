local M = {}

M.config = function()
  -- Lualine
  -- =========================================
  lvim.builtin.lualine.active = true
  lvim.builtin.lualine.style = "default"
  lvim.builtin.lualine.sections.lualine_b = { "branch" }
end

return M
