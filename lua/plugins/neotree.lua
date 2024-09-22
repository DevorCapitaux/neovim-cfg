return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{
			'<leader>e',
			':Neotree toggle float<CR>',
			silent = true,
			desc = 'File Explorer (floating)',
		},
		{ '<leader>E', ':Neotree toggle left<CR>', silent = true, desc = 'File Explorer' },
	},
	opts = {},
}
