-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[
	augroup Packer
		autocmd!
		autocmd BufWritePost init.lua PackerCompile
	augroup end
]])

function Get_Setup(name)
	return string.format('require("setup/%s")', name)
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("nathom/filetype.nvim") -- replacement for filetype.vim, 175x faster
	use({ "windwp/nvim-autopairs", config = Get_Setup("autopairs") })
	use("rafamadriz/friendly-snippets")
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", config = Get_Setup("telescope") })
	use("mjlbach/onedark.nvim") -- Theme inspired by Atom
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = Get_Setup("lualine"),
	}) -- Fancier statusline
	use({ "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons", config = Get_Setup("luatab") })
	use({ "folke/which-key.nvim", config = Get_Setup("whichkey") })
	use({ "jose-elias-alvarez/null-ls.nvim", config = Get_Setup("null-ls") })

	-- Add indentation guides even on blank lines
	use({ "lukas-reineke/indent-blankline.nvim", config = Get_Setup("indent_blankline") })
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = Get_Setup("gitsigns") })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = Get_Setup("treesitter") })
	use("p00f/nvim-ts-rainbow")
	use("kyazdani42/nvim-web-devicons")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "neovim/nvim-lspconfig", config = Get_Setup("lspconfig") }) -- Collection of configurations for built-in LSP client
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = Get_Setup("catppuccin"),
	})
	use({
		"dracula/vim",
		as = "dracula",
	})
	-- Autocompletion plugin
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"ray-x/cmp-treesitter",
		},
		config = Get_Setup("cmp"),
	})
	use("onsails/lspkind-nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use({ "nvim-neorg/neorg", config = Get_Setup("neorg"), requires = "nvim-lua/plenary.nvim" })
end)

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.list = false
vim.o.listchars = "tab:<->,eol:↴,space:⋅"

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
vim.cmd([[colorscheme dracula]])

--Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noinsert,longest"

--Switch diagnosticts to float
vim.cmd([[autocmd! CursorHold,CursorholdI * lua vim.diagnostic.open_float(nil, {focusable=false})]])
vim.diagnostic.config({
	virtual_text = false,
})

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Highlight on yank
vim.cmd([[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]])

--Gitsigns

--Add leader shortcuts
--vim.api.nvim_set_keymap()
vim.api.nvim_set_keymap(
	"n",
	"<leader><space>",
	"<cmd>lua require('telescope.builtin').buffers()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fh",
	"<cmd>lua require('telescope.builtin').help_tags()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ft",
	"<cmd>lua require('telescope.builtin').tags()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fs",
	"<cmd>lua require('telescope.builtin').grep_string()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	"<cmd>lua require('telescope.builtin').live_grep()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>so",
	"<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>?",
	"<cmd>lua require('telescope.builtin').oldfiles()<CR>",
	{ noremap = true, silent = true }
)

--Diagnostic keymaps
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { noremap = true, silent = true })
