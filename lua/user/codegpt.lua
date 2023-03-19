local M = {}

M.config = function()
	local status_ok, _ = pcall(require, "codegpt.config")
	if not status_ok then
		return
	end

	-- TODO: Change to gpt-4 later
	local model = "gpt-3.5-turbo"
	local max_tokens = 4096

	vim.g["codegpt_commands_defaults"] = {
		["completion"] = {
			model = model,
			max_tokens = max_tokens,
			user_message_template = "I have the following {{language}} code snippet: ```{{filetype}}\n{{text_selection}}```\nComplete the rest. Use best practices and write really good documentation. {{language_instructions}} Only return the code snippet and nothing else.",
			language_instructions = {
				cpp = "Use modern C++ features.",
				java = "Use modern Java syntax. Use var when applicable.",
				csharp = "Use modern C# syntax. Use var when applicable.",
			},
		},
		["code_edit"] = {
			model = model,
			max_tokens = max_tokens,
			user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\n{{command_args}}. {{language_instructions}} Only return the code snippet and nothing else.",
			language_instructions = {
				cpp = "Use modern C++ syntax.",
			},
		},
		["explain"] = {
			model = model,
			max_tokens = max_tokens,
			user_message_template = "Explain the following {{language}} code: ```{{filetype}}\n{{text_selection}}``` Explain as if you were explaining to another developer.",
			callback_type = "text_popup",
		},
		["doc"] = {
			model = model,
			max_tokens = max_tokens,
			user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nWrite really good documentation using best practices for the given language. Attention paid to documenting parameters, return types, any exceptions or errors. {{language_instructions}} Only return the code snippet and nothing else.",
			language_instructions = {
				cpp = "Use doxygen style comments for functions.",
				java = "Use JavaDoc style comments for functions.",
			},
		},
		["md"] = {
			model = model,
			max_tokens = max_tokens,
			user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nWrite really good markdown documentation using best practices for the given language.",
			callback_type = "code_popup",
		},
		["opt"] = {
			model = model,
			max_tokens = max_tokens,
			user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nOptimize this code. {{language_instructions}} Only return the code snippet and nothing else.",
			language_instructions = {
				cpp = "Use modern C++.",
			},
		},
		["tests"] = {
			model = model,
			max_tokens = max_tokens,
			user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nWrite really good unit tests using best practices for the given language. {{language_instructions}} Only return the unit tests. Only return the code snippet and nothing else. ",
			callback_type = "code_popup",
			language_instructions = {
				cpp = "Use modern C++ syntax. Generate unit tests using the gtest framework.",
				java = "Generate unit tests using the junit framework.",
			},
		},
		["chat"] = {
			model = model,
			max_tokens = max_tokens,
			system_message_template = "You are a general assistant to a software developer.",
			user_message_template = "{{command_args}}",
			callback_type = "text_popup",
		},
	}
end

return M
