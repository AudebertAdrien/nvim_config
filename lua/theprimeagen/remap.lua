vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move to the left pane (Undotree) with Alt+h
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })

-- Move to the right pane (Main editor) with Alt+l
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = false
vim.opt.expandtab = false

vim.opt.breakindent = true

vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = vim.fn.expand("$HOME/.config/nvim/backup//")

vim.o.ttimeoutlen = 0  -- Set to 0 to remove the delay for escape key

vim.o.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml",
	callback = function()
		vim.opt_local.tabstop = 2       -- A tab character represents 2 spaces
		vim.opt_local.shiftwidth = 2    -- Indent/outdent uses 2 spaces
		vim.opt_local.expandtab = true  -- Use spaces instead of tabs

		vim.opt.list = true    -- Enable displaying hidden characters
		vim.opt.listchars = {
			tab = '› ',        -- Display tabs as '› '
			trail = '·',       -- Display trailing spaces as dots
			extends = '>',     -- Mark when text goes beyond the screen width
			precedes = '<',    -- Mark when text goes beyond the left side of the screen
			space = '·'        -- Display spaces as dots
		}
	end,
})
