-- Install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

function Get_Setup(name)
	return string.format('require("setup/%s")', name)
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use({
		"numToStr/Comment.nvim",
		config = Get_Setup("comment"),
	})
	use("nathom/filetype.nvim")
	use({ "windwp/nvim-autopairs", config = Get_Setup("autopairs") })
	use("rafamadriz/friendly-snippets")
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", config = Get_Setup("telescope") })
	use("mjlbach/onedark.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = Get_Setup("lualine"),
	})
	use({ "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons", config = Get_Setup("luatab") })
	use({ "folke/which-key.nvim", config = Get_Setup("whichkey") })
	use({ "jose-elias-alvarez/null-ls.nvim", config = Get_Setup("null-ls") })
	use({ "lukas-reineke/indent-blankline.nvim", config = Get_Setup("indent_blankline") })
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = Get_Setup("gitsigns") })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = Get_Setup("treesitter") })
	use("p00f/nvim-ts-rainbow")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "neovim/nvim-lspconfig", config = Get_Setup("lspconfig") })
	use({ "ellisonleao/gruvbox.nvim" })
	use({
		"dracula/vim",
		as = "dracula",
	})
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
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("tjdevries/train.nvim")
	use("ellisonleao/glow.nvim")
	use({ "vimwiki/vimwiki", branch = "dev", config = Get_Setup("wiki") })
	use("tools-life/taskwiki")
	-- use({ "nvim-neorg/neorg", config = Get_Setup("neorg"), requires = "nvim-lua/plenary.nvim" })
	if packer_bootstrap then
		require("packer").sync()
	end
end)
