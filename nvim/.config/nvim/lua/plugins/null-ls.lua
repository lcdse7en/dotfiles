local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting

local mappings = require "core.mappings"

null_ls.setup {
	sources = {
		formatting.clang_format,
		formatting.gofmt,
		formatting.goimports,
		formatting.prettierd,
		formatting.rustfmt,
		formatting.stylua,
	},
	-- function(client, bufnr)
	on_attach = function(_, _)
		mappings.null_ls()
	end,
}
