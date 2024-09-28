local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')

require('telescope').setup{
  defaults = {
    -- Layout and display options for better usability
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    file_ignore_patterns = { "node_modules", ".git/" },  -- Ignore certain directories
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,  -- Move down in the result list
        ["<C-k>"] = actions.move_selection_previous,  -- Move up in the result list
		},
    },
  },
  pickers = {
    -- Customize pickers for `find_files` or `live_grep` here if necessary
    find_files = {
      hidden = true,  -- Include hidden files in search
    },
    live_grep = {
      additional_args = function() return { "--hidden" } end  -- Grep in hidden files
    },
  },
  extensions = {
    -- Any extensions can be configured here
  },
}

-- Key mappings
vim.keymap.set('n', '<C-p>', builtin.git_files, {})  -- Search Git-tracked files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})  -- Search all files (hidden files included)
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})  -- Search text in project (live grep)
