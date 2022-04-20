require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.eslint_d,
		require("null-ls").builtins.formatting.stylua,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
			augroup LspFormatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			augroup END
			]])
		end
	end,
})
