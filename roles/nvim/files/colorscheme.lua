return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
		priority = 1000,
	},
}
