return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	lazy = false,
	init = function()
		local M = {
			n = {
				['<Tab>'] = { ':BufferLineCycleNext<CR>', desc = 'Next buffer' },
				['<S-Tab>'] = { ':BufferLineCyclePrev<CR>', desc = 'Next buffer' },
				['<leader>b'] = { group = 'Buffer' },
				['<leader>bh'] = { ':BufferLineMovePrev<CR>', desc = 'Move left' },
				['<leader>bl'] = { ':BufferLineMoveNext<CR>', desc = 'Move right' },
				['<leader>bp'] = { ':BufferLineTogglePin<CR>', desc = 'Pin' },
				['<leader>bx'] = {
					function()
						local buf_num = #vim.tbl_filter(function(buf)
							return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
						end, vim.api.nvim_list_bufs())

						if buf_num - 1 == 0 then
							vim.cmd(':enew | bd#')
						else
							vim.cmd(':bp | bd#')
						end
					end,
					desc = 'Close current',
				},
				['<leader>bc'] = { group = 'Close' },
				['<leader>bch'] = { ':BufferLineCloseLeft<CR>', desc = 'Close left' },
				['<leader>bcl'] = { ':BufferLineCloseRight<CR>', desc = 'Close right' },
				['<leader>bcj'] = { ':BufferLineCloseOthers<CR>', desc = 'Close others' },
				['<leader>bck'] = { ':BufferLinePickClose<CR>', desc = 'Pick close' },
			},
		}

		require('core.utils').load_maps(M)
	end,
	opts = {},
}
