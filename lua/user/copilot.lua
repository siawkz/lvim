local M = {}

M.config = function()
	local status_ok, copilot = pcall(require, "copilot")
	if not status_ok then
		return
	end

	copilot.setup({
		plugin_manager_path = get_runtime_dir() .. "/site/pack/lazy",
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<M-p>",
				accept_word = "<M-w>",
				accept_line = "<M-l>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
		},
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
			cs = true,
			terraform = true,
			dockerfile = true,
		},
	})
end

return M
