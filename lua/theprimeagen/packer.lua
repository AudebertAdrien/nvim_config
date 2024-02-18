-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- theme
	use { "catppuccin/nvim", as = "catppuccin" }

	-- 42
 	use 'pbondoer/vim-42header' 

	-- switch quickly between saved file 'u''i''o''p'
	use('nvim-lua/plenary.nvim')
	use('ThePrimeagen/harpoon')

	use 'mbbill/undotree'

	use 'nvim-tree/nvim-web-devicons'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use('nvim-treesitter/playground')

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

end)
