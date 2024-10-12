return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files (Root Dir)" })
		vim.keymap.set("n", "<leader>:", builtin.command_history, { desc = "Command History" })
		vim.keymap.set("n", "<leader>,", function()
			builtin.buffers({ sort_mru = true, sort_lastused = true })
		end, { desc = "Switch Buffers" })
		vim.keymap.set("n", "<leader>fb", function()
			builtin.buffers({ sort_mru = true, sort_lastused = true })
		end, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sG", builtin.live_grep, { desc = "Grep (cwd)" })
	end,
}
