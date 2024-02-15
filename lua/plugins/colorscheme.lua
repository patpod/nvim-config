return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		lazy = false,
		config = function()
			require('catppuccin').setup({
				flavour = 'macchiato',
				dim_inactive = {
					enabled = true,
				}
			})
			vim.cmd.colorscheme('catppuccin')
		end,
	}
}
