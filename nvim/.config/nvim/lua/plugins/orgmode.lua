-- Load custom tree-sitter grammar for org filetype
require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  -- ensure_installed = "maintained",
  ensure_installed = { "org" },
}

require("orgmode").setup {
  org_agenda_files = { "~/Dropbox/org/*" },
  org_default_notes_file = "~/Dropbox/org/refile.org",
  mappings = {
    global = {
      org_agenda = "<leader>oa",
      org_capture = "<leader>oc",
    },
    agenda = {
      org_agenda_todo = "t",
    },
    org = {
      org_todo = "t",
      org_global_cycle = "X",
      org_cycle = "x",
      org_insert_todo_heading = "<leader>a",
    },
  },
}

vim.g.completion_chain_complete_list = {
  org = {
    { mode = "omni" },
  },
}

vim.cmd "language en_US.utf8"
vim.cmd [[autocmd FileType org setlocal iskeyword+=:,#,+]]
