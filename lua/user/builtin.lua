local M = {}

M.config = function()

  local kind = require "user.lsp_kind"

  -- CMP
  -- =========================================
  lvim.builtin.cmp.sources = {
    { name = "nvim_lsp" },
    { name = "cmp_tabnine", max_item_count = 3 },
    { name = "buffer", max_item_count = 5, keyword_length = 5 },
    { name = "path", max_item_count = 5 },
    { name = "luasnip", max_item_count = 3 },
    { name = "nvim_lua" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "latex_symbols" },
    { name = "crates" },
    { name = "orgmode" },
  }
  lvim.builtin.cmp.experimental = {
    ghost_text = false,
    native_menu = false,
    custom_menu = true,
  }
  local cmp_sources = {
    ["vim-dadbod-completion"] = "(DadBod)",
    buffer = "(Buffer)",
    copilot = "(Copilot)",
    cmp_tabnine = "(TabNine)",
    crates = "(Crates)",
    latex_symbols = "(LaTeX)",
    nvim_lua = "(NvLua)",
  }
  lvim.builtin.cmp.formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      if entry.source.name == "cmdline" then
        vim_item.kind = "⌘"
        vim_item.menu = ""
        return vim_item
      end
      vim_item.menu = cmp_sources[entry.source.name] or vim_item.kind
      vim_item.kind = kind.cmp_kind[vim_item.kind] or vim_item.kind

      return vim_item
    end,
  }
  local cmp_ok, cmp = pcall(require, "cmp")
  if not cmp_ok or cmp == nil then
    cmp = {
      mapping = function(...) end,
      setup = { filetype = function(...) end, cmdline = function(...) end },
      config = { sources = function(...) end },
    }
  end
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline {},
    sources = {
      { name = "cmdline" },
      { name = "path" },
    },
  })

  -- Comment
  -- =========================================
  -- integrate with nvim-ts-context-commentstring
  lvim.builtin.comment.pre_hook = function(ctx)
    if not vim.tbl_contains({ "typescript", "typescriptreact" }, vim.bo.ft) then
      return
    end

    local comment_utils = require "Comment.utils"
    local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

    local location
    if ctx.ctype == comment_utils.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = type,
      location = location,
    }
  end

  -- Dashboard
  -- =========================================
  lvim.builtin.alpha.mode = "custom"
  local alpha_opts = require("user.dashboard").config()
  lvim.builtin.alpha["custom"] = { config = alpha_opts }

  -- LSP
  -- =========================================
  lvim.lsp.buffer_mappings.normal_mode["ga"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" }
  lvim.lsp.buffer_mappings.normal_mode["gI"] = {
    "<cmd>lua require('user.telescope').lsp_implementations()<CR>",
    "Goto Implementation",
  }
  lvim.lsp.buffer_mappings.normal_mode["gA"] = {
    "<cmd>lua if vim.bo.filetype == 'rust' then vim.cmd[[RustHoverActions]] else vim.lsp.codelens.run() end<CR>",
    "CodeLens Action",
  }
  lvim.lsp.buffer_mappings.normal_mode["gt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" }
  lvim.lsp.buffer_mappings.normal_mode["K"] = {
    "<cmd>lua require('user.builtin').show_documentation()<CR>",
    "Show Documentation",
  }
  lvim.lsp.float.border = {
    { "╔", "FloatBorder" },
    { "═", "FloatBorder" },
    { "╗", "FloatBorder" },
    { "║", "FloatBorder" },
    { "╝", "FloatBorder" },
    { "═", "FloatBorder" },
    { "╚", "FloatBorder" },
    { "║", "FloatBorder" },
  }
  lvim.lsp.diagnostics.float.border = {
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
  }
  lvim.lsp.diagnostics.float.focusable = false
  lvim.lsp.float.focusable = true
  lvim.lsp.diagnostics.signs.values = {
    { name = "DiagnosticSignError", text = kind.icons.error },
    { name = "DiagnosticSignWarn", text = kind.icons.warn },
    { name = "DiagnosticSignInfo", text = kind.icons.info },
    { name = "DiagnosticSignHint", text = kind.icons.hint },
  }
  lvim.lsp.diagnostics.float.source = "if_many"
  lvim.lsp.diagnostics.float.format = function(d)
    local t = vim.deepcopy(d)
    local code = d.code or (d.user_data and d.user_data.lsp.code)
    for _, table in pairs(M.codes) do
      if vim.tbl_contains(table, code) then
        return table.message
      end
    end
    return t.message
  end

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
  lvim.builtin.telescope.defaults.layout_config = user_telescope.layout_config()
  lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "file_create")
    pcall(telescope.load_extension, "file_browser")
  end

  -- Terminal
  -- =========================================
  lvim.builtin.terminal.active = true
  lvim.builtin.terminal.open_mapping = [[<c-\>]]

end

M.toggle_lazygit = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
  lazygit:toggle()
end

return M
