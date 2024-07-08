return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "ellisonleao/gruvbox.nvim" },
		config = function()
			local palette = require("gruvbox").palette

			require("lualine").setup({
				-- TODO: customize sections
				-- See `:help lualine-usage-and-customization`
				options = {
					-- icons_enabled = false,
					component_separators = "",
					section_separators = "",
					theme = {
						inactive = { c = { bg = palette.dark0, fg = palette.light1 } },
						normal = { c = { bg = palette.dark0, fg = palette.light1 } },
					},
				},
			})
		end,
	},
}
