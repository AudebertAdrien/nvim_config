-- Packer Commands Reference:
-- :PackerInstall       - Installs all plugins listed in the configuration
-- :PackerUpdate        - Updates all installed plugins
-- :PackerSync          - Runs install, update, and clean commands in sequence (useful after modifying plugins)
-- :PackerClean         - Removes any plugins that are no longer listed in the configuration
-- :PackerCompile       - Compiles the plugins to improve startup time (recommended after changing the plugin list)
-- :PackerStatus        - Shows the current status of all plugins
-- :PackerProfile       - Profiles plugin load times (useful for optimizing startup time)

-- Load plugins with Packer
vim.cmd [[packadd packer.nvim]]  -- Ensure Packer is available before loading plugins

return require('packer').startup(function(use)
    -- Packer can manage itself, allowing for seamless updates and management
    use 'wbthomason/packer.nvim'

    -- Theme: Catppuccin
    -- A beautiful color scheme with several palette options, providing a soft and visually pleasing appearance
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Utilities
    -- Plenary: A Lua library used by many Neovim plugins, providing essential functions (e.g., async handling, file manipulation)
    use 'nvim-lua/plenary.nvim'

    -- Harpoon: Quickly navigate between frequently-used files or marks for efficient workflow management
    use 'ThePrimeagen/harpoon'

    -- UndoTree: Visualize and navigate through file undo history
	use 'mbbill/undotree'

    -- Icons: Provides file-type icons for a better user experience, especially in file explorers and status lines
    use 'nvim-tree/nvim-web-devicons'

	use 'nvim-tree/nvim-tree.lua'

    -- Status Line: Lualine
    -- A highly customizable status line to display essential information (e.g., mode, file type, Git status)
    use 'nvim-lualine/lualine.nvim'

    -- Fuzzy Finder: Telescope
    -- A powerful fuzzy finder allowing quick file searching, live grep, buffer switching, and more
    use 'nvim-telescope/telescope.nvim'

    -- Syntax Highlighting and Code Parsing: Treesitter
    -- A modern parsing library that provides enhanced syntax highlighting, indentation, and code navigation
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            -- Ensures that all parsers are updated and synchronized on installation
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
end)
