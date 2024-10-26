-- Harpoon Setup
local mark = require("harpoon.mark")  -- Manages marks for files (add, remove, etc.)
local ui = require("harpoon.ui")      -- Manages Harpoon's UI (e.g., quick menu)

-- Key mappings for Harpoon functionality

-- Add the current file to Harpoon's mark list
vim.keymap.set("n", "<leader>a", mark.add_file)

-- Toggle the Harpoon quick menu to view all marked files
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Quick navigation between marked files with shortcut keys
vim.keymap.set("n", "<C-y>", function() ui.nav_file(1) end)  -- Jump to first marked file
vim.keymap.set("n", "<C-u>", function() ui.nav_file(2) end)  -- Jump to second marked file
vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end)  -- Jump to third marked file
vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end)  -- Jump to fourth marked file
