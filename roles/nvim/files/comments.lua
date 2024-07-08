return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
		event = "VimEnter",
	},
	{
		"folke/ts-comments.nvim",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
		opts = {},
		event = "VeryLazy",
	},
}
