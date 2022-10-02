-- require("null-ls").setup({
-- on_attach = function(client)
-- 	if client.resolved_capabilities.document_formatting then
-- 		vim.cmd([[
-- 		augroup LspFormatting
-- 			autocmd! * <buffer>
-- 			autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
-- 		augroup END
-- 		]])
-- 	end
-- end,
-- })
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	-- you can reuse a shared lspconfig on_attach callback here
	sources = {
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.eslint_d,
		require("null-ls").builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
