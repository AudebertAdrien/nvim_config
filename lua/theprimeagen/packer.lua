-- Load plugins with Packer
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer manages itself
	use 'wbthomason/packer.nvim'

    -- Theme
	use { "catppuccin/nvim", as = "catppuccin" }
    
	-- Utilities
	use 'nvim-lua/plenary.nvim'
	use 'ThePrimeagen/harpoon'
	use 'mbbill/undotree'
   
	-- Icons
	use 'nvim-tree/nvim-web-devicons'

    -- Status Line
	use 'nvim-lualine/lualine.nvim'

	-- Fuzzy Finder
	use 'nvim-telescope/telescope.nvim'

	-- Syntax Highlighting and Code Parsing
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

end)
