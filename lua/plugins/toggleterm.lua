return {
	'akinsho/toggleterm.nvim',
	keys = {
		{
			'<leader>tf',
			':ToggleTerm direction=float<CR>',
			silent = true,
			desc = 'Toggle floating',
		},
		{
			'<leader>tj',
			':ToggleTerm direction=horizontal<CR>',
			silent = true,
			desc = 'Toggle horizontal',
		},
		{
			'<leader>tl',
			':ToggleTerm direction=vertical<CR>',
			silent = true,
			desc = 'Toggle vertical',
		},
	},
	init = function()
		local wk = require('which-key')

		wk.add({
			{ '<leader>t', group = 'Terminal' },
		})
	end,
	opts = {
		size = function(term)
			if term.direction == 'horizontal' then
				return 15
			elseif term.direction == 'vertical' then
				return vim.o.columns * 0.4
			end
		end,
		start_in_insert = true,
		float_opts = { border = 'curved' },
	},
}
