vim.cmd [[autocmd! CursorHold,CursorholdI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.diagnostic.config({
	virtual_text = false,
})

