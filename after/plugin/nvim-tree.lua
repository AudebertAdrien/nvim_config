-- Function to set custom key mappings when `nvim-tree` is attached
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  -- Map Enter key (<CR>) in nvim-tree to open files or folders normally
  -- This restores the default Enter behavior in `nvim-tree`, fixing any issues
  vim.keymap.set('n', '<CR>', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })

  -- Unbind `C-e` in the `nvim-tree` pane to avoid conflicts with other plugins (e.g., Harpoon)
  -- This leaves `C-e` available for use elsewhere without interference
  vim.keymap.set('n', 'C-e', '', { buffer = bufnr })

  -- (Optional) Add other custom mappings here as needed
end

-- Load and configure `nvim-tree` plugin
require'nvim-tree'.setup {
  -- on_attach = my_on_attach,          -- Use `my_on_attach` to apply custom key mappings on attachment

  -- Settings to replace Neovim's built-in netrw with `nvim-tree`
  disable_netrw = false,              -- Disables Neovim's default file explorer (netrw)
  hijack_netrw = false,               -- Hijacks netrw to open `nvim-tree` by default instead

  -- Sync `nvim-tree` root with current working directory and update on buffer change
  update_focused_file = {
    enable = true,                   -- Enable automatic highlighting of the active file in `nvim-tree`
    update_root = true,              -- Set `nvim-tree` root to the current file's folder when entering it
  },

  -- Configure the appearance and position of `nvim-tree`
  view = {
    width = 30,                      -- Set the width of the file explorer window to 30 columns
    side = "left",                   -- Position the file explorer window on the left side of the editor
  },
}

--vim.api.nvim_create_autocmd("BufEnter", {
--  pattern = "*",
 -- callback = function()
  --  if vim.bo.filetype == "NvimTree" then
   --   vim.cmd("NvimTreeClose")
    --end
  --end,
--})


-- Open `netrw` with `<leader>pv` for general file navigation
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { noremap = true, silent = true })

-- Quickly toggle `nvim-tree` file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Refresh `nvim-tree` if there are changes in the file system
vim.keymap.set('n', '<leader>r', ":NvimTreeRefresh<CR>", { noremap = true, silent = true })

-- Focus on the current file in `nvim-tree`
vim.keymap.set('n', '<leader>f', ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

