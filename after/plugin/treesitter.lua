-- Treesitter Commands Reference:
-- :TSInstall <language>          - Installs the specified parser (e.g., :TSInstall python)
-- :TSInstallInfo                 - Shows installed parsers and their status
-- :TSUpdate                      - Updates all installed parsers
-- :TSUpdateSync                  - Synchronously updates all parsers (useful for scripting)
-- :TSUninstall <language>        - Uninstalls the specified parser
-- :TSEnable <module>             - Enables a specific Treesitter module (e.g., highlight)
-- :TSDisable <module>            - Disables a specific Treesitter module
-- :TSEnableAll                   - Enables all Treesitter modules for current buffer
-- :TSDisableAll                  - Disables all Treesitter modules for current buffer
-- :TSPlaygroundToggle            - Opens the Treesitter playground for inspecting syntax nodes
-- :TSHighlightCapturesUnderCursor - Shows highlight groups for syntax under the cursor

require'nvim-treesitter.configs'.setup {
	-- Specify which language parsers to install; "all" installs all available parsers
	-- Modify this list to include or exclude languages as desired
	ensure_installed = {"python", "lua", "javascript", "typescript", "c", "cpp", "rust" },

	-- Choose whether parsers should be installed synchronously when using `ensure_installed`
	-- Useful for automated setup or scripts; async installs are generally faster
	sync_install = false,

	-- Auto-install missing parsers when opening files
	-- Recommended to set to `false` if `tree-sitter` CLI is not installed on your system
	auto_install = true,

	-- Highlight settings
	highlight = {
		-- Enables the Treesitter-based syntax highlighting
		enable = true,

		-- Whether to run `:h syntax` and Treesitter at the same time.
		-- Set to `true` if you rely on `vim` syntax highlighting in addition to Treesitter
		additional_vim_regex_highlighting = false,

		-- Disable Treesitter highlighting for specific languages
		-- Example: `vimdoc` parser has known issues, so it's disabled here
		disable = { "vimdoc" },
	},

	-- Incremental selection based on the current cursor position
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",       -- Start selection with `gnn`
			node_incremental = "grn",     -- Expand selection to the next "node" with `grn`
			scope_incremental = "grc",    -- Expand selection to the scope with `grc`
			node_decremental = "grm",     -- Shrink selection with `grm`
		},
	},

	-- Text object selection, allowing quick selection of code blocks by syntax nodes
	textobjects = {
		select = {
			enable = true,
			lookahead = true,             -- Automatically jump to the next match
			keymaps = {
				["af"] = "@function.outer", -- Select the entire function block
				["if"] = "@function.inner", -- Select only the inner part of the function
				["ac"] = "@class.outer",    -- Select the entire class block
				["ic"] = "@class.inner",    -- Select only the inner part of the class
			},
		},
	},

	-- Treesitter playground settings, providing an interactive environment to experiment with Treesitter
	playground = {
		enable = true,                     -- Enable the playground
		disable = {},                      -- Specify languages to disable playground for
		updatetime = 25,                   -- Debounce time for playground refresh (milliseconds)
		persist_queries = false,           -- Whether playground queries persist between sessions
		keybindings = {
			toggle_query_editor = 'o',         -- Open query editor with `o`
			toggle_hl_groups = 'i',            -- Toggle highlight groups with `i`
			toggle_injected_languages = 't',   -- Toggle injected languages with `t`
			toggle_anonymous_nodes = 'a',      -- Toggle anonymous nodes with `a`
			toggle_language_display = 'I',     -- Toggle language display with `I`
			focus_language = 'f',              -- Focus on language under cursor with `f`
			unfocus_language = 'F',            -- Unfocus language with `F`
			update = 'R',                      -- Refresh the playground with `R`
			goto_node = '<cr>',                -- Jump to node under cursor with Enter
			show_help = '?',                   -- Show playground help with `?`
		},
	},
}
