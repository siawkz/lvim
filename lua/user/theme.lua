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
			"lazy",
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
			hl["@variable"] = { fg = c.fg }
			hl.NormalFloat = { fg = current_colors.fg, bg = "#181924" }
			hl.Cursor = { fg = current_colors.bg, bg = current_colors.fg }
			hl.NormalNC = { fg = current_colors.fg_dark, bg = "#1c1d28" }
			hl.Normal = { fg = current_colors.fg, bg = "#1f2335" }
			hl.CursorLineNr = { fg = current_colors.orange, style = "bold" }
		end,
	}
end

M.hi_colors = function()
	local colors = {
		bg = "#16161D",
		bg_alt = "#1F1F28",
		fg = "#DCD7BA",
		green = "#76946A",
		red = "#E46876",
	}
	local color_binds = {
		bg = { group = "NormalFloat", property = "background" },
		bg_alt = { group = "Cursor", property = "foreground" },
		fg = { group = "Cursor", property = "background" },
		green = { group = "diffAdded", property = "foreground" },
		red = { group = "diffRemoved", property = "foreground" },
	}
	local function get_hl_by_name(name)
		local ret = vim.api.nvim_get_hl_by_name(name.group, true)
		return string.format("#%06x", ret[name.property])
	end

	for k, v in pairs(color_binds) do
		local found, color = pcall(get_hl_by_name, v)
		if found then
			colors[k] = color
		end
	end
	return colors
end

M.telescope_theme = function(colorset)
	local function link(group, other)
		vim.cmd("highlight! link " .. group .. " " .. other)
	end

	local function set_bg(group, bg)
		vim.cmd("hi " .. group .. " guibg=" .. bg)
	end

	local function set_fg_bg(group, fg, bg)
		vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
	end

	set_fg_bg("SpecialComment", "#9ca0a4", "bold")
	link("FocusedSymbol", "LspHighlight")
	link("LspCodeLens", "SpecialComment")
	link("LspDiagnosticsSignError", "DiagnosticError")
	link("LspDiagnosticsSignHint", "DiagnosticHint")
	link("LspDiagnosticsSignInfo", "DiagnosticInfo")
	link("NeoTreeDirectoryIcon", "NvimTreeFolderIcon")
	link("IndentBlanklineIndent1 ", "@comment")
	if vim.fn.has("nvim-0.9") == 1 then
		link("@lsp.type.decorator", "@function")
		link("@lsp.type.enum", "@type")
		link("@lsp.type.enumMember", "@constant")
		link("@lsp.type.function", "@function")
		link("@lsp.type.interface", "@interface")
		link("@lsp.type.keyword", "@keyword")
		link("@lsp.type.macro", "@macro")
		link("@lsp.type.method", "@method")
		link("@lsp.type.namespace", "@namespace")
		link("@lsp.type.parameter", "@parameter")
		link("@lsp.type.property", "@property")
		link("@lsp.type.struct", "@structure")
		link("@lsp.type.variable", "@variable")
		link("@lsp.type.class", "@type")
		link("@lsp.type.type", "@type")
		link("@lsp.typemod.function.defaultLibrary", "Special")
		link("@lsp.typemod.variable.defaultLibrary", "@variable.builtin")
		-- link("@lsp.typemod.variable.global", "@constant.builtin")
		link("@lsp.typemod.operator", "@operator")
		link("@lsp.typemod.string", "@string")
		link("@lsp.typemod.variable", "@variable")
		link("@lsp.typemod.parameter.label", "@field")
		link("@type.qualifier", "@keyword")
	end

	local colors = M.hi_colors()
	-- set_fg_bg("WinSeparator", colors.bg, "None")
	set_fg_bg("NormalFloat", colors.fg, colors.bg)
	set_fg_bg("FloatBorder", colors.fg, colors.bg)
	set_fg_bg("TelescopeBorder", colors.bg_alt, colors.bg)
	set_fg_bg("TelescopePromptBorder", colors.bg, colors.bg)
	set_fg_bg("TelescopePromptNormal", colors.fg, colors.bg_alt)
	set_fg_bg("TelescopePromptPrefix", colors.red, colors.bg)
	set_bg("TelescopeNormal", colors.bg)
	set_fg_bg("TelescopePreviewTitle", colors.bg, colors.green)
	set_fg_bg("LvimInfoHeader", colors.bg, colors.green)
	set_fg_bg("LvimInfoIdentifier", colors.red, colors.bg_alt)
	set_fg_bg("TelescopePromptTitle", colors.bg, colors.red)
	set_fg_bg("TelescopeResultsTitle", colors.bg, colors.bg)
	set_fg_bg("TelescopeResultsBorder", colors.bg, colors.bg)
	set_bg("TelescopeSelection", colors.bg_alt)

	local bg = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg
	local hl = vim.api.nvim_get_hl(0, { name = "Folded" })
	hl.bg = bg
	vim.api.nvim_set_hl(0, "Folded", hl)
	vim.opt.foldtext = [[luaeval('HighlightedFoldtext')()]]

	local function h(name)
		return vim.api.nvim_get_hl(0, { name = name })
	end

	vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg })
	vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("CursorLine").bg, fg = h("Comment").fg, italic = true })
	vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("CursorLine").bg, italic = true })
	vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("CursorLine").bg, italic = true })
	vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("CursorLine").bg, italic = true })
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
