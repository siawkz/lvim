local M = {}

local create_aucmd = vim.api.nvim_create_autocmd

M.config = function()
	vim.api.nvim_clear_autocmds({ pattern = "lir", group = "_filetype_settings" })
	vim.api.nvim_create_augroup("_lvim_user", {})
	-- Autocommands
	vim.cmd([[
  " disable syntax highlighting in big files
  function! DisableSyntaxTreesitter()
      echo("Big file, disabling syntax, treesitter and folding")
      if exists(':TSBufDisable')
          exec 'TSBufDisable autotag'
          exec 'TSBufDisable highlight'
      endif

      set foldmethod=manual
      syntax clear
      syntax off
      filetype off
      set noundofile
      set noswapfile
      set noloadplugins
      set lazyredraw
  endfunction

  augroup BigFileDisable
      autocmd!
      autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 1024 * 1024 | exec DisableSyntaxTreesitter() | endif
  augroup END
    ]])
	create_aucmd("BufWinEnter", {
		group = "_lvim_user",
		pattern = "*.md",
		desc = "beautify markdown",
		callback = function()
			vim.cmd([[set syntax=markdown]])
			require("user.markdown_syn").set_syntax()
		end,
	})
	create_aucmd("TextYankPost", {
		group = "_general_settings",
		pattern = "*",
		desc = "Highlight text on yank",
		callback = function()
			require("vim.highlight").on_yank({ higroup = "Search", timeout = 40 })
		end,
	})

	create_aucmd("TermOpen", {
		group = "_lvim_user",
		pattern = "term://*",
		command = "lua require('user.keybindings').set_terminal_keymaps()",
	})
end

M.make_run = function()
	create_aucmd("FileType", {
		group = "_lvim_user",
		pattern = { "c", "cpp" },
		callback = function()
			vim.keymap.set(
				"n",
				"<leader>m",
				"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='make ;read',count=2,direction='float'})<CR>"
			)
			vim.keymap.set(
				"n",
				"<leader>r",
				"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='make run;read',count=3,direction='float'})<CR>"
			)
		end,
	})
	create_aucmd("FileType", {
		group = "_lvim_user",
		pattern = "go",
		callback = function()
			vim.keymap.set(
				"n",
				"<leader>m",
				"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go build -v .;read',count=2,direction='float'})<CR>"
			)
			vim.keymap.set(
				"n",
				"<leader>r",
				"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go run .;read',count=3,direction='float'})<CR>"
			)
		end,
	})
	create_aucmd("FileType", {
		group = "_lvim_user",
		pattern = "python",
		callback = function()
			vim.keymap.set(
				"n",
				"<leader>r",
				"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='python "
					.. vim.fn.expand("%")
					.. ";read',count=2,direction='float'})<CR>"
			)
			vim.keymap.set(
				"n",
				"<leader>m",
				"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='echo \"compile :pepelaugh:\";read',count=2,direction='float'})<cr>"
			)
		end,
	})
	create_aucmd("FileType", {
		group = "_lvim_user",
		pattern = "rust",
		callback = function()
			vim.keymap.set(
				"n",
				"<leader>m",
				"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo build;read',count=2,direction='float'})<CR>"
			)
			vim.keymap.set("n", "<leader>r", "<cmd>lua require('rust-tools.runnables').runnables()<CR>")
		end,
	})
end

return M
