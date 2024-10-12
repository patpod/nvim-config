return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			mode = { "n", "v" },
			{ "<leader>f", group = "file/find" },
			{ "<leader>s", group = "search" },
			{ "<leader>c", group = "code" },
		},
	},
}
