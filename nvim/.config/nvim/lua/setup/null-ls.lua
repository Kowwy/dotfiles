local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

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
					lsp_formatting(bufnr)
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
