return {
	'nvim-telescope/telescope.nvim',
	dependencies = 'nvim-lua/plenary.nvim',
	init = function()
		local M = {
			n = {
				['<leader>f'] = { group = 'Find' },
				['<leader>ff'] = { ':Telescope find_files<CR>', desc = 'Find files' },
				['<leader>fa'] = {
					':Telescope find_files follow=true no_ignore=true hidden=true<CR>',
					desc = 'Find all',
				},
				['<leader>fw'] = { ':Telescope live_grep<CR>', desc = 'Live grep' },
			},
		}

		require('core.utils').load_maps(M)
	end,
	config = function()
		local telescope = require('telescope')
		local actions = require('telescope.actions')

		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = {
						preview_width = 0.55,
					},
				},
				mappings = {
					n = {
						q = actions.close,
					},
					i = {
						['<C-n>'] = actions.cycle_history_next,
						['<C-p>'] = actions.cycle_history_prev,
						['<C-j>'] = actions.move_selection_next,
						['<C-k>'] = actions.move_selection_previous,
						['<C-y>'] = actions.preview_scrolling_left,
						['<C-u>'] = actions.preview_scrolling_down,
						['<C-i>'] = actions.preview_scrolling_up,
						['<C-o>'] = actions.preview_scrolling_right,
					},
				},
			},
		})
	end,
}
