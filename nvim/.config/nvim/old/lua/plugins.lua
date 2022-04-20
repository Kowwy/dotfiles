vim.cmd([[
    augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

function Get_Setup(name)
	return string.format('require("setup/%s")', name)
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		config = Get_Setup("treesitter"),
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-lualine/lualine.nvim",
		config = Get_Setup("lualine"),
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = Get_Setup("catppuccin"),
	})
	use("nathom/filetype.nvim")
	use({
		"alvarosevilla95/luatab.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = Get_Setup("luatab"),
	})
	use({
		"neovim/nvim-lspconfig",
		config = Get_Setup("lspconfig"),
	})
	use({
		"williamboman/nvim-lsp-installer",
		config = Get_Setup("lsp-installer"),
	})
	use({
		"folke/which-key.nvim",
		config = Get_Setup("which-key"),
	})
	use({
		"windwp/nvim-autopairs",
		config = Get_Setup("autopairs"),
		--		after = 'nvim-cmp'
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-vsnip",
		},
		config = Get_Setup("autocomplete"),
	})
	use("onsails/lspkind-nvim")
end)
