local M = {}

M.config = function()
	local neoclip_req = { "kkharji/sqlite.lua" }
	lvim.plugins = {
		{
			"ray-x/lsp_signature.nvim",
			config = function()
				require("user/lsp_signature").config()
			end,
			event = { "BufRead", "BufNew" },
		},
		{
			"vladdoster/remember.nvim",
			config = function()
				require("remember").setup({})
			end,
			event = "BufWinEnter",
		},
		{
			"folke/todo-comments.nvim",
			dependencies = "nvim-lua/plenary.nvim",
			config = function()
				require("user.todo_comments").config()
			end,
			event = "BufRead",
		},
		{
			"folke/trouble.nvim",
			config = function()
				require("trouble").setup({
					auto_open = false,
					auto_close = true,
					padding = false,
					height = 10,
					use_diagnostic_signs = true,
				})
			end,
			event = "VeryLazy",
			cmd = "Trouble",
		},
		{
			"phaazon/hop.nvim",
			event = "VeryLazy",
			cmd = { "HopChar1CurrentLineAC", "HopChar1CurrentLineBC", "HopChar2MW", "HopWordMW" },
			config = function()
				require("user.hop").config()
			end,
		},
		{
			"simrat39/symbols-outline.nvim",
			config = function()
				require("user.symbols_outline").config()
			end,
			event = "BufReadPost",
		},
		{
			"tzachar/cmp-tabnine",
			build = "./install.sh",
			dependencies = "hrsh7th/nvim-cmp",
			config = function()
				local tabnine = require("cmp_tabnine.config")
				tabnine:setup({
					max_lines = 1000,
					max_num_results = 10,
					sort = true,
				})
			end,
			lazy = true,
			event = "InsertEnter",
		},
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",
			},
			config = function()
				require("codeium").setup({})
			end,
		},
		{
			"folke/twilight.nvim",
			lazy = true,
			config = function()
				require("user.twilight").config()
			end,
		},
		{
			"kevinhwang91/nvim-bqf",
			event = "WinEnter",
			config = function()
				require("user.bqf").config()
			end,
		},
		{
			"andymass/vim-matchup",
			event = "BufReadPost",
			config = function()
				vim.g.matchup_enabled = 1
				vim.g.matchup_surround_enabled = 1
				vim.g.matchup_matchparen_deferred = 1
				vim.g.matchup_matchparen_offscreen = { method = "popup" }
			end,
		},
		{
			"iamcco/markdown-preview.nvim",
			build = "cd app && npm install",
			ft = "markdown",
		},
		{
			"simrat39/rust-tools.nvim",
			lazy = true,
			config = function()
				require("user.rust_tools").config()
			end,
			ft = { "rust", "rs" },
		},
		{
			url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			lazy = true,
			config = function()
				require("lsp_lines").setup()
			end,
		},
		{
			"windwp/nvim-spectre",
			lazy = true,
			config = function()
				require("user.spectre").config()
			end,
		},
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("user.colorizer").config()
			end,
			event = "BufReadPre",
		},
		{
			"folke/persistence.nvim",
			event = "BufReadPre",
			lazy = true,
			config = function()
				require("persistence").setup({
					dir = vim.fn.expand(get_cache_dir() .. "/sessions/"), -- directory where session files are saved
					options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
				})
			end,
		},
		{
			"max397574/better-escape.nvim",
			event = "InsertEnter",
			config = function()
				require("better_escape").setup({
					mapping = { "jk", "jj" },
					timeout = vim.o.timeoutlen,
				})
			end,
		},
		{
			"will133/vim-dirdiff",
			cmd = "DirDiff",
		},
		{ "mfussenegger/nvim-jdtls", ft = "java" },
		{
			"danymat/neogen",
			lazy = true,
			config = function()
				require("neogen").setup({
					enabled = true,
				})
			end,
			dependencies = "nvim-treesitter/nvim-treesitter",
		},
		{
			"jose-elias-alvarez/typescript.nvim",
			ft = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			lazy = true,
			config = function()
				require("user.tss").config()
			end,
		},
		{
			"vuki656/package-info.nvim",
			config = function()
				require("package-info").setup()
			end,
			lazy = true,
			event = { "BufReadPre", "BufNew" },
		},
		{
			"alfaix/neotest-gtest",
			event = { "BufEnter *.cpp" },
			dependencies = { "nvim-treesitter/nvim-treesitter" },
		},
		{
			"nvim-neotest/neotest",
			config = function()
				require("user.ntest").config()
			end,
			dependencies = {
				{ "nvim-neotest/neotest-plenary" },
				{ "Issafalcon/neotest-dotnet" },
				{ "alfaix/neotest-gtest" },
			},
			event = { "BufReadPost", "BufNew" },
		},
		{ "nvim-neotest/neotest-go", event = { "BufEnter *.go" } },
		{ "nvim-neotest/neotest-python", event = { "BufEnter *.py" } },
		{ "rouge8/neotest-rust", event = { "BufEnter *.rs" } },
		{
			"RishabhRD/nvim-cheat.sh",
			dependencies = "RishabhRD/popfix",
			config = function()
				vim.g.cheat_default_window_layout = "vertical_split"
			end,
			lazy = true,
			cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
			keys = "<leader>?",
		},
		{
			"AckslD/nvim-neoclip.lua",
			config = function()
				require("user.neoclip").config()
			end,
			lazy = true,
			keys = "<leader>y",
			dependencies = neoclip_req,
		},
		{
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup({
					easing_function = "quadratic",
					hide_cursor = true,
				})
			end,
			event = "BufRead",
		},
		{
			"zbirenbaum/copilot.lua",
			dependencies = { "zbirenbaum/copilot-cmp", "nvim-cmp" },
			event = { "VimEnter" },
			config = function()
				vim.defer_fn(function()
					require("user.copilot").config()
				end, 100)
			end,
		},
		{
			"zbirenbaum/copilot-cmp",
			dependencies = { "copilot.lua", "nvim-cmp" },
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		{
			"ThePrimeagen/harpoon",
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-lua/popup.nvim" },
			},
		},
		{
			"sindrets/diffview.nvim",
			lazy = true,
			cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
			keys = { "<leader>gd", "<leader>gh" },
			config = function()
				require("user.diffview").config()
			end,
		},
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		{
			"benfowler/telescope-luasnip.nvim",
		},
		{ "mtdl9/vim-log-highlighting", ft = { "text", "log" } },
		{
			"yamatsum/nvim-cursorline",
			lazy = true,
			event = "BufWinEnter",
		},
		{
			"abecodes/tabout.nvim",
			config = function()
				require("user.tabout").config()
			end,
		},
		{
			"kevinhwang91/nvim-hlslens",
			config = function()
				require("user.hlslens").config()
			end,
			event = "BufReadPost",
		},
		{
			"skywind3000/asynctasks.vim",
			dependencies = {
				{ "skywind3000/asyncrun.vim" },
			},
			init = function()
				vim.cmd([[
          let g:asyncrun_open = 8
          let g:asynctask_template = '~/.config/lvim/task_template.ini'
          let g:asynctasks_extra_config = ['~/.config/lvim/tasks.ini']
        ]])
			end,
			event = { "BufRead", "BufNew" },
		},
		{
			"nvim-telescope/telescope-file-browser.nvim",
		},
		{
			"j-hui/fidget.nvim",
			config = function()
				require("user.fidget_spinner").config()
			end,
		},
		{
			"p00f/clangd_extensions.nvim",
			config = function()
				require("user.cle").config()
			end,
			ft = { "c", "cpp", "objc", "objcpp" },
		},
		{
			"saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			dependencies = { { "nvim-lua/plenary.nvim" } },
			config = function()
				require("user.crates").config()
			end,
		},
		{
			"mrjones2014/legendary.nvim",
			config = function()
				require("user.legendary").config()
			end,
			event = "VimEnter",
		},
		{
			"stevearc/dressing.nvim",
			lazy = true,
			config = function()
				require("user.dress").config()
			end,
			event = "BufWinEnter",
		},
		{
			"ThePrimeagen/refactoring.nvim",
			lazy = true,
			ft = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
			event = "BufReadPost",
			config = function()
				require("refactoring").setup({})
			end,
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			cmd = "Neotree",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("user.neotree").config()
			end,
		},
		{ "MunifTanjim/nui.nvim" },
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			config = function()
				require("user.noice").config()
			end,
			dependencies = {
				"rcarriga/nvim-notify",
			},
		},
		{
			"s1n7ax/nvim-window-picker",
			version = "v1.*",
			config = function()
				require("window-picker").setup({
					autoselect_one = true,
					include_current = false,
					filter_rules = {
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal" },
						},
					},
					other_win_hl_color = "#e35e4f",
				})
			end,
		},
		{
			"mg979/vim-visual-multi",
			branch = "master",
			init = function()
				vim.g.VM_maps = {
					["Add Cursor Down"] = "<C-M-j>",
					["Add Cursor Up"] = "<C-M-k>",
				}
			end,
		},
		{
			"olexsmir/gopher.nvim",
			config = function()
				require("gopher").setup({
					commands = {
						go = "go",
						gomodifytags = "gomodifytags",
						gotests = "gotests",
						impl = "impl",
						iferr = "iferr",
					},
				})
			end,
			ft = { "go", "gomod" },
			event = { "BufRead", "BufNew" },
		},
		{
			"leoluz/nvim-dap-go",
			config = function()
				require("dap-go").setup()
			end,
			ft = { "go", "gomod" },
			event = { "BufRead", "BufNew" },
		},
		{
			"AckslD/swenv.nvim",
			ft = "python",
			event = { "BufRead", "BufNew" },
		},
		{
			"mfussenegger/nvim-dap-python",
			config = function()
				local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
				require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
				require("dap-python").test_runner = "pytest"
			end,
			ft = "python",
			event = { "BufRead", "BufNew" },
		},
		{
			"microsoft/vscode-js-debug",
			version = "v1.74.1",
			build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		},
		{
			"mxsdev/nvim-dap-vscode-js",
			lazy = true,
			event = { "BufReadPre", "BufNew" },
			config = function()
				require("dap-vscode-js").setup({
					debugger_path = os.getenv("HOME") .. "/.local/share/lunarvim/site/pack/lazy/opt/vscode-js-debug",
					adapters = { "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
				})
			end,
		},
		{
			"smjonas/inc-rename.nvim",
			cmd = "IncRename",
			config = function()
				require("inc_rename").setup()
			end,
		},
		{
			"m-demare/hlargs.nvim",
			lazy = true,
			event = "VeryLazy",
			config = function()
				require("hlargs").setup({
					excluded_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
				})
			end,
			dependencies = { "nvim-treesitter/nvim-treesitter" },
		},
		{
			"cshuaimin/ssr.nvim",
			lazy = true,
			config = function()
				require("ssr").setup({
					min_width = 50,
					min_height = 5,
					keymaps = {
						close = "q",
						next_match = "n",
						prev_match = "N",
						replace_all = "<leader><cr>",
					},
				})
			end,
			event = { "BufReadPost", "BufNew" },
		},
		{
			"Civitasv/cmake-tools.nvim",
			config = function()
				require("user.cle").cmake_config()
			end,
			ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
		},
		{
			"jackMort/ChatGPT.nvim",
			event = "VeryLazy",
			config = function()
				require("chatgpt").setup()
			end,
			dependencies = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			name = "new-indent",
			main = "ibl",
		},
		{
			"Wansmer/symbol-usage.nvim",
			event = "LspAttach",
			config = function()
				require("user.symbol_use").config()
			end,
		},
		{
			"m4xshen/hardtime.nvim",
			dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
			opts = {},
		},
	}
end

return M
