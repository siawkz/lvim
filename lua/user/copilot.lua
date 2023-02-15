local M = {}

M.config = function()
	local status_ok, copilot = pcall(require, "copilot")
	if not status_ok then
		return
	end

	copilot.setup({
		plugin_manager_path = get_runtime_dir() .. "/site/pack/lazy",
		filetypes = {
			["*"] = false,
			python = true,
			lua = true,
			go = true,
			rust = true,
			html = true,
			c = true,
			cpp = true,
			java = true,
			javascript = true,
			typescript = true,
			javascriptreact = true,
			typescriptreact = true,
			svelte = true,
			csharp = true,
			terraform = true,
			dockerfile = true,
		},
	})
end

return M
