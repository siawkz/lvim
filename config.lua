-- Neovim
-- =========================================
lvim.format_on_save = false
lvim.leader = "space"
lvim.colorscheme = "tokyonight" -- set to a custom theme
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Customization
-- =========================================
lvim.builtin.indentlines.active = false
lvim.builtin.indentlines.mine = true

-- Override Lunarvim defaults
-- =========================================
require("user.builtin").config()

-- StatusLine
-- =========================================
require("user.lualine").config()

-- Debugging
-- =========================================
require("user.dap").config()

-- Language Specific
-- =========================================
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
  -- "clangd",
  -- "dockerls",
  -- "gopls",
  -- "golangci_lint_ls",
  "jdtls",
  "csharp_ls",
  -- "pyright",
  -- "rust_analyzer",
  -- "taplo",
  -- "texlab",
  -- "tsserver",
  -- "yamlls",
})
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "omnisharp"
end, lvim.lsp.automatic_configuration.skipped_servers)
require("user.null_ls").config()

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional Keybindings
-- =========================================
require("user.keybindings").config()
