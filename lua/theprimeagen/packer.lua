-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- theme
	use({
		'Mofiqul/dracula.nvim',
		config = function()
			vim.cmd('colorscheme dracula')
		end
	})

	-- 42
	use 'pbondoer/vim-42header' 

	-- css
	use 'lilydjwg/colorizer'

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
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

end)
