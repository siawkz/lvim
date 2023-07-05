local M = {}

M.config = function()
	-- NOTE: By default, all null-ls providers are checked on startup.
	-- If you want to avoid that or want to only set up the provider
	-- when you opening the associated file-type,
	-- then you can use filetype plugins for this purpose.
	-- https://www.lunarvim.org/languages/#lazy-loading-the-formatter-setup
	local status_ok, nls = pcall(require, "null-ls")
	if not status_ok then
		return
	end

	local sources = {
		nls.builtins.formatting.prettierd.with({
			condition = function(utils)
				return not utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
			end,
			prefer_local = "node_modules/.bin",
		}),
		nls.builtins.formatting.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
			end,
			prefer_local = "node_modules/.bin",
		}),
		nls.builtins.formatting.csharpier,
		nls.builtins.formatting.clang_format.with({
			filetypes = { "c", "cpp" },
		}),
		nls.builtins.formatting.google_java_format,
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.goimports,
		nls.builtins.formatting.gofumpt,
		nls.builtins.formatting.cmake_format,
		nls.builtins.formatting.black,
		nls.builtins.formatting.isort,
		nls.builtins.formatting.shfmt,
		nls.builtins.formatting.shellharden,
		nls.builtins.formatting.scalafmt,
		nls.builtins.formatting.sqlformat,
		nls.builtins.formatting.terraform_fmt.with({
			filetypes = { "terraform", "tf", "terraform-vars", "hcl" },
		}),
		nls.builtins.formatting.perlimports,
		nls.builtins.formatting.perltidy,
		nls.builtins.diagnostics.semgrep.with({
			filetypes = { "python", "go", "cs", "terraform" },
			args = { "--config", "auto", "-q", "--json", "--timeout", "0", "$FILENAME" },
			timeout = 30000,
			method = nls.methods.DIAGNOSTICS_ON_SAVE,
		}),
		nls.builtins.diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
			end,
			prefer_local = "node_modules/.bin",
		}),
		nls.builtins.diagnostics.shellcheck,
		nls.builtins.diagnostics.cpplint,
		nls.builtins.code_actions.gomodifytags,
		-- nls.builtins.diagnostics.luacheck,
		nls.builtins.code_actions.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
			end,
			prefer_local = "node_modules/.bin",
		}),
		nls.builtins.code_actions.refactoring.with({
			filetypes = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
		}),
	}

	-- you can either config null-ls itself
	nls.setup({
		on_attach = require("lvim.lsp").common_on_attach,
		debounce = 150,
		save_after_format = false,
		sources = sources,
	})
end

return M
