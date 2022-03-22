vim.cmd([[
    augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

function get_setup(name)
    return string.format('require("setup/%s")', name)
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'nvim-treesitter/nvim-treesitter', 
		config = get_setup('treesitter'), 
		run = ':TSUpdate'
	}
	use 'p00f/nvim-ts-rainbow'
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'nvim-lualine/lualine.nvim',
		config = get_setup('lualine'),
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'catppuccin/nvim',
		as = 'catppuccin',
		config = get_setup('catppuccin')
	}
	use 'nathom/filetype.nvim'
	use {
		'alvarosevilla95/luatab.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = get_setup('luatab')
	}
	use 'neovim/nvim-lspconfig'
	use {
		'williamboman/nvim-lsp-installer',
		config = get_setup('lsp-installer')
	}
	use {
		'folke/which-key.nvim',
		config = get_setup('which-key')
	}
	use {
		'windwp/nvim-autopairs',
		after = 'nvim-cmp'
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/vim-vsnip',
			'hrsh7th/cmp-vsnip'
		},
		config = get_setup('autocomplete')
	}
	use 'onsails/lspkind-nvim'


end)
