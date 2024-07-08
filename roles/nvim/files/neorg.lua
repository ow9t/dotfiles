return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			{
				"vhyrro/luarocks.nvim",
				priority = 1000,
				config = true,
			},
		},
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Notes/personal",
							work = "~/Notes/work",
						},
						default_workspace = "notes",
					},
				},
			},
		},
		config = function(_, opts)
			-- [[ Configure neorg ]]
			-- See `:help neorg`

			---@diagnostic disable-next-line: missing-fields
			require("neorg").setup(opts)

			vim.wo.foldlevel = 99
			-- Completely hide concealed text unless it has a custom replacement character defined
			-- See `:help 'conceallevel'`
			vim.wo.conceallevel = 2
		end,
	},
}
