local M = {}

M.config = function()
  local status_ok, ui = pcall(require, "dapui")
  if not status_ok then
    return
  end

  ui.setup {
    icons = {
      expanded = "",
      collapsed = "",
      circular = "",
    },
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40,
        position = "left",
      },
      {
        elements = { "repl", "console" },
        size = 10,
        position = "bottom",
      },
    },
  }
end

return M
