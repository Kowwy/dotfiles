vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.list = false
vim.o.listchars = "tab:<->,eol:↴,space:⋅"

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

--Enable break indent
vim.o.breakindent = true

--Open windows to the right and below
vim.opt.splitbelow = true
vim.opt.splitright = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "auto:1-4"

--Set colorscheme
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

--Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noinsert,noselect"

--Switch diagnosticts to float
vim.cmd([[autocmd! CursorHold,CursorholdI * lua vim.diagnostic.open_float(nil, {focusable=false})]])
vim.diagnostic.config({
	virtual_text = false,
})

--Highlight on yank
vim.cmd([[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]])
