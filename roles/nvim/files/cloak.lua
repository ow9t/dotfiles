return {
	"laytan/cloak.nvim",
	opts = {
		cloak_character = "×",
		cloak_length = 8,
		patterns = {
			{
				file_pattern = '.env*',
				cloak_pattern = '=.+',
				replace = nil,
			},
		},
	},
}
