local builtin = require('telescope.builtin')  -- Built-in pickers (e.g., find_files, live_grep)
local actions = require('telescope.actions')  -- Action mappings (e.g., move_selection)
local actions_state = require('telescope.actions.state')  -- Manages the state of actions

require('telescope').setup{
    defaults = {
        -- Layout Configuration
        layout_strategy = "horizontal",           -- Use horizontal layout for results and preview
        layout_config = {
            prompt_position = "top",              -- Position the prompt at the top of the window
            width = 0.8,                          -- Set the layout to use 80% of the editor width
            height = 0.9,                         -- Set the layout to use 90% of the editor height
            preview_cutoff = 80,                  -- Disable preview when window width is below 80 columns
        },

        -- Sorting Strategy
        sorting_strategy = "ascending",           -- Sort results in ascending order

        -- Ignore Patterns
        file_ignore_patterns = { "node_modules", ".git/" }, -- Ignore large or irrelevant directories

        -- Key Mappings (Insert Mode)
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,    -- Move down the selection list
                ["<C-k>"] = actions.move_selection_previous, -- Move up the selection list
            },
        },
    },

    pickers = {
        -- Find Files Picker
        find_files = {
            hidden = true,                      -- Show hidden files when searching
        },

        -- Live Grep Picker
        live_grep = {
            additional_args = function() return { "--hidden" } end  -- Search hidden files in live grep
        },
    },

    extensions = {
        -- Extension configurations go here
    },
}

-- Key Mappings for Telescope
vim.keymap.set('n', '<C-p>', builtin.git_files, {})       -- Find Git-tracked files in the project
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Search all files, including hidden files
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})  -- Search for text in the project with live grep
