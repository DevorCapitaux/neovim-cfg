return {
	'folke/trouble.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	cmd = 'Trouble',
	init = function()
		local M = {
			n = {
				['<leader>xx'] = { ':Trouble diagnostics toggle<CR>', desc = 'Diagnostics' },
				['<leader>xX'] = {
					':Trouble diagnostics toggle filter.buf=0<CR>',
					desc = 'Buffer Diagnostics',
				},
				['<leader>cs'] = {
					':Trouble symbols toggle focus=false<CR>',
					desc = 'Symbols',
				},
			},
		}

		require('core.utils').load_maps(M)
	end,
	opts = {},
}
