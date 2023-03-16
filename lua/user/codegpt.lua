local M = {}

M.config = function()
	local status_ok, CommandsList = pcall(require, "codegpt.commands_list")
	if not status_ok then
		return
	end

	CommandsList.cmd_default = {
		model = "gpt-4",
		max_tokens = 4096,
		temperature = 0.8,
		number_of_choices = 1,
		system_message_template = "You are a {{language}} coding assistant.",
		user_message_template = "",
		callback_type = "replace_lines",
	}
end

return M
