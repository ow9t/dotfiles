-- Set ~ as the leader key
-- See `:help mapleader`
-- NOTE: Must be set before plugins are loaded
vim.g.mapleader = "~"
vim.g.maplocalleader = "~"

-- Set whether a Nerd Font is installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- For more options, see `:help option-list`

-- Enable absolute line numbers
vim.opt.number = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Enable case-insensitive search unless \C or the search term contains capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 500

-- Configure how new splits should be openend
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set how neovim will display certain whitespace characters
-- See `:help 'list'` and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
	eol = "¬",
	multispace = "·",
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show which line the cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- Set tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Set background and colors
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Move current line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste by deleting the highlighted word into the black hole register
vim.keymap.set("x", "<leader>p", '"_dP')

-- Paste from clipboard register
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- Yank selection to clipboard register
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Delete to black hole register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Highlight when yanking text
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Clear highlight groups of the @lsp namespace
-- NOTE: This should be executed before setting the colorscheme
-- https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/
vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "Clear LSP highlight groups",
	callback = function()
		for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
			vim.api.nvim_set_hl(0, group, {})
		end
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Install plugins ]]
--
-- To check the current status of your plugins, run
--   :Lazy
--
-- You can press `?` in this menu for help. Use `:q` to close the window
--
-- To update plugins you can run
--   :Lazy update
--
-- Configuration is done in the respective `lua/plugins/*.lua` files
-- See https://github.com/folke/lazy.nvim?tab=readme-ov-file#-structuring-your-plugins
require("lazy").setup("plugins")
