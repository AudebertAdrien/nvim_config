-- Undotree Commands Reference:
-- :UndotreeToggle       - Opens/closes the Undotree window, showing the undo history in a visual format
-- :UndotreeShow         - Opens the Undotree window if it’s not already open
-- :UndotreeHide         - Closes the Undotree window if it’s open
-- :UndotreeFocus        - Focuses the cursor on the Undotree window without toggling it

-- Key mapping to toggle Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)  -- Press <leader>u to toggle Undotree

-- Pane Navigation with Ctrl keys:
-- Use Ctrl-h to move to the left pane and Ctrl-l to move to the right pane
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Persistent undo setup
-- Enables Neovim to remember undo history across sessions by storing it in a specified directory
vim.cmd([[
if has("persistent_undo")
   let target_path = expand('~/.undodir')

   if !isdirectory(target_path)
       call mkdir(target_path, "p", 0700)
   endif

   let &undodir = target_path  
   set undofile                
endif
]])
