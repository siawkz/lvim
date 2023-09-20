local M = {}
local kind = require("user.lsp_kind")

M.default_diagnostic_config = {
	signs = {
		active = true,
		values = {
			{ name = "DiagnosticSignError", text = kind.icons.error },
			{ name = "DiagnosticSignWarn", text = kind.icons.warn },
			{ name = "DiagnosticSignInfo", text = kind.icons.info },
			{ name = "DiagnosticSignHint", text = kind.icons.hint },
		},
	},
	virtual_text = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		source = "if_many",
		header = "",
		prefix = "",
		border = {
			{ " ", "FloatBorder" },
			{ " ", "FloatBorder" },
			{ " ", "FloatBorder" },
			{ " ", "FloatBorder" },
			{ " ", "FloatBorder" },
			{ " ", "FloatBorder" },
			{ " ", "FloatBorder" },
			{ " ", "FloatBorder" },
		},
		format = function(d)
			local t = vim.deepcopy(d)
			local code = d.code or (d.user_data and d.user_data.lsp.code)
			for _, table in pairs(M.codes) do
				if vim.tbl_contains(table, code) then
					return table.message
				end
			end
			return t.message
		end,
	},
}

M.config = function()
	M.default_diagnostic_config.virtual_text = false
	vim.diagnostic.config(M.default_diagnostic_config)

	-- Bufferline
	-- =========================================
	require("user.bufferline").config()

	-- CMP
	-- =========================================
	lvim.builtin.cmp.sources = {
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine", max_item_count = 3 },
		{ name = "buffer", max_item_count = 5, keyword_length = 5 },
		{ name = "copilot" },
		{ name = "codeium" },
		{ name = "path", max_item_count = 5 },
		{ name = "luasnip", max_item_count = 3 },
		{ name = "nvim_lua" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "treesitter" },
		{ name = "latex_symbols" },
		{ name = "crates" },
	}
	lvim.builtin.cmp.experimental = {
		ghost_text = false,
		native_menu = false,
		custom_menu = true,
	}
	local cmp_sources = {
		buffer = "(Buffer)",
		copilot = "(Copilot)",
		cmp_tabnine = "(TabNine)",
		codeium = "(Codeium)",
		crates = "(Crates)",
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
			if entry.source.name == "codeium" then
				local detail = (entry.completion_item.data or {}).detail
				vim_item.kind = ""
				if detail and detail:find(".*%%.*") then
					vim_item.kind = vim_item.kind .. " " .. detail
				end

				if (entry.completion_item.data or {}).multiline then
					vim_item.kind = vim_item.kind .. " " .. "[ML]"
				end
			end

			if entry.source.name == "copilot" then
				vim_item.kind = ""
			end

			vim_item.menu = cmp_sources[entry.source.name] or vim_item.kind
			vim_item.kind = kind.cmp_kind[vim_item.kind] or vim_item.kind

			return vim_item
		end,
	}
	lvim.builtin.cmp.cmdline.enable = true
	local cmp_ok, cmp = pcall(require, "cmp")
	if not cmp_ok or cmp == nil then
		cmp = {
			mapping = function(...) end,
			setup = { filetype = function(...) end, cmdline = function(...) end },
			config = { sources = function(...) end },
		}
	end
	cmp.setup.filetype("toml", {
		sources = cmp.config.sources({
			{ name = "nvim_lsp", max_item_count = 8 },
			{ name = "crates" },
			{ name = "luasnip", max_item_count = 5 },
		}, {
			{ name = "buffer", max_item_count = 5, keyword_length = 5 },
		}),
	})

	-- Comment
	-- =========================================
	-- integrate with nvim-ts-context-commentstring
	lvim.builtin.comment.pre_hook = function(ctx)
		if not vim.tbl_contains({ "typescript", "typescriptreact" }, vim.bo.ft) then
			return
		end

		local comment_utils = require("Comment.utils")
		local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

		local location
		if ctx.ctype == comment_utils.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = type,
			location = location,
		})
	end

	-- Dap
	-- =========================================
	lvim.builtin.dap.on_config_done = function()
		lvim.builtin.which_key.mappings["d"].name = " Debug"
		require("dap.ext.vscode").load_launchjs(nil, {
			cppdbg = { "c", "cpp", "h", "hpp" },
			codelldb = { "c", "cpp", "h", "hpp" },
			coreclr = { "cs", "fs" },
			go = { "go" },
			node2 = { "javascript", "typescript" },
			["pwa-node"] = { "javascript", "typescript" },
			["pwa-chrome"] = { "javascript", "typescript" },
			["pwa-msedge"] = { "javascript", "typescript" },
			["node-terminal"] = { "javascript", "typescript" },
			perlsp = { "pl" },
		})
	end

	-- Dashboard
	-- =========================================
	lvim.builtin.alpha.mode = "custom"
	local alpha_opts = require("user.dashboard").config()
	lvim.builtin.alpha["custom"] = { config = alpha_opts }

	-- GitSigns
	-- =========================================
	lvim.builtin.gitsigns.opts._threaded_diff = true
	lvim.builtin.gitsigns.opts._extmark_signs = true
	lvim.builtin.gitsigns.opts.current_line_blame_formatter = " <author>, <author_time> · <summary>"
	lvim.builtin.gitsigns.opts.attach_to_untracked = false

	-- IndentBlankline
	-- =========================================
	require("user.indent_blankline").config()

	-- LSP
	-- =========================================
	require("lvim.lsp.manager").setup("golangci_lint_ls", {
		on_init = require("lvim.lsp").common_on_init,
		capabilities = require("lvim.lsp").common_capabilities(),
	})

	lvim.lsp.buffer_mappings.normal_mode["ga"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" }
	lvim.lsp.buffer_mappings.normal_mode["gI"] = {
		"<cmd>lua require('user.telescope').lsp_implementations()<CR>",
		"Goto Implementation",
	}
	lvim.lsp.buffer_mappings.normal_mode["gA"] = {
		"<cmd>lua if vim.bo.filetype == 'rust' then vim.cmd[[RustHoverActions]] else vim.lsp.codelens.run() end<CR>",
		"CodeLens Action",
	}
	lvim.lsp.buffer_mappings.normal_mode["gt"] =
		{ "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" }
	lvim.lsp.buffer_mappings.normal_mode["gp"] = {
		function()
			require("user.peek").Peek("definition")
		end,
		"Peek definition",
	}
	lvim.lsp.buffer_mappings.normal_mode["K"] = {
		"<cmd>lua require('user.builtin').show_documentation()<CR>",
		"Show Documentation",
	}
	lvim.lsp.on_attach_callback = M.lsp_on_attach_callback

	-- Lualine
	-- =========================================
	lvim.builtin.lualine.active = true
	lvim.builtin.lualine.style = "default"
	lvim.builtin.lualine.sections.lualine_b = { "branch" }

	-- Mason
	-- =========================================
	lvim.builtin.mason.ui.icons = kind.mason

	-- Noice
	-- =========================================
	local found, noice_util = pcall(require, "noice.util")
	if found then
		vim.lsp.handlers["textDocument/signatureHelp"] = noice_util.protect(require("noice.lsp").signature)
		vim.lsp.handlers["textDocument/hover"] = noice_util.protect(require("noice.lsp.hover").on_hover)
	end

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
	lvim.builtin.nvimtree.on_config_done = function(_)
		lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "󰀶 Explorer" }
	end
	-- lvim.builtin.nvimtree.hide_dotfiles = 0

	-- Project
	-- =========================================
	lvim.builtin.project.active = true
	lvim.builtin.project.detection_methods = { "lsp", "pattern" }
	lvim.builtin.project.patterns = {
		".root",
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
		"package.json",
		".sln",
		".csproj",
		"pom.xml",
		"CMakeLists.txt",
	}

	-- Theme
	-- =========================================
	require("user.theme").tokyonight()
	lvim.builtin.theme.name = "tokyonight"

	-- Toggleterm
	-- =========================================
	lvim.builtin.terminal.active = true
	lvim.builtin.terminal.execs = {}
	lvim.builtin.terminal.autochdir = true
	lvim.builtin.terminal.size = vim.o.columns * 0.4
	lvim.builtin.terminal.on_config_done = function()
		M.create_terminal(2, "<c-\\>", 20, "float")
		M.create_terminal(3, "<M-0>", vim.o.columns * 0.4, "vertical")
	end

	-- Treesitter
	-- =========================================
	lvim.builtin.treesitter.context_commentstring.enable = true
	local languages = vim.tbl_flatten({
		{ "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css" },
		{ "dockerfile", "go", "gomod" },
		{ "gomod", "graphql", "hcl", "html", "java", "javascript", "jsdoc" },
		{ "json", "jsonc", "kotlin", "latex", "lua", "make" },
		{ "markdown", "ocaml", "perl", "php", "python", "query", "r" },
		{ "regex", "rego", "ruby", "rust", "scss", "solidity" },
		{ "teal", "toml", "tsx", "typescript", "vim", "vue", "yaml", "zig" },
	})
	lvim.builtin.treesitter.ensure_installed = languages
	lvim.builtin.treesitter.highlight.disable = { "org" }
	lvim.builtin.treesitter.highlight.aditional_vim_regex_highlighting = { "org" }
	lvim.builtin.treesitter.ignore_install = { "haskell", "norg" }
	lvim.builtin.treesitter.incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-n>",
			node_incremental = "<C-n>",
			scope_incremental = "<C-s>",
			node_decremental = "<C-r>",
		},
	}
	lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
	lvim.builtin.treesitter.matchup.enable = true
	-- lvim.treesitter.textsubjects.enable = true
	-- lvim.treesitter.playground.enable = true
	lvim.builtin.treesitter.query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	}
	lvim.builtin.treesitter.textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aA"] = "@attribute.outer",
				["iA"] = "@attribute.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",
				["at"] = "@class.outer",
				["it"] = "@class.inner",
				["a/"] = "@comment.outer",
				["i/"] = "@comment.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["aF"] = "@frame.outer",
				["iF"] = "@frame.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["is"] = "@scopename.inner",
				["as"] = "@statement.outer",
				["av"] = "@variable.outer",
				["iv"] = "@variable.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader><M-a>"] = "@parameter.inner",
				["<leader><M-f>"] = "@function.outer",
				["<leader><M-e>"] = "@element",
			},
			swap_previous = {
				["<leader><M-A>"] = "@parameter.inner",
				["<leader><M-F>"] = "@function.outer",
				["<leader><M-E>"] = "@element",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]p"] = "@parameter.inner",
				["]f"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[p"] = "@parameter.inner",
				["[f"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	}

	-- Telescope
	-- =========================================
	-- lvim.builtin.telescope.defaults.path_display = { "smart", "absolute", "truncate" }
	lvim.builtin.telescope.defaults.dynamic_preview_title = true
	lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
	lvim.builtin.telescope.defaults.prompt_prefix = "  "
	lvim.builtin.telescope.defaults.borderchars = {
		prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		results = { "─", "▐", "─", "│", "╭", "▐", "▐", "╰" },
		-- results = {' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' };
		preview = { " ", "│", " ", "▌", "▌", "╮", "╯", "▌" },
	}
	lvim.builtin.telescope.defaults.selection_caret = "  "
	lvim.builtin.telescope.defaults.cache_picker = { num_pickers = 3 }
	lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
	lvim.builtin.telescope.defaults.file_ignore_patterns = {
		"vendor/*",
		"%.lock",
		"__pycache__/*",
		"%.sqlite3",
		"%.ipynb",
		"node_modules/*",
		"%.jpg",
		"%.jpeg",
		"%.png",
		"%.svg",
		"%.otf",
		"%.ttf",
		".git/",
		"%.webp",
		".dart_tool/",
		".github/",
		".gradle/",
		".idea/",
		".settings/",
		".vscode/",
		"__pycache__/",
		"build/",
		"env/",
		"gradle/",
		"node_modules/",
		"target/",
		"%.pdb",
		"%.dll",
		"%.class",
		"%.exe",
		"%.cache",
		"%.ico",
		"%.pdf",
		"%.dylib",
		"%.jar",
		"%.docx",
		"%.met",
		"smalljre_*/*",
		".vale/",
		"%.burp",
		"%.mp4",
		"%.mkv",
		"%.rar",
		"%.zip",
		"%.7z",
		"%.tar",
		"%.bz2",
		"%.epub",
		"%.flac",
		"%.tar.gz",
	}
	local user_telescope = require("user.telescope")
	lvim.builtin.telescope.defaults.layout_config = user_telescope.layout_config()
	local actions = require("telescope.actions")
	lvim.builtin.telescope.defaults.mappings = {
		i = {
			["<c-c>"] = require("telescope.actions").close,
			["<c-y>"] = require("telescope.actions").which_key,
			["<tab>"] = actions.toggle_selection + actions.move_selection_next,
			["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
			["<cr>"] = user_telescope.multi_selection_open,
			["<c-v>"] = user_telescope.multi_selection_open_vsplit,
			["<c-s>"] = user_telescope.multi_selection_open_split,
			["<c-t>"] = user_telescope.multi_selection_open_tab,
			["<c-j>"] = actions.move_selection_next,
			["<c-k>"] = actions.move_selection_previous,
			["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		},
		n = {
			["<esc>"] = actions.close,
			["<tab>"] = actions.toggle_selection + actions.move_selection_next,
			["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
			["<cr>"] = user_telescope.multi_selection_open,
			["<c-v>"] = user_telescope.multi_selection_open_vsplit,
			["<c-s>"] = user_telescope.multi_selection_open_split,
			["<c-t>"] = user_telescope.multi_selection_open_tab,
			["<c-j>"] = actions.move_selection_next,
			["<c-k>"] = actions.move_selection_previous,
			["<c-n>"] = actions.cycle_history_next,
			["<c-p>"] = actions.cycle_history_prev,
			["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			["dd"] = require("telescope.actions").delete_buffer,
		},
	}
	local telescope_actions = require("telescope.actions.set")
	lvim.builtin.telescope.pickers.git_files = {
		hidden = true,
		show_untracked = true,
		layout_strategy = "horizontal",
	}
	lvim.builtin.telescope.pickers.live_grep = {
		only_sort_text = true,
		layout_strategy = "horizontal",
	}
	lvim.builtin.telescope.pickers.find_files = {
		layout_strategy = "horizontal",
		attach_mappings = function(_)
			telescope_actions.select:enhance({
				post = function()
					vim.cmd(":normal! zx")
				end,
			})
			return true
		end,
		find_command = { "fd", "--type=file", "--hidden" },
	}
	lvim.builtin.telescope.on_config_done = function(telescope)
		pcall(telescope.load_extension, "neoclip")
		pcall(telescope.load_extension, "file_browser")
		pcall(telescope.load_extension, "luasnip")
		pcall(telescope.load_extension, "refactoring")
	end

	-- WhichKey
	-- =========================================
	lvim.builtin.which_key.setup.window.winblend = 10
	lvim.builtin.which_key.setup.window.border = "none"
	lvim.builtin.which_key.setup.plugins.presets.z = true
	lvim.builtin.which_key.setup.plugins.presets.g = true
	lvim.builtin.which_key.setup.plugins.presets.windows = true
	lvim.builtin.which_key.setup.plugins.presets.nav = true
	lvim.builtin.which_key.setup.plugins.marks = true
	lvim.builtin.which_key.setup.plugins.registers = true
	lvim.builtin.which_key.setup.icons = {
		breadcrumb = "/", -- symbol used in the command line area that shows your active key combo
		separator = "·", -- symbol used between a key and it's label
		group = "", -- symbol prepended to a group
	}
	lvim.builtin.which_key.setup.ignore_missing = true
end

-- credit: https://github.com/max397574/NeovimConfig/blob/master/lua/configs/lsp/init.lua
M.codes = {
	no_matching_function = {
		message = " Can't find a matching function",
		"redundant-parameter",
		"ovl_no_viable_function_in_call",
	},
	different_requires = {
		message = " Buddy you've imported this before, with the same name",
		"different-requires",
	},
	empty_block = {
		message = " That shouldn't be empty here",
		"empty-block",
	},
	missing_symbol = {
		message = " Here should be a symbol",
		"miss-symbol",
	},
	expected_semi_colon = {
		message = " Remember the `;` or `,`",
		"expected_semi_declaration",
		"miss-sep-in-table",
		"invalid_token_after_toplevel_declarator",
	},
	redefinition = {
		message = " That variable was defined before",
		"redefinition",
		"redefined-local",
	},
	no_matching_variable = {
		message = " Can't find that variable",
		"undefined-global",
		"reportUndefinedVariable",
	},
	trailing_whitespace = {
		message = " Remove trailing whitespace",
		"trailing-whitespace",
		"trailing-space",
	},
	unused_variable = {
		message = " Don't define variables you don't use",
		"unused-local",
	},
	unused_function = {
		message = " Don't define functions you don't use",
		"unused-function",
	},
	useless_symbols = {
		message = " Remove that useless symbols",
		"unknown-symbol",
	},
	wrong_type = {
		message = " Try to use the correct types",
		"init_conversion_failed",
	},
	undeclared_variable = {
		message = " Have you delcared that variable somewhere?",
		"undeclared_var_use",
	},
	lowercase_global = {
		message = " Should that be a global? (if so make it uppercase)",
		"lowercase-global",
	},
}

--- Create a new toggleterm
---@param num number the terminal number must be > 1
---@param keymap string the keymap to toggle the terminal
---@param size number the size of the terminal
---@param direction string can be 'float','vertical','horizontal'
M.create_terminal = function(num, keymap, size, direction)
	local terms = require("toggleterm.terminal")
	local ui = require("toggleterm.ui")
	local dir = vim.loop.cwd()
	vim.keymap.set({ "n", "t" }, keymap, function()
		local term = terms.get_or_create_term(num, dir, direction)
		ui.update_origin_window(term.window)
		term:toggle(size, direction)
	end, { noremap = true, silent = true })
end

M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif filetype == "rust" then
		local found, rt = pcall(require, "rust-tools")
		if found then
			rt.hover_actions.hover_actions()
		else
			vim.lsp.buf.hover()
		end
	else
		vim.lsp.buf.hover()
	end
end

M.lsp_on_attach_callback = function(client, _)
	local wkstatus_ok, which_key = pcall(require, "which-key")
	if not wkstatus_ok then
		return
	end
	local mappings = {}

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}
	-- local opts = { noremap = true, silent = true }
	if client.name == "clangd" then
		mappings["H"] = {
			"<Cmd>ClangdSwitchSourceHeader<CR>",
			"Swich Header/Source",
		}
		mappings["lg"] = { "<cmd>CMakeGenerate<CR>", "Generate CMake" }
		mappings["rm"] = { "<cmd>CMakeRun<CR>", "Run CMake" }
		mappings["mm"] = { "<cmd>CMakeBuild<CR>", "Build CMake" }
		mappings["dm"] = { "<cmd>CMakeDebug<CR>", "Debug CMake" }
		mappings["ms"] = { "<cmd>CMakeSelectBuildType<CR>", "Select Build Type" }
		mappings["mt"] = { "<cmd>CMakeSelectBuildTarget<CR>", "Select Build Target" }
		mappings["rt"] = { "<cmd>CMakeSelectLaunchTarget<CR>", "Select Launch Target" }
		mappings["lo"] = { "<cmd>CMakeOpen<CR>", "Open CMake Console" }
		mappings["lc"] = { "<cmd>CMakeClose<CR>", "Close CMake Console" }
		mappings["mi"] = { "cmd>CMakeInstall<cr>", "Install CMake Targets" }
		mappings["mc"] = { "<cmd>CMakeClean<CR>", "Clean CMake Targets" }
		mappings["rc"] = { "<cmd>CMakeStop<CR>", "Stop CMake" }
	elseif client.name == "gopls" then
		mappings["H"] = {
			"<Cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go vet .;read',count=2,direction='float'})<CR>",
			"Go Vet",
		}
		mappings["li"] = { "<cmd>GoInstallDeps<cr>", "Install Dependencies" }
		mappings["lT"] = { "<cmd>GoMod tidy<cr>", "Tidy" }
		mappings["lt"] = { "<cmd>GoTestAdd<cr>", "Add Test" }
		mappings["tA"] = { "<cmd>GoTestsAll<cr>", "Add All Tests" }
		mappings["le"] = { "<cmd>GoTestsExp<cr>", "Add Exported Tests" }
		mappings["lg"] = { "<cmd>GoGenerate<cr>", "Generate" }
		mappings["lF"] = { "<cmd>GoGenerate %<cr>", "Generate File" }
		mappings["lc"] = { "<cmd>GoCmt<cr>", "Comment" }
		mappings["dT"] = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" }
	elseif client.name == "jdtls" then
		mappings["rf"] = {
			"<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn package;read', hidden =false}:toggle()<CR>",
			"Maven Package",
		}
		mappings["mf"] = {
			"<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn compile;read', hidden =false}:toggle()<CR>",
			"Maven Compile",
		}
	elseif client.name == "rust_analyzer" then
		mappings["H"] = {
			"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo clippy;read',count=2,direction='float'})<CR>",
			"Clippy",
		}
		mappings["lA"] = { "<Cmd>RustHoverActions<CR>", "Hover Actions" }
		mappings["lm"] = { "<Cmd>RustExpandMacro<CR>", "Expand Macro" }
		mappings["lH"] = { "<Cmd>RustToggleInlayHints<CR>", "Toggle Inlay Hints" }
		mappings["le"] = { "<Cmd>RustRunnables<CR>", "Runnables" }
		mappings["lD"] = { "<cmd>RustDebuggables<Cr>", "Debuggables" }
		mappings["lP"] = { "<cmd>RustParentModule<Cr>", "Parent Module" }
		mappings["lv"] = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" }
		mappings["lR"] = {
			"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
			"Reload Workspace",
		}
		mappings["lc"] = { "<Cmd>RustOpenCargo<CR>", "Open Cargo" }
		mappings["lo"] = { "<Cmd>RustOpenExternalDocs<CR>", "Open External Docs" }
	elseif client.name == "taplo" then
		mappings["lt"] = { "<Cmd>lua require('crates').toggle()<CR>", "Toggle Crate" }
		mappings["lu"] = { "<Cmd>lua require('crates').update_crate()<CR>", "Update Crate" }
		mappings["lU"] = { "<Cmd>lua require('crates').upgrade_crate()<CR>", "Upgrade Crate" }
		mappings["lg"] = { "<Cmd>lua require('crates').update_all_crates()<CR>", "Update All" }
		mappings["lG"] = { "<Cmd>lua require('crates').upgrade_all_crates()<CR>", "Upgrade All" }
		mappings["lH"] = { "<Cmd>lua require('crates').open_homepage()<CR>", "Open HomePage" }
		mappings["lD"] = { "<Cmd>lua require('crates').open_documentation()<CR>", "Open Documentation" }
		mappings["lR"] = { "<Cmd>lua require('crates').open_repository()<CR>", "Open Repository" }
		mappings["lv"] = { "<Cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions" }
		mappings["lF"] = { "<Cmd>lua require('crates').show_features_popup()<CR>", "Show Features" }
		mappings["lD"] = { "<Cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies" }
	elseif client.name == "tsserver" then
		mappings["li"] = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" }
		mappings["lo"] = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" }
		mappings["lu"] = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" }
		mappings["lF"] = { "<cmd>TypescriptFixAll<Cr>", "FixAll" }
		mappings["lg"] = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" }
	elseif client.name == "pyright" then
		mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
		mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
		mappings["dS"] = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" }
		mappings["P"] = {
			name = "Python",
			i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
			d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
		}
	elseif client.name == "jsonls" then
		mappings["ls"] = { "<cmd>lua require('package-info').show()<cr>", "Show pkg info" }
		mappings["lc"] = { "<cmd>lua require('package-info').hide()<cr>", "Hide pkg info" }
		mappings["lu"] = { "<cmd>lua require('package-info').update()<cr>", "Update dependency" }
		mappings["ld"] = { "<cmd>lua require('package-info').delete()<cr>", "Delete dependency" }
		mappings["li"] = { "<cmd>lua require('package-info').install()<cr>", "Install dependency" }
		mappings["lC"] = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
	end
	which_key.register(mappings, opts)
end

return M
