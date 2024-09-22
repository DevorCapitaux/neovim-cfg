return {
	'numToStr/Comment.nvim',
	keys = {
		{ 'gcc', mode = 'n' },
		{ 'gco', mode = 'n' },
		{ 'gcO', mode = 'n' },
		{ 'gcA', mode = 'n' },
		{ 'gbc', mode = 'n' },
		{ 'gc', mode = 'v' },
		{ 'gb', mode = 'v' },
	},
	init = function()
		local comment = require('Comment.api')
		local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)

		local M = {
			n = {
				['<leader>/'] = {
					function()
						comment.toggle.linewise.current()
					end,
					desc = 'Toggle comment',
				},
			},
			x = {
				['<leader>/'] = {
					function()
						vim.api.nvim_feedkeys(esc, 'nx', false)
						comment.toggle.linewise(vim.fn.visualmode())
					end,
					desc = 'Toggle comment',
				},
			},
		}

		require('core.utils').load_maps(M)
	end,
	opts = {},
}
