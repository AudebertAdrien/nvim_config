-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { "catppuccin/nvim", as = "catppuccin" }

	use 'nvim-lua/plenary.nvim'
	use 'ThePrimeagen/harpoon'

	use 'mbbill/undotree'

	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'

	use 'nvim-telescope/telescope.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

end)
