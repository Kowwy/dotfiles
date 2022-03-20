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
	use {'nvim-treesitter/nvim-treesitter', config = get_setup('treesitter'), run = ':TSUpdate'}
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


	end)
