local M = {}

M.config = function()

  local function set_bufferline_keymaps()
    lvim.builtin.which_key.mappings["c"] = nil
    lvim.keys.normal_mode["<S-x>"] = "<Cmd>BufferKill<CR>"
    lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
    lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
    lvim.keys.normal_mode["[b"] = "<Cmd>BufferLineMoveNext<CR>"
    lvim.keys.normal_mode["]b"] = "<Cmd>BufferLineMovePrev<CR>"
    lvim.builtin.which_key.mappings.b = {
      name = "﩯Buffer",
      ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
      ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
      ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
      ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
      ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
      ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
      ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
      ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
      ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
      c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
      p = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin" },
      s = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
      t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
      f = { "<cmd>Telescope buffers<cr>", "Find" },
      b = { "<cmd>b#<cr>", "Previous" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      l = {
        "<cmd>BufferLineCloseRight<cr>",
        "Close all to the right",
      },
      D = {
        "<cmd>BufferLineSortByDirectory<cr>",
        "Sort by directory",
      },
      L = {
        "<cmd>BufferLineSortByExtension<cr>",
        "Sort by language",
      },
    }
  end

  set_bufferline_keymaps()
  lvim.builtin.which_key.mappings["x"] = nil

  lvim.builtin.which_key.mappings["/"] = {
    "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>",
    " Comment",
  }
  lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "舘Dashboard" }
  lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require('dapui').eval()<cr>", "Eval" }
  lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" }
  lvim.builtin.which_key.mappings["gd"] = { "<cmd>DiffviewOpen<cr>", "diffview: diff HEAD" }

  lvim.builtin.which_key.mappings["\\"] = { "<cmd>Cheat<CR>", " Cheat.sh" }

  lvim.builtin.which_key.mappings["F"] = {
    name = " Find",
    b = { "<cmd>lua require('user.telescope').builtin()<cr>", "Builtin" },
    f = { "<cmd>lua require('user.telescope').curbuf()<cr>", "Current Buffer" },
    g = { "<cmd>lua require('user.telescope').git_files()<cr>", "Git Files" },
    i = { "<cmd>lua require('user.telescope').installed_plugins()<cr>", "Installed Plugins" },
    l = {
      "<cmd>lua require('telescope.builtin').resume()<cr>",
      "Last Search",
    },
    p = { "<cmd>lua require('user.telescope').project_search()<cr>", "Project" },
    s = { "<cmd>lua require('user.telescope').git_status()<cr>", "Git Status" },
    z = { "<cmd>lua require('user.telescope').search_only_certain_files()<cr>", "Certain Filetype" },
  }

  lvim.builtin.which_key.mappings["C"] = { "<cmd>Telescope commands<cr>", " Command Palette" }
  lvim.keys.normal_mode["<c-P>"] = "<cmd>Telescope commands<cr>"

  lvim.builtin.which_key.mappings["se"] = { "<cmd>Telescope file_browser<cr>", "File Browser" }
  -- lvim.builtin.which_key.mappings["H"] = " Help"
  lvim.builtin.which_key.mappings["h"] = { "<cmd>nohlsearch<CR>", " No Highlight" }
  lvim.builtin.which_key.mappings.g.name = " Git"
  lvim.builtin.which_key.mappings.l.name = " LSP"
  lvim.builtin.which_key.mappings["f"] = {
    require("lvim.core.telescope.custom-finders").find_project_files,
    " Find File",
  }
  local ok, _ = pcall(require, "vim.diagnostic")
  if ok then
    lvim.builtin.which_key.mappings["l"]["j"] = {
      "<cmd>lua vim.diagnostic.goto_next({float = {border = 'rounded', focusable = false, source = 'always'}})<cr>",
      "Next Diagnostic",
    }
    lvim.builtin.which_key.mappings["l"]["k"] = {
      "<cmd>lua vim.diagnostic.goto_prev({float = {border = 'rounded', focusable = false, source = 'always'}})<cr>",
      "Prev Diagnostic",
    }
  end

  lvim.builtin.which_key.vmappings["l"] = {
    name = "+Lsp",
    r = { "<ESC><CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
  }

  lvim.builtin.which_key.mappings["lh"] = {
    "<cmd>hi LspReferenceRead cterm=bold ctermbg=red guibg=#24283b<cr><cmd>hi LspReferenceText cterm=bold ctermbg=red guibg=#24283b<cr><cmd>hi LspReferenceWrite cterm=bold ctermbg=red guibg=#24283b<cr>",
    "Clear HL",
  }

  lvim.builtin.which_key.mappings["q"] = {
    name = " Quit",
    d = { "<cmd>lua require('persistence').stop()<cr> | :qa!<cr>", "Quit without saving session" },
    l = { "<cmd>lua require('persistence').load({ last=true })<cr>", "Restore last session" },
    s = { "<cmd>lua require('persistence').load()<cr>", "Restore for current dir" },
  }

  lvim.builtin.which_key.mappings["N"] = { "<cmd>Telescope file_create<CR>", " Create new file" }

  lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", " Symbol Outline" }

  lvim.builtin.which_key.mappings.L.name = " LunarVim"
  lvim.builtin.which_key.mappings.p.name = " Packer"
  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", " Projects" }

  lvim.builtin.which_key.mappings["R"] = {
    name = " Replace",
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  }

  lvim.builtin.which_key.mappings.s.name = " Search"
  lvim.builtin.which_key.mappings["ss"] = {
    "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
    "String",
  }

  lvim.builtin.which_key.mappings["t"] = {
    name = "ﭧ Test",
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
    o = { "<cmd>lua require('neotest').output.open({ enter = true, short = false })<cr>", "Output" },
    r = { "<cmd>lua require('neotest').run.run()<cr>", "Run" },
    s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    n = { "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", "jump to next failed" },
    p = { "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", "jump to previous failed" },
  }

  lvim.builtin.which_key.mappings["T"] = {
    name = "飯Trouble",
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnosticss" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    t = { "<cmd>TodoLocList <cr>", "Todo" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnosticss" },
  }

  lvim.builtin.which_key.mappings["w"] = { "<cmd>w!<CR>", " Save" }

  lvim.builtin.which_key.vmappings["g"] = {
    name = " Git",
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  }
  lvim.builtin.which_key.mappings["G"] = {
    "<cmd>lua require('user.builtin').toggle_lazygit()<cr>",
    " LazyGit"
  }

end

return M
