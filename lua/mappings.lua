local M = {
	other = {
		['<C-s>'] = { '<Esc>:w<CR>', mode = { 'n', 'i' }, desc = 'Save file' },
	},
	n = {
		['<Esc>'] = { ':nohl<CR>', desc = 'Clear highlights' },
		['<C-q>'] = { ':q<CR>', desc = 'Quit' },
		['<leader>Q'] = { ':q!<CR>', desc = 'Quit without saving' },

		['<C-h>'] = { '<C-w>h', desc = 'Go to left window' },
		['<C-j>'] = { '<C-w>j', desc = 'Go to lower window' },
		['<C-k>'] = { '<C-w>k', desc = 'Go to upper window' },
		['<C-l>'] = { '<C-w>l', desc = 'Go to right window' },

		['<A-j>'] = { ':m .+1<CR>==', desc = 'Move line down' },
		['<A-k>'] = { ':m .-2<CR>==', desc = 'Move line up' },

		['<leader>j'] = { ':split<CR>', desc = 'Split horizontaly' },
		['<leader>k'] = { ':vsplit<CR>', desc = 'Split verticaly' },
	},
	i = {
		['<A-j>'] = { '<Esc>:m .+1<CR>==gi', desc = 'Move line down' },
		['<A-k>'] = { '<Esc>:m .-2<CR>==gi', desc = 'Move line up' },

		['<C-h>'] = { '<left>', desc = 'Cursor left' },
		['<C-l>'] = { '<right>', desc = 'Cursor right' },
	},
	t = {
		['<A-q>'] = { '<C-\\><C-n>', desc = 'Enter normal mode' },
		['<C-h>'] = { '<cmd>wincmd h<CR>', desc = 'Go to left window' },
		['<C-j>'] = { '<cmd>wincmd j<CR>', desc = 'Go to lower window' },
		['<C-k>'] = { '<cmd>wincmd k<CR>', desc = 'Go to upper window' },
		['<C-l>'] = { '<cmd>wincmd l<CR>', desc = 'Go to right window' },
	},
}

require('core.utils').load_maps(M)
